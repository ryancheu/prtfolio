//This takes public code from github using the github api,
//loads it in and formats it with a slightly modified SyntaxHighlighter
//@primaryauthor ryancheu, with various parts taken from other places and noted
var CodeImport = function() {
    var _startLineNumber = null;
    var _endLineNumber = null;

    //Extract github parameters from a file url in the online viewer
    //Private function
    function extractGithubParams(url) {
        //This regex just extracts the repo name, path and branch from the url
        var rx = /.*github.com\/([^\/]*)\/([^\/]*)\/blob\/([^\/]*)\/([A-z\/.]*)/g;
        var arr = rx.exec(url);
        return arr;
    }

    //Get the code from github 
    //Private function
    var fetechCodeFromGithub = function(link, callback) {
        arr = extractGithubParams(link);
        //http://developer.github.com/v3/repos/contents/
        url = "https://api.github.com/repos/" + arr[1] + "/" + arr[2] + "/contents/"+arr[4]+"?ref="+arr[3];
        $.ajax({
            type: "GET",
            url: url,
            dataType: "jsonp",
            success: displayCode
        });
        
    };

    //This function takes the base 64 code and returns it as human readable text
    //I took this code from this blog:
    //http://www.jamesward.com/2012/06/15/dynamically-rendering-github-files-in-web-pages
    //Private function
    var getCodeContent = function(data) { 
        startLineNum = (typeof startLineNum == "undefined") ? 1 : startLineNum
        endLineNum = (typeof endLineNum == "undefined") ? 0 : endLineNum

        if (typeof data.data.content != "undefined") {
            if (data.data.encoding == "base64") {
                var base64EncodedContent = data.data.content
                base64EncodedContent = base64EncodedContent.replace(/\n/g, "")
                
                var content = window.atob(base64EncodedContent)
                
                var contentArray = content.split("\n")
                
                if (endLineNum == 0) {
                    endLineNum = contentArray.length
                }
                
                return contentArray.slice(startLineNum - 1, endLineNum).join("\n");
            }
        }
        return "";
    }
    
    //Given the code in base64 encoded format, decode it and display on page
    //Private function
    var displayCode = function(data) {
        var result = getCodeContent(data);
        //Need to escape the "<" properly or it will fail
        result = result.replace(/\"/g, "").replace(/</g, '&lt;');
        $('#code_area').html(result);
        SyntaxHighlighter.run();
        $('#code_area').attr("data",result);
    };
    

    //This function is run when the use releases their mouse
    //It tries to highlight the selected lines of code if code was selected
    //Private function
    var getLinesSelected = function() {
        var s;
        var e;
        sel = window.getSelection();
        //In the selected elements, look for the ones that have the parent with class "container"
        //These are the whole line divs that syntax highlighter generates
        for (var i = 0; i < sel.rangeCount; i++) {
            node = sel.getRangeAt(i).startContainer;
            while ( node != null && node.parentNode != null && node.parentNode.className != "container" ) {
                node = node.parentNode;
            }
            if ( node != null && node.parentNode && node.parentNode.className == "container") {
                s = node;
            }

            node = sel.getRangeAt(i).endContainer;
            while ( node != null && node.parentNode != null && node.parentNode.className != "container" ) {
                node = node.parentNode;
            }
            if ( node != null && node.parentNode && node.parentNode.className == "container") {
                e = node;
            }
        }

        //If start and end line divs were found
        if ( s && e ) { 
            var startClasses = s.className;
            var endClasses = e.className;


            //This section finds the line number from the two divs
            //Idk why it uses two different regex objects, it wasn't working before
            //might be worth investigating at some point
            var rx = /number([0-9]*)/g;
            var rx2 = /number([0-9]*)/g;
            var startMatch = rx.exec(startClasses);
            var endMatch = rx2.exec(endClasses);
            //If no matches found, exit
            if ( !startMatch || !endMatch ) {
                return; //EARLY RETURN
            }
            var startLine = parseInt(startMatch[1]);
            var endLine = parseInt(endMatch[1]);
            
            //Set the line numbers that are currently being displayed so we can grab the code from them later
            _startLineNumber = startLine;
            _endLineNumber = endLine;
            
            //The syntax highlighter class doesn't take ranges, only a string
            //formatted like an array of all the lines to highlight
            var numLinesHighlight = endLine-startLine + 1;
            var lineNumberArray = new Array(numLinesHighlight);
            for ( var i = 0; i < numLinesHighlight; i++) {
                lineNumberArray[i] = startLine+i;
            }

            var data = $('#code_area').attr("data");
            var language = $('#language_select').val();
            
            $('#code_area').replaceWith($('<pre id="code_area">' +data+ '</pre>'));
            $('#code_area').addClass("highlight: [" + lineNumberArray.toString() + "]");
            $('#code_area').addClass("brush: " + language);

            $('#code_area').html(data);
            SyntaxHighlighter.run();

            $('#code_area').attr("data",data);
        }
        
    }

    var getCodeFromSelection = function() {
        codeText = $('#code_area').attr("data");
        if ( codeText && _endLineNumber - _startLineNumber > 0) {
            returnText = "";
            codeLines = codeText.split("\n");
            for ( var i = _startLineNumber - 1; i <= _endLineNumber; i++ ) {
                returnText = returnText + codeLines[i] + "\n";
            }
            return returnText;
        }
        else{ 
            //TODO: Make better error handling
            alert("Error, no code selected, please select a block of code");
            return null;
        }
    }

    //Prepare page for syntax and code highlighting
    //Public function
    var initializeHighlighting = function() { 
        //Turn off the line numbers since they don't work for big code blocks
        SyntaxHighlighter.defaults['gutter'] = false;
        //When the user releases mouse, check for code selection
        document.onmouseup = getLinesSelected;
        document.onkeyup = getLinesSelected;
    }

    
    //Just register the button to load in code from github
    //Public function
    var registerLoadButton = function() { 
        $('#loadCodeButton').click(
            function (e) {
                e.preventDefault();
                var language = $('#language_select').val();
                $('#code_area').replaceWith($('<pre id="code_area" class="brush: ' + language + '">' + '</pre>'));
                var linkString = $('#code_link').val();
                fetechCodeFromGithub(linkString, displayCode);
            }
        );
        return true;
    }

    return {
        registerLoadButton : registerLoadButton,
        initializeHighlighting : initializeHighlighting,
        getCodeFromSelection : getCodeFromSelection
    }
}

ci = CodeImport();

var PrepareCodeImportModule = function() {
    $("#new_code").submit(function(e){
        e.preventDefault();
        var form = this;
        thecode = ci.getCodeFromSelection();

        var s = document.createElement("input");
        s.type="hidden"; s.name="code[content]"; s.value=thecode; s.id="code_content";
        
        var codeLanguage = $('#language_select').val();
        var t = document.createElement("input");
        t.type="hidden"; t.name="code[language]"; t.value=codeLanguage; t.id="code_language";
        
        form.appendChild(s);
        form.appendChild(t);
        $("#new_code").trigger("submit.rails");
    });

    ci.registerLoadButton();
    

}

$(document).ready( function() {

    ci.initializeHighlighting();
}
                 );




