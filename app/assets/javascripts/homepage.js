onReady = function(){
	if ($("#onepage")[0]==undefined){
		$(document).unbind('mousewheel DOMMouseScroll')
	}
	else{
		$(".main").onepage_scroll({
		   sectionContainer: "section", 
		   easing: "ease",
		   animationTime: 1000,
		   pagination: true,
		   updateURL: false
		})
	}
}
	


