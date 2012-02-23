// jquery.pjax.js
// copyright chris wanstrath
// https://github.com/defunkt/jquery-pjax
(function(a){function b(b,c,e){e=d(c,e);var f=b.currentTarget;if(b.which>1||b.metaKey)return;if(location.protocol!==f.protocol||location.host!==f.host)return;if(f.hash&&f.href.replace(f.hash,"")===location.href.replace(location.hash,""))return;var g={url:f.href,container:a(f).attr("data-pjax"),clickedElement:a(f),fragment:null};return a.pjax(a.extend({},g,e)),b.preventDefault(),!1}function d(b,c){return b&&c?c.container=b:a.isPlainObject(b)?c=b:c={container:b},c.container&&(c.container=e(c.container)),c}function e(b){b=a(b);if(!b.length)throw"no pjax container for "+b.selector;if(b.selector!==""&&b.context===document)return b;if(b.attr("id"))return a("#"+b.attr("id"));throw"cant get selector for pjax container!"}a.fn.pjax=function(a,c){return c=d(a,c),this.live("click",function(a){return b(a,c)})};var c=a.pjax=function(b){b=a.extend(!0,{},a.ajaxSettings,c.defaults,b),a.isFunction(b.url)&&(b.url=b.url());var d=b.beforeSend,f=b.complete,g=b.success,h=b.error;b.context=e(b.container);var i;b.beforeSend=function(c,e){var f=this;e.timeout>0&&(i=setTimeout(function(){var d=a.Event("pjax:timeout");f.trigger(d,[c,b]),d.result!==!1&&c.abort("timeout")},e.timeout),e.timeout=0),c.setRequestHeader("X-PJAX","true");var g;if(d){g=d.apply(this,arguments);if(g===!1)return!1}var h=a.Event("pjax:beforeSend");this.trigger(h,[c,e]),g=h.result;if(g===!1)return!1;this.trigger("pjax:start",[c,b]),this.trigger("start.pjax",[c,b])},b.complete=function(a,c){i&&clearTimeout(i),f&&f.apply(this,arguments),this.trigger("pjax:complete",[a,c,b]),this.trigger("pjax:end",[a,b]),this.trigger("end.pjax",[a,b])},b.error=function(c,d,e){h&&h.apply(this,arguments);var f=a.Event("pjax:error");this.trigger(f,[c,d,e,b]),d!=="abort"&&f.result!==!1&&(window.location=b.url)},b.success=function(d,e,f){var h,i=document.title;if(b.fragment){var j=a("<html>").html(d),k=j.find(b.fragment);if(k.length)this.html(k.contents()),h=j.find("title").text()||k.attr("title")||k.data("title");else return window.location=b.url}else{if(!a.trim(d)||/<html/i.test(d))return window.location=b.url;this.html(d),h=this.find("title").remove().text()}h&&(document.title=a.trim(h));var l={pjax:this.selector,fragment:b.fragment,timeout:b.timeout},m=a.param(b.data);m!="_pjax=true"&&(l.url=b.url+(/\?/.test(b.url)?"&":"?")+m),b.replace?(c.active=!0,window.history.replaceState(l,document.title,b.url)):b.push&&(c.active||(window.history.replaceState(a.extend({},l,{url:null}),i),c.active=!0),window.history.pushState(l,document.title,b.url)),(b.replace||b.push)&&window._gaq&&_gaq.push(["_trackPageview"]);var n=window.location.hash.toString();n!==""&&(window.location.href=n),g&&g.apply(this,arguments),this.trigger("pjax:success",[d,e,f,b])};var j=c.xhr;return j&&j.readyState<4&&(j.onreadystatechange=a.noop,j.abort()),c.options=b,c.xhr=a.ajax(b),a(document).trigger("pjax",[c.xhr,b]),c.xhr};c.defaults={timeout:650,push:!0,replace:!1,data:{_pjax:!0},type:"GET",dataType:"html"},c.click=b;var f="state"in window.history,g=location.href;a(window).bind("popstate",function(b){var c=!f&&location.href==g;f=!0;if(c)return;var d=b.state;if(d&&d.pjax){var e=d.pjax;a(e+"").length?a.pjax({url:d.url||location.href,fragment:d.fragment,container:e,push:!1,timeout:d.timeout}):window.location=location.href}}),a.inArray("state",a.event.props)<0&&a.event.props.push("state"),a.support.pjax=window.history&&window.history.pushState&&window.history.replaceState&&!navigator.userAgent.match(/((iPod|iPhone|iPad).+\bOS\s+[1-4]|WebApps\/.+CFNetwork)/),a.support.pjax||(a.pjax=function(b){var c=a.isFunction(b.url)?b.url():b.url,d=b.type?b.type.toUpperCase():"GET",e=a("<form>",{method:d==="GET"?"GET":"POST",action:c,style:"display:none"});d!=="GET"&&d!=="POST"&&e.append(a("<input>",{type:"hidden",name:"_method",value:d.toLowerCase()}));var f=b.data;if(typeof f=="string")a.each(f.split("&"),function(b,c){var d=c.split("=");e.append(a("<input>",{type:"hidden",name:d[0],value:d[1]}))});else if(typeof f=="object")for(key in f)e.append(a("<input>",{type:"hidden",name:key,value:f[key]}));a(document.body).append(e),e.submit()},a.pjax.click=a.noop,a.fn.pjax=function(){return this})})(jQuery)