var $window = $(window);
    window.cust = window.cust ? window.cust : {};

// get window width && height
var gW  = $window.outerWidth(true),
    gH  = $window.outerHeight(true);

$window.on('resize', function(){
    gIw = $window.innerWidth(true);
    gIh = $window.innerHeight(true);
});

// function loadComponent(a){
//     // function for simplify component load check
//     var elem = $(a.name);
//
//     if(elem.length > 0) require(a.req, function(init){if(init)init(elem, arguments);});
// };

function debounce(func, wait, immediate) {
	var timeout;
	return function() {
		var context = this, args = arguments;
		var later = function() {
			timeout = null;
			if (!immediate) func.apply(context, args);
		};
		var callNow = immediate && !timeout;
		clearTimeout(timeout);
		timeout = setTimeout(later, wait);
		if (callNow) func.apply(context, args);
	};
};

function detectBrowser() {
    // function for detect browser and add it to html tag
	var ua = window.navigator.userAgent,
		html = $('html');

	if (ua.indexOf('MSIE ') > 0) {
		html.addClass('msie msie' + parseInt(ua.substring(ua.indexOf('MSIE ') + 5, ua.indexOf('.', ua.indexOf('MSIE '))), 10));
	};
	if (ua.indexOf('Trident/') > 0) {
		html.addClass('ie ie' + parseInt(ua.substring(ua.indexOf('rv:') + 3, ua.indexOf('.', ua.indexOf('rv:'))), 10));
	};
	if ((/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) || (!!navigator.platform && /iPad|iPhone|iPod/.test(navigator.platform))) {
		html.addClass('ios');
	};
	var edge = ua.indexOf('Edge/');
	if (edge > 0) {
		html.addClass('edge');
	};
	if (ua.toLowerCase().indexOf('safari') != -1) { 
		if (ua.toLowerCase().indexOf('chrome') > -1) {
			html.addClass('chrome');
		} else {
			html.addClass('safari');
		}
	}
};
detectBrowser();

function getScrollBarWidth() {
	var inner          = document.createElement('p');
	inner.style.height = "200px";
	inner.style.width  = "100%";

	var outer              = document.createElement('div');
	outer.style.visibility = "hidden";
	outer.style.position   = "absolute";
	outer.style.overflow   = "hidden";
	outer.style.height     = "150px";
	outer.style.width      = "200px";
	outer.style.left       = "0px";
	outer.style.top        = "0px";

	outer.appendChild(inner);
	document.body.appendChild(outer);

	var w1 = inner.offsetWidth;
	outer.style.overflow = 'scroll';

	var w2 = inner.offsetWidth;
	if (w1 == w2) w2 = outer.clientWidth;

	document.body.removeChild(outer);

	return w1 - w2; // scroll width
};
getScrollBarWidth();

function is_scroll(){
	// if window has scroll
	return $(document).height() > $(window).height();
};

// disable page scroll
var $html = $('html');
var $body = $('body');
var $footer = $('.c-footer');
var $scrollBarWidth = getScrollBarWidth();
var $top = $(window).scrollTop();

function disable_scroll(){
	if (!$body.hasClass('scroll_disabled')) {
		$top = $(window).scrollTop();

		setTimeout(function(){
			if (is_scroll() && !$body.hasClass('scroll_disabled') && !$html.hasClass('msie10') && !$html.hasClass('msie11') && !$html.hasClass('ie10') && !$html.hasClass('ie11') ) {
				$body.css({
					'padding-right': $scrollBarWidth + 'px'
				});
				$footer.css({
					'padding-right': $scrollBarWidth + 'px'
				});
			};
			$body.addClass('scroll_disabled');
			$('.l-page-wrapper').css({
				'margin-top':'-' + $top + 'px'
			});
		}, 300);
	};
};
function enable_scroll(data){
	if ($body.hasClass('scroll_disabled')) {
		$body.removeClass('scroll_disabled');
		if(!$body.hasClass('modal-open') && !$html.hasClass('msie10') && !$html.hasClass('msie11') && !$html.hasClass('ie10') && !$html.hasClass('ie11') ) {
			console.log(data);
			$('.header__menu-trigger').removeClass('active');
			$('.l-page-wrapper').css({
				'margin-top':0
			});
			$body.css({
				'padding-right':0
			});
			$footer.css({
				'padding-right': 0
			});
			$(window).scrollTop($top);
		};
	};
};