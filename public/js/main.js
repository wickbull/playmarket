!function t(e,n,o){function r(a,s){if(!n[a]){if(!e[a]){var d="function"==typeof require&&require;if(!s&&d)return d(a,!0);if(i)return i(a,!0);var c=new Error("Cannot find module '"+a+"'");throw c.code="MODULE_NOT_FOUND",c}var f=n[a]={exports:{}};e[a][0].call(f.exports,function(t){var n=e[a][1][t];return r(n?n:t)},f,f.exports,t,e,n,o)}return n[a].exports}for(var i="function"==typeof require&&require,a=0;a<o.length;a++)r(o[a]);return r}({1:[function(t,e,n){"use strict";function o(){function t(){c=!0,Moff.each(d,function(t,e){o.include(e.id,e.callback)})}function e(){i.addEventListener("load",t,!1)}function n(){Moff.each(s,function(t,e){e.loadOnScreen.length&&e.loadOnScreen.indexOf(Moff.getMode())!==-1&&!a.querySelectorAll('[data-load-module="'+t+'"]').length&&o.include(t)})}var o=this,i=window,a=i.document,s={},d=[],c=!1;this.register=function(t){s[t.id]={loaded:!1,depend:{js:t.depend&&t.depend.js||[],css:t.depend&&t.depend.css||[]},file:{js:t.file&&t.file.js||[],css:t.file&&t.file.css||[]},loadOnScreen:t.loadOnScreen||[],beforeInclude:t.beforeInclude||void 0,afterInclude:t.afterInclude||void 0,onWindowLoad:t.onWindowLoad||!1}},this.include=function(t,e){function n(){Moff.loadAssets(a.file,o,i)}function o(){"function"==typeof a.afterInclude&&a.afterInclude(),f&&e()}var i=arguments.length<=2||void 0===arguments[2]?{}:arguments[2],a=s[t];if(a){"object"===("undefined"==typeof e?"undefined":r(e))&&(i=e,e=void 0);var f="function"==typeof e;if(!i.reload&&a.loaded)return void(f&&e());if(a.onWindowLoad&&!c)return void d.push({id:t,callback:e});a.loaded=!0,"function"==typeof a.beforeInclude&&a.beforeInclude(),Moff.loadAssets(a.depend,n,i)}},Moff.$(function(){e(),n()})}Object.defineProperty(n,"__esModule",{value:!0});var r="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol?"symbol":typeof t};n["default"]=o},{}],2:[function(t,e,n){"use strict";function o(){function t(){O?(E(T).addListener(o),E(L).addListener(o),E(P).addListener(o)):M.addEventListener("resize",o,!1),M.addEventListener("scroll",f,!1),M.addEventListener("popstate",v,!1),A.handleDataEvents()}function e(){var t=document.createElement("style");t.appendChild(document.createTextNode('\n\t\t\t.moff-loader {\n\t\t\t\tdisplay: none;\n\t\t\t\tposition: absolute;\n\t\t\t\twidth: 50px;\n\t\t\t\theight: 50px;\n\t\t\t\tleft: 0;\n\t\t\t\ttop: 0;\n\t\t\t\tz-index: 9999;\n\t\t\t\t-webkit-transition: 0s ease-in;\n\t\t\t\t-moz-transition: 0s ease-in;\n\t\t\t\t-o-transition: 0s ease-in;\n\t\t\t\ttransition: 0s ease-in;\n\t\t\t}\n\t\t\t.moff-loader.__default {\n\t\t\t\ttop: 12px;\n\t\t\t\tleft: 50%;\n\t\t\t\tmargin-left: -25px;\n\t\t\t\tposition: fixed;\n\t\t\t}\n\t\t\t.moff-loader.__ie9-preloader {\n\t\t\t\tbackground: url(\'http://moffjs.com/images/ie9-preloader.gif\');\n\t\t\t}\n\t\t\t.moff-loader.__ie9-preloader .moff-loader_box {\n\t\t\t\tdisplay: none;\n\n\t\t\t}\n\t\t\t.moff-loader.__visible {\n\t\t\t\tdisplay: block;\n\t\t\t}\n\t\t\t.moff-loader_box {\n\t\t\t\tposition: absolute;\n\t\t\t\twidth: 100%;\n\t\t\t\theight: 100%;\n\t\t\t\tborder-radius: 50%;\n\t\t\t\tborder: 1px solid transparent;\n\t\t\t\tborder-top-color: #3498db;\n\t\t\t\t-webkit-animation: spin 2s linear infinite;\n\t\t\t\tanimation: spin 2s linear infinite;\n\t\t\t}\n\t\t\t.moff-loader_box:before {\n\t\t\t\tcontent: "";\n\t\t\t\tposition: absolute;\n\t\t\t\ttop: 2px;\n\t\t\t\tleft: 2px;\n\t\t\t\tright: 2px;\n\t\t\t\tbottom: 2px;\n\t\t\t\tborder-radius: 50%;\n\t\t\t\tborder: 1px solid transparent;\n\t\t\t\tborder-top-color: #e74c3c;\n\t\t\t\t-webkit-animation: spin 3s linear infinite;\n\t\t\t\tanimation: spin 3s linear infinite;\n\t\t\t}\n\t\t\t.moff-loader_box:after {\n\t\t\t\tcontent: "";\n\t\t\t\tposition: absolute;\n\t\t\t\ttop: 5px;\n\t\t\t\tleft: 5px;\n\t\t\t\tright: 5px;\n\t\t\t\tbottom: 5px;\n\t\t\t\tborder-radius: 50%;\n\t\t\t\tborder: 1px solid transparent;\n\t\t\t\tborder-top-color: #f9c922;\n\t\t\t\t-webkit-animation: spin 1.5s linear infinite;\n\t\t\t\tanimation: spin 1.5s linear infinite;\n\t\t\t}\n\t\t\t.moff-hidden {\n\t\t\t\tdisplay: none;\n\t\t\t}\n\t\t\t@-webkit-keyframes spin {\n\t\t\t\t0% {\n\t\t\t\t\t-webkit-transform: rotate(0deg);\n\t\t\t\t\t-ms-transform: rotate(0deg);\n\t\t\t\t\ttransform: rotate(0deg);\n\t\t\t\t}\n\t\t\t\t100% {\n\t\t\t\t\t-webkit-transform: rotate(360deg);\n\t\t\t\t\t-ms-transform: rotate(360deg);\n\t\t\t\t\ttransform: rotate(360deg);\n\t\t\t\t}\n\t\t\t}\n\t\t\t@keyframes spin {\n\t\t\t\t0% {\n\t\t\t\t\t-webkit-transform: rotate(0deg);\n\t\t\t\t\t-ms-transform: rotate(0deg);\n\t\t\t\t\ttransform: rotate(0deg);\n\t\t\t\t}\n\t\t\t\t100% {\n\t\t\t\t\t-webkit-transform: rotate(360deg);\n\t\t\t\t\t-ms-transform: rotate(360deg);\n\t\t\t\t\ttransform: rotate(360deg);\n\t\t\t\t}\n\t\t\t}\n\t\t')),document.querySelector("head").appendChild(t)}function n(){k=C.createElement("div"),_=C.createElement("div"),k.setAttribute("class","moff-loader"),_.setAttribute("class","moff-loader_box"),C.body.appendChild(k),k.appendChild(_)}function o(t){(O&&t.matches||d())&&(c(),A.runCallbacks(j,A,[A.getMode()]),A.handleDataEvents())}function i(t){var e=t.getAttribute("data-load-screen"),n=e.split(" ");return!e||n.length&&n.indexOf(A.getMode())!==-1}function a(){var t=w();A.each(t,function(t,e){H[t]=e})}function s(){if(H.breakpoints&&O){var t=H.breakpoints;P=P.replace("%d",t.sm),L=L.replace("%d",t.md),T=T.replace("%d",t.lg)}}function d(){return S!==A.getMode()}function c(){S=A.getMode()}function f(){if($.length)for(var t=0,e=$.slice(0),n=e.length;t<n;t++){var o=e[t];A.inViewport(o)&&($.splice(t,1),p(o))}}function l(t,e){A.ajax({url:t,type:"GET",crossDomain:u(t),success:function(t){"function"==typeof e&&e(t)}})}function u(t){var e=document.createElement("a");return e.href=t,C.domain!==e.hostname}function p(t){var e=t.title||"",n=t.href||t.getAttribute("data-load-url"),o=t.getAttribute("data-load-target"),r=t.getAttribute("data-push-url"),i=t.getAttribute("data-load-module");if(n){if(A.showPreloader(),n=h(t,n),t.removeAttribute("data-load-event"),A.runCallbacks(D,t),A.detect.history&&null!==r){var a=Date.now();M.history.pushState({elemId:a,url:n},e,n),B[a]=t}m(t,n,o,function(){var e=document.querySelector(o);i?A.amd.include(i,function(){A.hidePreloader(),A.removeClass(e,"moff-hidden"),A.runCallbacks(N,t)}):(A.hidePreloader(),A.removeClass(e,"moff-hidden"),A.runCallbacks(N,t))})}else i&&(A.showPreloader(),A.amd.include(i,function(){A.hidePreloader()}))}function h(t,e){return e.replace(/\{\{(.*?)\}\}/g,function(){var e=arguments[1];return e.indexOf("-")!==-1?t.getAttribute(e):t[e]})}function m(t,e,n,o){function r(e){var r=t.getAttribute("data-page-title"),i=C.querySelector(n);null!==i&&(A.addClass(i,"moff-hidden"),i.innerHTML=e),r&&(C.title=r),o(),A.handleDataEvents()}e=y(e),W[e]?r(W[e]):l(e,r)}function v(t){var e=t.state;if(e){var n=B[e.elemId];if(n){if(!i(n))return;var o=e.url,r=n.getAttribute("data-load-target");A.runCallbacks(D,n),m(n,o,r,function(){A.runCallbacks(N,n)})}}}function y(t){var e=t.indexOf("#");return e===-1?t:t.substr(0,e)}function b(){var t="data-load-screen";A.each(C.querySelectorAll("["+t+"]"),function(){var e=this;i(e)&&(e.removeAttribute(t),e.handled=!0,p(e))})}function g(t){var e=Object.prototype.toString.call(t);return r(/^\[object (HTMLCollection|NodeList)\]$/.test(e))&&t.hasOwnProperty("length")&&(0===t.length||"object"===r(t[0])&&t[0].nodeType>0)}function w(){return window.moffConfig||{}}function x(){q=!0,e(),n(),t(),A.runCallbacks(I,this)}var S,M=window,A=this,C=M.document,k=null,_=null,O=!(!M.matchMedia||!M.matchMedia("screen").addListener),E=O&&M.matchMedia,P="(min-width: %dpx)",L=P,T=P,j=[],I=[],q=!1,D=[],N=[],W={},$=[],H={breakpoints:{sm:768,md:992,lg:1200},loadOnHover:!0,cacheLiveTime:2e3},z=["[data-load-target]","[data-load-module]","[data-load-event]","[data-load-url]","[data-load-screen]","[data-push-url]","[data-page-title]"],B={};this.showPreloader=function(){var t=arguments.length<=0||void 0===arguments[0]||arguments[0];this.hidePreloader(),this.addClass(k,"__visible"),t&&this.addClass(k,"__default"),A.detect.supportCSS3("transition")||this.addClass(k,"__ie9-preloader")},this.hidePreloader=function(){this.removeClass(k,"__visible __default __ie9-preloader"),k.removeAttribute("style")},this.positionPreloader=function(t,e){if(this.showPreloader(!1),"number"==typeof t&&"number"==typeof e){var n="";if(A.detect.supportCSS3("transition")){var o=t+"px, "+e+"px";n="-webkit-transform: translate("+o+");\n\t\t\t\t-moz-transform: translate("+o+");\n\t\t\t\t-o-transform: translate("+o+");\n\t\t\t\ttransform: translate("+o+");"}else n="left: "+t+"px; top: "+e+"px",this.addClass(k,"__ie9-preloader");k.setAttribute("style",n)}},this.addClass=function(t,e){if(t){var n,o,e=e.split(/\s/),r=e.length,i=0;for(o=" "+t.className+" ";i<r;i++)n=e[i],o.indexOf(" "+n+" ")<0&&(o+=n+" ");t.className=o.trim()}},this.removeClass=function(t,e){if(t){for(var e=e?e.split(/\s/):[],n=e.length,o=t.className||"",r=0;r<n;r++){var i=new RegExp("(^| )"+e[r]+"( |$)");o=o.replace(i," ")}return t.className!=o||n||(o=""),t.className=o.trim(),t}},this.handleDataEvents=function(){b(),A.each(C.querySelectorAll(z.join(", ")),function(){var t=this,e=this;if(!e.handled){var n=(e.getAttribute("data-load-event")||"click").toLowerCase();Moff.detect.isMobile&&"click"===n&&(n="touchstart"),"dom"===n?(A.$(function(){p(e)}),n="click"):"scroll"===n?A.inViewport(e)?p(e):$.push(e):"click"!==n&&"touchstart"!==n||H.loadOnHover&&!A.detect.isMobile&&e.addEventListener("mouseenter",function(){e=t;var n=e.href||e.getAttribute("data-load-url");n&&(n=y(n),n&&(n=h(e,n),l(n,function(t){W[n]=t,setTimeout(function(){delete W[n]},H.cacheLiveTime)})))},!1),e.addEventListener(n,function(t){p(this),t.preventDefault()},!1),e.handled=!0}})},this.inViewport=function(t){for(var e=t.offsetTop,n=t.offsetLeft,o=t.offsetWidth,r=t.offsetHeight;t.offsetParent;)t=t.offsetParent,e+=t.offsetTop,n+=t.offsetLeft;return e<M.pageYOffset+M.innerHeight&&n<M.pageXOffset+M.innerWidth&&e+r>M.pageYOffset&&n+o>M.pageXOffset},this.ajax=function(t){var e,n=[];t.type=t.type.toUpperCase(),"object"===r(t.data)&&(e=t.data,this.each(e,function(t,e){n.push(encodeURIComponent(t)+"="+encodeURIComponent(e))}),t.data=n.join("&")),"GET"===t.type&&t.data&&(t.url+=(t.url.indexOf("?")!==-1?"&":"?")+t.data.replace(/%20/g,"+"),t.data=null);var o=new XMLHttpRequest;o.open(t.type,t.url,!0),o.setRequestHeader("Content-Type",t.contentType||"application/x-www-form-urlencoded; charset=UTF-8"),t.crossDomain||o.setRequestHeader("X-Requested-With","XMLHttpRequest"),o.onload=function(){var e=this.status;e>=200&&e<300||304===e?t.success(this.responseText,this):t.error(this)},o.send(t.data)},this.runCallbacks=function(t,e,n){Array.isArray(t)||(t=[]),A.each(t,function(t,o){"function"==typeof o&&o.apply(e,n)})},this.onViewChange=function(t){"function"==typeof t&&j.push(t)},this.beforeLoad=function(t){"function"==typeof t&&D.push(t)},this.afterLoad=function(t){"function"==typeof t&&N.push(t)},this.getMode=function(){var t="xs";if(O)E(T).matches?t="lg":E(L).matches?t="md":E(P).matches&&(t="sm");else{var e=C.documentElement.clientWidth,n=H.breakpoints;e>=n.lg?t="lg":e>=n.md?t="md":e>=n.sm&&(t="sm")}return t},this.loadAssets=function(t,e){function n(){var o=t.js[s];o&&A.loadJS(o,function(){s++,i++,i===a?f&&e():n()},r)}function o(){i++,i===a&&f&&e()}var r=arguments.length<=2||void 0===arguments[2]?{}:arguments[2],i=0,a=0,s=0,d=Array.isArray(t.css),c=Array.isArray(t.js),f="function"==typeof e;return c&&(a+=t.js.length),d&&(a+=t.css.length),a?(n(),void(d&&t.css.length&&this.each(t.css,function(t,e){A.loadCSS(e,o,r)}))):void(f&&e())},this.loadJS=function(t,e){function n(){var n=C.createElement("script");n.setAttribute("src",t),a&&n.addEventListener("load",e,!1),C.querySelector("body").appendChild(n)}var o=arguments.length<=2||void 0===arguments[2]?{}:arguments[2];if("string"==typeof t){"object"===("undefined"==typeof e?"undefined":r(e))&&(o=e,e=void 0);var i=C.querySelector('script[src="'+t+'"]'),a="function"==typeof e;o.reload?(i&&i.parentNode.removeChild(i),n()):i?a&&e():n()}},this.loadCSS=function(t,e){function n(){var n=C.createElement("link");a&&n.addEventListener("load",e,!1),n.setAttribute("href",t),n.setAttribute("rel","stylesheet"),C.querySelector("head").appendChild(n),n.onreadystatechange=function(){var t=n.readyState;"loaded"!==t&&"complete"!==t||(n.onreadystatechange=null,a&&e())}}var o=arguments.length<=2||void 0===arguments[2]?{}:arguments[2];if("string"==typeof t){"object"===("undefined"==typeof e?"undefined":r(e))&&(o=e,e=void 0);var i=C.querySelector('link[href="'+t+'"]'),a="function"==typeof e;o.reload?(i&&i.parentNode.removeChild(i),n()):i?a&&e():n()}},this.settings=function(t,e){return"undefined"==typeof e?H[t]:void(H[t]=e)},this.each=function(t,e){var n,o=0,r=t.length,i=Array.isArray(t)||g(t);if(i)for(;o<r&&(n=e.call(t[o],o,t[o]),n!==!1);o++);else for(o in t)if(t.hasOwnProperty(o)&&(n=e.call(t[o],o,t[o]),n===!1))break},this.$=function(t){"function"==typeof t&&(q?t():I.push(t))},this.debug=function(t){window.console&&window.console.debug&&window.console.debug("Moff DEBUG: "+t)},this.error=function(t){throw t},this.version="1.11.1",a(),s(),c(),C.addEventListener("DOMContentLoaded",x,!1)}Object.defineProperty(n,"__esModule",{value:!0});var r="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol?"symbol":typeof t};n["default"]=o},{}],3:[function(t,e,n){"use strict";function o(){function t(){i.touch=!!("ontouchstart"in r||r.DocumentTouch&&s instanceof r.DocumentTouch),i.applicationCache=!!r.applicationCache,i.canvas=function(){var t=s.createElement("canvas");return!(!t.getContext||!t.getContext("2d"))}(),i.canvasText=!(!i.canvas||"function"!=typeof s.createElement("canvas").getContext("2d").fillText),i.dragAndDrop=function(){var t=s.createElement("div");return"draggable"in t||"ondragstart"in t&&"ondrop"in t}(),i.hashChange=!!("onhashchange"in r&&("undefined"==typeof s.documentMode||s.documentMode>7)),i.history=!(!r.history||!history.pushState),i.postMessage=!!r.postMessage,i.webSockets=!!("WebSocket"in r||"MozWebSocket"in r),i.webWorkers=!!r.Worker,i.audio=function(){var t=s.createElement("audio"),e=!1;try{t.canPlayType&&(e={},e.ogg=t.canPlayType('audio/ogg; codecs="vorbis"').replace(/^no$/,""),e.mp3=t.canPlayType("audio/mpeg;").replace(/^no$/,""),e.wav=t.canPlayType('audio/wav; codecs="1"').replace(/^no$/,""),e.m4a=(t.canPlayType("audio/x-m4a;")||t.canPlayType("audio/aac;")).replace(/^no$/,""))}catch(n){}return e}(),i.video=function(){var t=s.createElement("video"),e=!1;try{t.canPlayType&&(e={},e.ogg=t.canPlayType('video/ogg; codecs="theora"').replace(/^no$/,""),e.h264=t.canPlayType('video/mp4; codecs="avc1.42E01E"').replace(/^no$/,""),e.webm=t.canPlayType('video/webm; codecs="vp8, vorbis"').replace(/^no$/,""))}catch(n){}return e}(),i.indexedDB=function(){var t=["indexedDB","webkitIndexedDB","mozIndexedDB","OIndexedDB","msIndexedDB"];for(var e in t)if(t.hasOwnProperty(e)){var n=r[t[e]];if(void 0!==n)return n===!1?t[e]:"function"==typeof n?n.bind(r):n}return!1}(),i.localStorage=function(){try{return localStorage.setItem(i.mode,i.mode),localStorage.removeItem(i.mode),!0}catch(t){return!1}}(),i.sessionStorage=function(){try{return sessionStorage.setItem(i.mode,i.mode),sessionStorage.removeItem(i.mode),!0}catch(t){return!1}}()}function e(){var t=/(edge)[\/]([0-9\.]+)/.exec(a)||/(chrome)[ \/]([\w.]+)/.exec(a)||/(webkit)[ \/]([\w.]+)/.exec(a)||/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(a)||/(msie) ([\w.]+)/.exec(a)||a.indexOf("compatible")<0&&/(mozilla)(?:.*? rv:([\w.]+)|)/.exec(a)||[];t[1]&&(i.browser[t[1]]=!0),t[2]&&(i.browser.version=t[2]),i.browser.chrome&&(i.browser.webkit=!0)}function n(){var t=i.OS,e=/(ipad|iphone|ipod)/g.test(a),n=a.indexOf("mac")>-1,o=a.indexOf("win")>-1,r=a.indexOf("android")>-1,s=a.indexOf("windows phone")>-1;e?t.iOS=e:n?t.macOS=n:o?t.windows=o:r?t.android=r:s&&(t.windowsPhone=s)}function o(){i.isMobile=/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)}var r=window,i=this,a=window.navigator.userAgent.toLowerCase(),s=document;this.browser={},this.OS={},this.supportCSS3=function(t){for(var e=t.charAt(0).toUpperCase()+t.slice(1),n=(t+" "+"Webkit Moz O ms".split(" ").join(e+" ")+e).split(" "),o=n.length,r=0;r<o;r++)if(t=n[r],t.indexOf("-")===-1&&void 0!==document.createElement("div").style[t])return!0;return!1},t(),e(),n(),o()}Object.defineProperty(n,"__esModule",{value:!0}),n["default"]=o},{}],4:[function(t,e,n){"use strict";function o(){var t={};this.add=function(e){"undefined"==typeof t[e]&&(t[e]=[])},this.on=function(e,n){this.add(e),"function"==typeof n&&t[e].push(n)},this.once=function(t,e){e._onceExecuted=!0,this.on(t,e)},this.trigger=function(e){var n=this,o=Array.prototype.slice.call(arguments,1),r=[];"undefined"!=typeof t[e]&&(Moff.runCallbacks(t[e],this,o),Moff.each(t[e],function(t,e){e._onceExecuted&&r.push(t)}),Moff.each(r,function(o,r){n.off(e,t[e][r])}))},this.get=function(e){var n=t[e];if(Array.isArray(n)&&n.length)return n},this.off=function(e,n){return n?void Moff.each(t[e],function(o,r){if(r===n)return t[e].splice(o,1),!1}):void(t[e]=[])}}Object.defineProperty(n,"__esModule",{value:!0}),n["default"]=o},{}],5:[function(t,e,n){"use strict";function o(t){return t&&t.__esModule?t:{"default":t}}var r=t("../../amd/src/amd.e6"),i=o(r),a=t("../../core/src/core.e6"),s=o(a),d=t("../../event/src/event.e6"),c=o(d),f=t("../../detect/src/detect.e6"),l=o(f),u=t("../../modules/src/base.es6"),p=o(u),h=t("../../modules/src/api.e6"),m=o(h);window.Moff=new s["default"],window.Moff.amd=new i["default"],window.Moff.event=new c["default"],window.Moff.Module=new p["default"],window.Moff.detect=new l["default"],window.Moff.modules=new m["default"]},{"../../amd/src/amd.e6":1,"../../core/src/core.e6":2,"../../detect/src/detect.e6":3,"../../event/src/event.e6":4,"../../modules/src/api.e6":6,"../../modules/src/base.es6":7}],6:[function(t,e,n){"use strict";function o(){function t(t){Array.isArray(t)&&Moff.each(t,function(t,e){Moff.event.add(e)})}var e={},n={};this.create=function(t,e,o){"undefined"==typeof o&&(o=e,e=void 0),o.prototype=Moff.Module,o.prototype.constructor=o,"undefined"==typeof n[t]&&(n[t]={constructor:o,depend:e})},this.initClass=function(o,r){function i(){var n=new a.constructor,i=e[o];Array.isArray(i)?i.push(n):"undefined"!=typeof i?e[o]=[i,n]:e[o]=n,"function"==typeof n.beforeInit&&n.beforeInit(),r&&Moff.each(r,function(t,e){n[t]=e}),n.moduleName=o,Array.isArray(n.events)&&n.events.length&&t(n.events),n.setScope(),"function"==typeof n.init&&n.init(),"function"==typeof n.afterInit&&n.afterInit()}var a=n[o];if(a)try{a.depend?Moff.loadAssets(a.depend,i):i()}catch(s){Moff.error(s)}},this.get=function(t){return e.hasOwnProperty(t)&&e[t]||void 0},this.getAll=function(){return e},this.getBy=function(t,e){var n=this.getAll(),o=[];return"class"===t&&(t="moduleName"),Moff.each(n,function(n,r){Array.isArray(r)?Moff.each(r,function(n,r){r[t]&&r[t]===e&&o.push(r)}):r[t]&&r[t]===e&&o.push(r)}),o},this.remove=function(t){var n=0,o="string"!=typeof t,r=o?t.moduleName:t,i=e[r];if(Array.isArray(i)){for(var a=i.length;n<a;n++){var s=i[n];(o&&s===t||!o&&s.moduleName===r)&&(i.splice(n,1),a=i.length,--n)}1===i.length?e[r]=e[r][0]:e[r].length||delete e[r]}else delete e[r]}}Object.defineProperty(n,"__esModule",{value:!0}),n["default"]=o},{}],7:[function(t,e,n){"use strict";function o(){this.scopeSelector=null,this.scope=null,this.events=[],this.beforeInit=function(){},this.init=function(){},this.afterInit=function(){},this.setScope=function(){this.scopeSelector&&(this.scope=document.querySelector(this.scopeSelector))},this.find=function(t){return this.scope.querySelectorAll(t)},this.reopen=function(t){var e=this;"object"===("undefined"==typeof t?"undefined":r(t))&&Moff.each(t,function(t,n){e[t]=n})}}Object.defineProperty(n,"__esModule",{value:!0});var r="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol?"symbol":typeof t};n["default"]=o},{}]},{},[5]);
//# sourceMappingURL=moff.min.js.map


svg4everybody(); // call polyfill for svg use tags

window.moffConfig = {
    // Website CSS breakpoints.
    // Default values from Twitter Bootstrap.
    // No need to set xs, because of Mobile first approach.
    breakpoints: {
        sm: 768,
        lg: 1200,
        md: 992
    }
    // loadOnHover: true,
    // cacheLiveTime: 2000
};
if($(".js-header").length > 0){
    Moff.amd.register({
        id: 'header',
        // depend: {
        // 	js: ['/js/helpers/toggle-blocks.js']
        // },
        file: {
            js: ['/js/components/js-header.js']
        },
        loadOnScreen: ['xs', 'sm', 'md', 'lg'],
        onWindowLoad: true
    });
};
if($(".js-games-list").length > 0){
    Moff.amd.register({
        id: 'games-list',
        file: {
            js: ['/js/components/js-games-list.js']
        },
        loadOnScreen: ['xs', 'sm', 'md', 'lg'],
        onWindowLoad: true
    });
};
if($(".js-chat").length > 0){
    Moff.amd.register({
        id: 'js-chat',
        file: {
            js: ['/js/components/js-chat.js']
        },
        loadOnScreen: ['xs', 'sm', 'md', 'lg'],
        onWindowLoad: true
    });
};
if($(".js-personal-data").length > 0){
    Moff.amd.register({
        id: 'js-personal-data',
        file: {
            js: ['/js/components/js-personal-data.js']
        },
        loadOnScreen: ['xs', 'sm', 'md', 'lg'],
        onWindowLoad: true
    });
};
if($(".js-custom-scroll").length > 0){
    Moff.amd.register({
        id: 'js-custom-scroll',
        depend: {
        	js: ["/bower_components/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js"]
        },
        file: {
            js: ['/js/components/js-init-perfect-scroll.js']
        },
        loadOnScreen: ['xs', 'sm', 'md', 'lg'],
        onWindowLoad: true
    });
};
if($(".js-form_check").length > 0){
    Moff.amd.register({
        id: 'js-form_check',
        depend: {
            js: ["/bower_components/jquery-validation/dist/jquery.validate.js"]
        },
        file: {
            js: ["/js/helpers/valid.js"]
        },
        loadOnScreen: ['xs', 'sm', 'md', 'lg'],
        onWindowLoad: true
    });
};
if($("[data-toggle=\"tooltip\"]").length > 0){
    Moff.amd.register({
        id: 'tooltip',
        depend: {
            js: ["/bower_components/bootstrap/js/tooltip.js"]
        },
        file: {
            js: ["/js/components/js-init-bs-tooltip.js"]
        },
        loadOnScreen: ['xs', 'sm', 'md', 'lg'],
        onWindowLoad: true
    });
};
if ($("[data-toggle=\"tab\"]").length > 0) {
    Moff.amd.register({
        id: 'tabs',
        depend: {
            js: ["/bower_components/bootstrap/js/tab.js"]
        },
        file: {
            js: ["/js/components/js-init-bs-tabs.js"]
        },
        loadOnScreen: ['xs', 'sm', 'md', 'lg'],
        onWindowLoad: true
    });
}
;
if($(".selectpicker").length > 0){
    Moff.amd.register({
        id: 'selectpicker',
        depend: {
            js: ["/bower_components/bootstrap-select/dist/js/bootstrap-select.js", "/bower_components/bootstrap/js/dropdown.js"]
        },
        file: {
            js: ["/js/components/js-init-bs-select.js"]
        },
        loadOnScreen: ['xs', 'sm', 'md', 'lg'],
        onWindowLoad: true
    });
};
if($(".collapse").length > 0){
    Moff.amd.register({
        id: 'collapse',
        depend: {
            js: ["/bower_components/bootstrap/js/collapse.js"]
        },
        file: {
            js: ["/js/components/js-collapse.js"]
        },
        loadOnScreen: ['xs', 'sm', 'md', 'lg'],
        onWindowLoad: true
    });
};

$(function(){
	$('.selectpicker').selectpicker();
});

