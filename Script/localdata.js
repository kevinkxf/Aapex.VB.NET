var drugdata = ['Anthelios',
'Botox',
'Duroland',
'Dysport',
'Emla',
'Euflexxa',
'Hyalgan',
'Hylexin',
'Implanon',
'Juvederm',
'Kinerase',
'Lustra',
'Mirena',
'Neovisc',
'Ombrelle',
'Orthovisc',
'Ostenil',
'Paragard',
'Perlane',
'Radiesse',
'Reloxin',
'Restylane',
'Sculptra',
'Strivectin',
'Supartz',
'Suplasyn',
'Surgiderm',
'Synvisc'];

function getDigitsOnly(strValue) {
	return strValue.replace(/-/g, "");
}

function HasNDigits(strInput, intCount) {
	var reg = new RegExp("^[0-9]{" + intCount + "}");
	return reg.test(strInput);
}

function luhn_check(number) {
	var number_length = number.length;
	var parity = number_length % 2;
	var total = 0;
	for (i = 0; i < number_length; i++) {
		var digit = number.charAt(i);
		if (i % 2 == parity) {
			digit = digit * 2;
			if (digit > 9) {
				digit = digit - 9;
			}
		}
		total = total + parseInt(digit);
	}
	if (total % 10 == 0) {
		return true;
	} else {
		return false;
	}
}

function ShowPriceBeatForm() {
    $(document.getElementById("tbPB")).toggle();
}

function HidePriceBeatForm() {
    $(document.getElementById("tbPB")).hide();
}

function ShowBulkRequestForm() {
    $(document.getElementById("tbBR")).toggle();
}

function HideBulkRequestForm() {
    $(document.getElementById("tbBR")).hide();
}

function sp(e) {
    var t = $(e).parent().parent().parent().parent().parent();
    var pb = t.find("input")[0].value;
    if (validate(pb, "www.google.com") == true) {
        var p = t.find("input")[2].value;
        var npp = np(parseFloat(p), parseFloat(pb))
        if (npp > 0) {
            $(e).parent().prev().find("div").html('<br/><span class="pricebeat">Your New Price is $' + npp + '</span>');
        }
        else if (npp <= 0) {
            $(e).parent().prev().find("div").html("Can not beat this price");
        }
    }
}

function validate(price, url) {
    return /^[+]?\d+(\.\d+)?$/.test(price) & /(http:\/\/|https:\/\/|www\.)(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/.test(url)
}

function np(p, pb) {
    return (pb < p) ? ((pb - (p - pb) * 0.1).toFixed(2) > 0 ? ((pb - (p - pb) * 0.1).toFixed(2)) : 0.00) : p.toFixed(2)
}

function InitTooltip() {
    $(document).ready(function() {
        $(".pbImage").tooltip({
            delay: 0,
            showURL: false,
            extraClass: "rightsidetip",
            bodyHandler: function() {
                return $("div#d1").html();
            }
        });
    });
}