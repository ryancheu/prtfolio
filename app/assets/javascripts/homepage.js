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
		   updateURL: false,
		   beforeMove: function(index) {
		   	fns = [
		   		function() {
		   			$('#welcome').addClass('active');
		   			$('#features').removeClass('active');
		   			$('#aboutus').removeClass('active');
		   		},
		   		function() {
		   			$('#welcome').removeClass('active');
		   			$('#features').addClass('active');
		   			$('#aboutus').removeClass('active');
		   		},
		   		function() {
		   			$('#welcome').removeClass('active');
		   			$('#features').removeClass('active');
		   			$('#aboutus').addClass('active');
		   		}
		   	];
		   	fns[index-1]();
			}
		})
	}
}
	


