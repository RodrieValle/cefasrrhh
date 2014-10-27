/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Funciones JavaScript de las páginas JSP


//Funciones de 'modificarperfil.jsp'

var noDeTitulos = 0;

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

function agregarTitulo()
{
    var nuevoTitulo = "<div id='tit"+noDeTitulos+"'><div class='col-xs-5'> Título: <input type='text' name='titulo"+noDeTitulos+"' value=''"
    +"class='form-control input-sm' required/> </div><div class='col-xs-4'>Lugar: <input type='text'"
    +" name='lugar"+noDeTitulos+"' value='' class='form-control input-sm' required/></div><div class='col-xs-2'>"
    +"Fecha: <input type='text' name='fecha"+noDeTitulos+"' value='' class='form-control "
    +"input-sm' required/></div><div class='col-xs-1'><br><button type='button' class='btn btn-danger"
    +" btn-sm center-block' onclick='eliminarTitulo("+noDeTitulos+")'><span class='glyphicon glyphicon-remove'></span></button></div></div>";
    $('#titulos').append(nuevoTitulo);
    noDeTitulos++;
}

function eliminarTitulo(numero)
{
    var seccion = "#tit"+numero;
    $(seccion.toString()).remove();
}

function cantidadDeTitulos()
{
    document.getElementById('noDeTitulos').value = noDeTitulos;
}


