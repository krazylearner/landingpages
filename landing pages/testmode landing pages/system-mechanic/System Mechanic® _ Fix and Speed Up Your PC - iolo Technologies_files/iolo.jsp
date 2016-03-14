

	usi_alert = function(msg) {}

// <script>


var usi_parent_domain = "iolo.com";
var usi_error_submits = 0;
function usi_stopError(usi_msg, usi_url, usi_linenumber) {
	if (usi_url.indexOf("upsellit.com") != -1 && usi_url.indexOf("err.jsp") == -1 && usi_error_submits < 5) {
		usi_error_submits++;
		var USI_headID = document.getElementsByTagName("head")[0];
		var USI_errorScript = document.createElement('script');
		USI_errorScript.type = 'text/javascript';
		USI_errorScript.src = '//www.upsellit.com/err.jsp?oops='+escape(usi_msg)+'-'+escape(usi_url)+'-'+escape(usi_linenumber);
		USI_headID.appendChild(USI_errorScript);
	}
	return true;
}
if (location.href.indexOf("usishowerrors") == -1) {
	window.onerror = usi_stopError;
}
USI_setSessionValue = function(name, value) {
	try {
		var usi_win = window.top || window;
		var usi_found = 0;
		var usi_allValues = usi_win.name.split(";");
		var usi_newValues = "";
		for (var i=0; i<usi_allValues.length;i++) {
			var usi_theValue = usi_allValues[i].split("=");
			if (usi_theValue.length == 2) {
				if (usi_theValue[0] == name) {
					usi_theValue[1] = value;
					usi_found = 1;
				}
				if (usi_theValue[1] != null) {
					usi_newValues += usi_theValue[0] + "=" + usi_theValue[1] + ";";
				}
			} else if (usi_allValues[i] != "") {
				usi_newValues += usi_allValues[i] + ";";
			}
		}
		if (usi_found == 0) {
			usi_newValues += name + "=" + value + ";";
		}
		usi_win.name = usi_newValues;
	} catch (e) {}
}
USI_getWindowNameValue = function(name) {
	try {
		var usi_win = window.top || window;
		var usi_allValues = usi_win.name.split(";");
		for (var i=0; i<usi_allValues.length;i++) {
			var usi_theValue = usi_allValues[i].split("=");
			if (usi_theValue.length == 2) {
				if (usi_theValue[0] == name) {
					return usi_theValue[1];
				}
			}
		}
	} catch (e) {}
	return null;
}
USI_createCookie = function(name,value,seconds) {
	if (name == "USI_Session" || typeof(usi_cookieless) === "undefined") {
		var date = new Date();
		date.setTime(date.getTime()+(seconds*1000));
		var expires = "; expires="+date.toGMTString();
		if (typeof(usi_parent_domain) != "undefined" && document.domain.indexOf(usi_parent_domain) != -1) {
			document.cookie = name+"="+value+expires+"; path=/;domain="+usi_parent_domain+";";
		} else {
			document.cookie = name+"="+value+expires+"; path=/;domain="+document.domain+";";
		}
	}
}
USI_readCookie = function(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}
var USI_local_cache = {};
USI_getASession = function(name) {
	if (typeof(name) == "undefined") {
		name = "USI_Session";
	}
	if (typeof(USI_local_cache[name]) != "undefined") {
		return USI_local_cache[name];
	}
	var usi_win = window.top || window;
	var USI_Session = USI_readCookie(name);
	if (USI_Session == null || USI_Session == 'null' || USI_Session == '') {
		//Link followed cookie?
		USI_Session = USI_readCookie("USIDataHound");
		if (USI_Session != null) {
			USI_createCookie("USI_Session", USI_Session, 7*24*60*60);
		}
	}
	if (USI_Session == null || USI_Session == 'null' || USI_Session == '') {
		//fix for pre-variable stuff
		try {
			if (usi_win.name.indexOf("dh_") == 0) {
				usi_win.name = "USI_Session="+usi_win.name+";";
			}
			USI_Session = USI_getWindowNameValue(name);
		} catch (e) {}
	}
	if (USI_Session == null || USI_Session == 'null' || USI_Session == '') {
		var chars = "ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
		var string_length = 4;
		var randomstring = '';
		for (var i=0; i<string_length; i++) {
			var rnum = Math.floor(Math.random() * chars.length);
			randomstring += chars.substring(rnum,rnum+1);
		}
		if (name == "USI_Session") {
			USI_Session = "dh_" + randomstring + "" + (new Date()).getTime();
			USI_createCookie("USI_Session", USI_Session, 7*24*60*60);
			USI_setSessionValue("USI_Session", USI_Session);
		} else {
			USI_Session = name + "_" + randomstring + "" + (new Date()).getTime();
			USI_createCookie(name, USI_Session, 7*24*60*60);
			USI_setSessionValue(name, USI_Session);
		}
	}
	USI_local_cache[name] = USI_Session;
	return USI_Session;
}
USI_deleteVariable = function(name) {
	USI_updateASession(name, null, -100);
}
USI_getSessionValue = function(name) {
	if (typeof(USI_local_cache[name]) != "undefined" && USI_local_cache[name] != null) {
		return USI_local_cache[name];
	}
	var usi_value = USI_readCookie(name);
	if (usi_value == null) {
		usi_value = USI_getWindowNameValue(name);
	}
	if (usi_value != null) {
		USI_updateASession(name, usi_value, 7*24*60*60);
		USI_local_cache[name] = usi_value;
	}
	return usi_value;
}
USI_updateASession = function(name, value, exp_seconds) {
	try {
		value = value.replace(/(\r\n|\n|\r)/gm,"");
	} catch(e) {}
	USI_createCookie(name, value, exp_seconds);
	USI_setSessionValue(name, value);
	USI_local_cache[name] = value;
}
function usi_gup( name ) {
	name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
	var regexS = "[\\?&]"+name+"=([^&#]*)";
	var regex = new RegExp( regexS );
	var results = regex.exec( window.location.href );
	if( results == null ) return "";
	else return results[1];
}
var usi_orderstyle = "";
if (usi_gup("ORDERSTYLE") != "") {
	usi_orderstyle = usi_gup("ORDERSTYLE");
	USI_updateASession("usi_ordertyle", encodeURIComponent(usi_orderstyle), 24*60*60);
} else if (USI_getSessionValue("usi_ordertyle") != null) {
	usi_orderstyle = decodeURIComponent(USI_getSessionValue("usi_ordertyle"));
}
function usi_reportstuff(usi_info) {
	var USI_headID = document.getElementsByTagName("head")[0];
	var USI_dynScript = document.createElement("script");
	USI_dynScript.setAttribute("type","text/javascript");
	USI_dynScript.src = "http"+ (document.location.protocol=="https:"?"s://www":"://www")+ ".upsellit.com/launch/blank.jsp?iolo="+escape(usi_info);
	USI_headID.appendChild(USI_dynScript);
}
if (USI_getSessionValue("usi_fname") != null && document.getElementById("fname") != null) {
    try{
    document.getElementById("fname").value = decodeURIComponent(USI_getSessionValue("usi_fname"));
    }catch (e) {}
}
if (USI_getSessionValue("usi_lname") != null && document.getElementById("lname") != null) {
    try{
    document.getElementById("lname").value = decodeURIComponent(USI_getSessionValue("usi_lname"));
    }catch (e) {}
}
if (USI_getSessionValue("usi_address") != null && document.getElementById("address") != null) {
    try{
    document.getElementById("address").value = decodeURIComponent(USI_getSessionValue("usi_address"));
    }catch (e) {}
}
if (USI_getSessionValue("usi_city") != null && document.getElementById("city") != null) {
    try{
    document.getElementById("city").value = decodeURIComponent(USI_getSessionValue("usi_city"));
    }catch (e) {}
}
if (USI_getSessionValue("usi_zipcode") != null && document.getElementById("zipcode") != null) {
    try{
    document.getElementById("zipcode").value = decodeURIComponent(USI_getSessionValue("usi_zipcode"));
    }catch (e) {}
}
if (USI_getSessionValue("usi_zipcode") != null && document.getElementById("zipcode") != null) {
    try{
    document.getElementById("zipcode").value = decodeURIComponent(USI_getSessionValue("usi_zipcode"));
    }catch (e) {}
}
if (USI_getSessionValue("usi_billingcountry") != null && document.getElementById("billingcountry") != null) {
    try{
    document.getElementById("billingcountry").value = decodeURIComponent(USI_getSessionValue("usi_billingcountry"));
    }catch (e) {}
}
if (USI_getSessionValue("usi_state") != null && document.getElementById("state") != null) {
    try{
    document.getElementById("state").value = decodeURIComponent(USI_getSessionValue("usi_state"));
    }catch (e) {}
}
if (USI_getSessionValue("usi_email") != null && document.getElementById("email") != null) {
    try{
    document.getElementById("email").value = decodeURIComponent(USI_getSessionValue("usi_email"));
    }catch (e) {}
}
if (USI_getSessionValue("usi_re_email") != null && document.getElementById("re_email") != null) {
    try{
    document.getElementById("re_email").value = decodeURIComponent(USI_getSessionValue("usi_re_email"));
    }catch (e) {}
}
var USIqs = "";
var USIsiteID = "";
var USI_key = "";
var USIDHqs = "";
var USIDHsiteID = "";
var usi_new_discount = "0";
var usi_current_discount = "0";
var usi_coupon = "";
usi_new_discount = "0";
var usi_url = location.href.toLowerCase();
if (usi_url.indexOf("iolo.com/order/checkout.php") != -1) {
    var usi_found = 0;
    // Save CART URL with all params sans affiliate & coupon, used to build functional tracking link
    if (location.href.indexOf("PRODS=") != -1) {
        var usi_link = location.href;
        if (usi_gup("COUPON") != "") usi_link = usi_link.replace("COUPON="+usi_gup("COUPON"), "");
        if (usi_gup("AFFILIATE") != "") usi_link = usi_link.replace("AFFILIATE="+usi_gup("AFFILIATE"), "");
        USI_updateASession("usi_link", encodeURIComponent(usi_link), 24*60*60);
    }
    var trs = document.getElementsByTagName('tr');
    for (var j=0; j<trs.length; j++ ) {
        if (trs[j].className != null && trs[j].className.indexOf("order__listing__row") != -1) {
            if (trs[j].innerHTML.indexOf("4223590") != -1) {
                USI_updateASession("usi_product", "smp", 24*60*60);
                usi_found = 1;
            } else if (trs[j].innerHTML.indexOf("4155797") != -1) {
                USI_updateASession("usi_product", "sm", 24*60*60);
                usi_found = 1;
            }
            if (usi_found == 1) {
                var usi_discount_found = 0;
                var usi_divs = trs[j].getElementsByTagName('div');
                thiswholeloop3: for (var i=0; i<usi_divs.length; i++ ) {
                    if (usi_divs[i].className != null && usi_divs[i].className == "discount-pr") {
                        if (usi_divs[i].innerHTML.indexOf("% Discount") != -1) {
                            usi_current_discount = usi_divs[i].innerHTML;
                            usi_current_discount = usi_current_discount.substring(0, usi_current_discount.indexOf("%"));
                            usi_discount_found = 1;
                            break thiswholeloop3;
                        }
                    }
                }
                var usi_element = trs[j].getElementsByTagName('td');
                for (var i=0; i<usi_element.length; i++ ) {
                    if (usi_element[i].className != null && usi_element[i].className == "order__listing__item__unit__price") {
                        if (usi_element[i].innerHTML.toLowerCase().indexOf("usd") != -1) {
                            theInnerHTML = usi_element[i].innerHTML;
                            theInnerHTML = theInnerHTML.substring(0, theInnerHTML.indexOf(".")+3);
                            usi_price = theInnerHTML;
                            if (usi_price != "") {
                                USI_updateASession("usi_price", usi_price, 24*60*60);
                                USI_updateASession("usi_currency", "USD", 24*60*60);
                            }
                        } else if (usi_element[i].innerHTML.toLowerCase().indexOf("cad") != -1) {
                            theInnerHTML = usi_element[i].innerHTML;
                            theInnerHTML = theInnerHTML.substring(0, theInnerHTML.indexOf(".")+3);
                            usi_price = theInnerHTML;
                            if (usi_price != "") {
                                USI_updateASession("usi_price", usi_price, 24*60*60);
                                USI_updateASession("usi_currency", "CAD", 24*60*60);
                            }
                        }
                    }
                }
            }
        }
    }
    usi_reportstuff("usi_found=" + usi_found);
    try {
        if (usi_discount_found == 0) {
            try{
                usi_current_discount = 100*omniture_vars.CART_PRODUCTS[0].ProductPriceDiscount/omniture_vars.CART_PRODUCTS[0].ProductPriceFull;
            }catch (e) {
                usi_reportstuff("e1: " + e);
            }
        }
        usi_reportstuff("usi_current_discount_num=" + usi_current_discount);
        var usi_current_discount_num = Number(usi_current_discount);
        if (usi_current_discount_num >= 0 && usi_current_discount_num < 20) {
            usi_new_discount = "25";
            usi_coupon = "upsellit";
        } else if (usi_current_discount_num >= 20 && usi_current_discount_num < 25) {
            usi_new_discount = "30";
            usi_coupon = "WDL00C30";
        } else if (usi_current_discount_num >= 25 && usi_current_discount_num < 30) {
            usi_new_discount = "35";
            usi_coupon = "WDL00C35";
        } else if (usi_current_discount_num >= 30 && usi_current_discount_num < 35) {
            usi_new_discount = "40";
            usi_coupon = "WDL00C40";
        } else if (usi_current_discount_num >= 35 && usi_current_discount_num <= 45) {
            usi_new_discount = "45";
            usi_coupon = "WDL00C45";
        } else if (usi_current_discount_num > 45) {
            usi_new_discount = usi_current_discount_num;
            usi_coupon = "";
        }
    } catch(e) {
        usi_reportstuff("e2: " + e);
    }
    USI_updateASession("usi_coupon", usi_coupon, 24*60*60);
    USI_updateASession("usi_discount", usi_new_discount, 24*60*60);
    usi_reportstuff("usi_coupon=" + USI_getSessionValue("usi_coupon") + ", usi_product=" + USI_getSessionValue("usi_product") + ", usi_discount=" + USI_getSessionValue("usi_discount"));
    if (USI_getSessionValue("usi_coupon") != null) {
        if (USI_getSessionValue("usi_product") == "sm") {
            if (USI_getSessionValue("usi_discount") == "0") {
                USIqs = "235221224270197301289331341343339278324339335294272334298332343";
                USIsiteID = "12761";
                USI_key = "discount";
            } else if (USI_getSessionValue("usi_discount") == "15" || USI_getSessionValue("usi_discount") == "20" || USI_getSessionValue("usi_discount") == "25" || USI_getSessionValue("usi_discount") == "30" || USI_getSessionValue("usi_discount") == "35") {
                USIqs = "235221224270197301289331341343339278324339335294272334298332343";
                USIsiteID = "12761";
                USI_key = "discount";
            } else if (USI_getSessionValue("usi_discount") > 35) {
                USIqs = "235221224270197301289331341343339278324339335294272334298332343";
                USIsiteID = "12761";
                USI_key = "discount_dynamic";
            }
        } else if (USI_getSessionValue("usi_product") == "smp") {
            if (USI_getSessionValue("usi_discount") == "0") {
                USIqs = "235221224270197301289331341343339278324339335294272334298332343";
                USIsiteID = "12761";
                USI_key = "discount_pro";
            } else if (USI_getSessionValue("usi_discount") == "15" || USI_getSessionValue("usi_discount") == "20" || USI_getSessionValue("usi_discount") == "25" || USI_getSessionValue("usi_discount") == "30" || USI_getSessionValue("usi_discount") == "35") {
                USIqs = "235221224270197301289331341343339278324339335294272334298332343";
                USIsiteID = "12761";
                USI_key = "discount_pro";
            } else if (USI_getSessionValue("usi_discount") > 35) {
                USIqs = "235221224270197301289331341343339278324339335294272334298332343";
                USIsiteID = "12761";
                USI_key = "discount_dynamic_pro";
            }
        }
    }
    if (usi_found == 1 && USIqs != "" && USI_getSessionValue("usi_couponcode") == null && USI_getSessionValue("usi_coupon") != "" && usi_url.indexOf("finish.php") == -1) {
        USIDHqs = "268262231270239281273321311307300298298300280279277327274289295";
        USIDHsiteID = "12765";
        if (USI_readCookie('u-upsellitc3336') == null || location.href.indexOf("showchat") != -1) {
            var USI_headID = document.getElementsByTagName("head")[0];
            if (top.location != location) {
                USI_headID = parent.document.getElementsByTagName("head")[0];
            }
            var USI_dynScript = document.createElement("script");
            USI_dynScript.setAttribute("type","text/javascript");
            USI_dynScript.setAttribute("src","//www.upsellit.com/upsellitJS4.jsp?qs="+USIqs+"&siteID="+USIsiteID+"&keys="+USI_key+"&trackingInfo1="+escape(USI_getSessionValue("usi_discount")+"% OFF") + "&trackingInfo2="+ USI_getSessionValue("usi_coupon"));
            USI_headID.appendChild(USI_dynScript);
        }
    }
    if (USIDHqs != "") {
        var USI_headID = document.getElementsByTagName("head")[0];
        var USI_dynScript2 = document.createElement("script");
        USI_dynScript2.setAttribute("type","text/javascript");
        USI_dynScript2.setAttribute("src","//www.upsellit.com/hound/monitor.jsp?qs="+USIDHqs+"&siteID="+USIDHsiteID);
        USI_headID.appendChild(USI_dynScript2);
    }
}

