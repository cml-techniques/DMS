jQuery(document).ready(function( $ ) {

		//Mobile Menu Toggle
		$('.menu-toggle').click(function() {
		  $(".header-right").slideToggle();
		  $(".social-dash").slideUp();
		  return false;
		});	
		// $(window).resize(function() {
		// 	var width = $(window).width();
		// 	if (width < 680) {
		// 		$(".header-wrapper").after($(".header-right"));
		// 	}
		// });

		//Flexslider
		//$(window).load(function() {
		//	$('#header-slider').flexslider({
		//		start: function(slider) {
		//		if (slider.count == 1) {
		//		 $('.flex-control-nav, .flex-direction-nav').hide();
		//		}
		//		},
		//		slideshow: false,
		//		animationDuration: 200
		//	});

		//	$('.flexslider').flexslider();
		//});


		//// Add Lightbox To Slides
		//$(".single .slides li a,.gallery-icon a").addClass("view");
	 	//$(".single .slides li a,.gallery-icon a").attr('rel', 'lightbox');

		// Tab Box
		$("ul.tabs").tabs("div.panes_ > div", { effect: "fade" });
		$("ul.tabs1").tabs1("div.panes > div", { effect: "fade" });
		$("ul.tabs3").tabs("div.panes_ > div", { effect: "fade" });
		$("ul.tabs4").tabs("div.panes_ > div", { effect: "fade" });

		$('.hidden-toggle').click(function() {
		  $('.header-hidden').slideToggle('fast', function() {
		    // Animation complete.
		  });
		  $(".header-hidden-toggle-wrap").toggleClass("show-hidden");
		});

		//FitVids
		//$("iframe").wrap("<div class='fitvid'/>");
		//$(".fitvid").fitVids();


		//Video iFrame Fix
		$('iframe').each(function(){
	        var url = $(this).attr("src");
	        $(this).attr("src",url);
	    })

		//Social Dash Toggle

		//Add Mobile Class To Body
		function checkWindowSize() {
		    if ( $(window).width() < 680 ) {
		        $('body').addClass('mobile');
		        $('body').removeClass('desktop');
		        $(".header-wrapper").after($(".header-right"));
		    }
		    else {
		        $('body').removeClass('mobile');
		        $('body').addClass('desktop');
		        $(".header-toggles").after($(".header-right"));
		        $(".header-right").show();
		    }
		}
		$(window).load(checkWindowSize);
		$(window).resize(checkWindowSize);

		//Append Social Dash Link
		$(".nav-dash-toggle").show();
		$(".nav-dash-toggle").appendTo('.nav-top ul:first-child');

		//Hide Dash / Toggle
		$(".social-dash").hide();
		$('.dash-toggle').click(function() {
		  $(".social-dash").slideToggle();
		  $(".mobile .header-right").slideUp();
		  $(".desktop .nav-dash-toggle").toggleClass("dash-active");
		  return false;
		});

		//Service Box Sizing
		$(window).resize( function() {
		    var $column = $('.column-wrap'),
		        maxHeight = 0;

		    $column.each( function() {
		        $(this).removeAttr('style');
		        if($(this).height() > maxHeight) {
		            maxHeight = $(this).height();
		        }
		    });

		    $column.height(maxHeight);
		}).trigger('resize');

});
