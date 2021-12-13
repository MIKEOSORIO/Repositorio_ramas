var showmenu = true;
var MaxWidthMenu = 265;
var MinWidthMenu = 53;
var bodyPaddingleft = 25;

$(document).ready(function () {
    Selectedmenu();
    if (getCookie("menu") == "") {
        MenuCollapse();
    } else {
        if (getCookie("menu") == "true") {
            MenuShow();
        } else {
            MenuCollapse();
        }
    }

    $('#BurgerButton').click(function () {
        if (!showmenu)
            MenuShow();
        else
            MenuCollapse();
        addTrannsitions();
    })
});

function MenuCollapse() {
    if (screen.width > 700) {
        $('#navbar_main').css("padding-left", MinWidthMenu + bodyPaddingleft);
        $('#bodyPage').css("padding-left", MinWidthMenu + bodyPaddingleft);
        $('#myUL').css("width", MinWidthMenu);
    } else {
        $('#navbar_main').css("padding-left", MinWidthMenu + 10);
        $('#bodyPage').css("padding-left", bodyPaddingleft);
        $('#myUL').css("width", "0px");
    }
    $(".card").addClass("cardtooltip");
    showmenu = false;
    setCookie("menu", "false", 1);
}

function MenuShow() {
    if (screen.width > 700) {
        $('#navbar_main').css("padding-left", MaxWidthMenu + bodyPaddingleft);
        $('#bodyPage').css("padding-left", MaxWidthMenu + bodyPaddingleft);
        $('#myUL').css("width", MaxWidthMenu);
    } else {
        $('#navbar_main').css("padding-left", MinWidthMenu + 10);
        $('#bodyPage').css("padding-left", bodyPaddingleft);
        $('#myUL').css("width", MaxWidthMenu);
    }
    $(".card").removeClass("cardtooltip");
    showmenu = true;
    setCookie("menu", "true", 1);
}

function addTrannsitions() {
    $('#navbar_main').css("transition", "all 300ms ease");
    $('#bodyPage').css("transition", "all 300ms ease");
    $('#myUL').css("transition", "all 300ms ease");
}

function Selectedmenu() {
    var urlp = window.location.pathname;
    if (urlp.includes("Cliente") || urlp.includes("Serial/Index/") || urlp.includes("Configuracion")) {
        $("#Menu01").addClass("active");
    } else if (urlp.includes("Producto") || urlp.includes("Version")) {
        $("#Menu02").addClass("active");
    } else if (urlp.includes("Satellite") || urlp.includes("SatellitesSerialKeys")) {
        $("#Menu03").addClass("active");
    } else if (urlp.includes("Usuario") || urlp.includes("Licencia")) {
        $("#Menu04").addClass("active");
    }
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}