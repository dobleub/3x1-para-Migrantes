/*
 * FORMULARIO DE LOGUEO   
 */

$(function() {
    var curp = $("#curp"),
            contrasenia = $("#contrasenia"),
            allFields = $([]).add(curp).add(contrasenia),
            tips = $(".validateTips");
    function updateTips(t) {
        tips
                .text(t)
                .addClass("ui-state-highlight");
        setTimeout(function() {
            tips.removeClass("ui-state-highlight", 1500);
        }, 500);
    }
    function checkLength(o, n, min, max) {
        if (o.val().length > max || o.val().length < min) {
            o.addClass("ui-state-error");
            updateTips(n + " rango valido entre " +
                    min + " y " + max + " caracteres.");
            return false;
        } else {
            return true;
        }
    }
    function checkRegexp(o, regexp, n) {
        if (!(regexp.test(o.val()))) {
            o.addClass("ui-state-error");
            updateTips(n);
            return false;
        } else {
            return true;
        }
    }
    $("#formDialogLogin").dialog({
        autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
        resizable: false,
        buttons: {
            "Entrar": function() {
                var bValid = true;
                allFields.removeClass("ui-state-error");
                bValid = bValid && checkLength(curp, "Curp", 18, 18);
                bValid = bValid && checkLength(contrasenia, "Contraseña", 5, 16);
                bValid = bValid && checkRegexp(curp, /^[a-zA-Z]([0-9a-zA-Z])+$/i, "La CURP es compuesta solo ppor números y letras.");
                bValid = bValid && checkRegexp(contrasenia, /^([0-9a-zA-Z])+$/, "Contraseña incorrecta! Solo se aceptan: a-z 0-9");
                if (bValid) {
                    $("#formLogin").submit();
                    $(this).dialog("close");
                }
            },
            Cerrar: function() {
                $(this).dialog("close");
            }
        },
        close: function() {
            allFields.val("").removeClass("ui-state-error");
        }
    });
    $("#login")
            .button()
            .click(function() {
                $("#formDialogLogin").dialog("open");
            });
});