/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Funciones JavaScript de las páginas JSP


//Funciones de 'modificarperfil.jsp'

function cargarImagen()
{
    $("#foto").attr("src", "img/ico_cargando.gif");
    var sampleFile = document.getElementById("filefoto").files[0];
    var formdata = new FormData();
    formdata.append("sampleFile", sampleFile);
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "subirImagen", true);
    xhr.send(formdata);
    xhr.onload = function(e) {
        if (this.status === 200) {
            $("#foto").attr("src", this.responseText);
            $('#urlFoto').val($('#foto').attr('src'));
        }
    };
}


