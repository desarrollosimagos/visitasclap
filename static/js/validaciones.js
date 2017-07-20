$(document).ready(function() {
    $("input:text,select,textarea,input:password").attr('class','form-control');
//    $('#josue').DataTable( {
//	responsive: true
//    } );
//$("input:submit,button,input:file").attr('class','btn btn-success');



////////////////////////////////////////////////////////////////////////////////////////////////////////
// Limpiar Campos
////////////////////////////////////////////////////////////////////////////////////////////////////////

	    $('#limpiar').click(function(){
		$('select').select2('val',0)
		$('input[type="text"],textarea').val('')
		$('#id_cod_municipio,#id_cod_sector,#id_cod_parroquia,#id_circuito,#id_cod_pol, #id_cod_n').find('option:gt(0)').remove().end();		
	    });

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Al cambiar de opción en el combo de municipio dependientes de los estados
////////////////////////////////////////////////////////////////////////////////////////////////////////
    $('#id_cod_estado').change(function() {
        var id_est = $('#id_cod_estado').val();
	
        $('#id_cod_municipio,#id_cod_parroquia').find('option:gt(0)').remove().end().select2('val', '0');
        if (id_est > 0) {
            $.get('/menu/topologia/parroquias/busqueda_ajax/', {'id':id_est}, function(data) {
            var option = "";
            $.each(data, function(i) {
                option += "<option value=" + data[i].fields.cod_municipio + ">" + data[i].fields.municipio + "</option>";
            });
            $('#id_cod_municipio').append(option);
            }, 'json');
        }
    });

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Al cambiar de option en el combo parroquia dependientes de los municipios
////////////////////////////////////////////////////////////////////////////////////////////////////////
    $('#id_cod_municipio').change(function() {
	var id_est  = $('#id_cod_estado').val();
	var id_mun  = $("#id_cod_municipio").val();
	var id_parr = $('#id_cod_parroquia').val();
	$('#id_cod_parroquia').find('option:gt(0)').remove().end().select2('val', '0');
	if (id_est > 0 && id_mun > 0) {
	
	    $.get('/menu/topologia/parroquias/busqueda_ajax2/', {'id_est':id_est,'id_mun':id_mun}, function(data) {
		var option = "";
		$.each(data, function(i) {
		    option += "<option value=" + data[i].fields.cod_parroquia + ">" + data[i].fields.parroquia + "</option>";
		});
		$('#id_cod_parroquia').append(option);
	    }, 'json');
	}
    });
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////
// Al cambiar de option en el combo sector dependientes de las Parroquias
////////////////////////////////////////////////////////////////////////////////////////////////////////
    $('#id_cod_parroquia').change(function() {
	var id_est  = $('#id_cod_estado').val();
	var id_mun  = $("#id_cod_municipio").val();	
	var id_parr = $('#id_cod_parroquia').val();
	var id_sec  = $("#id_cod_sector").val();
	
	$('#id_cod_sector').select2('val', '0');
	if (id_est > 0 && id_mun > 0) {	
	    $.get('/configuraciones/topologia/poligonales/busqueda_sector/', {'id_est':id_est,'id_mun':id_mun,'id_parr':id_parr}, function(data) {
	    var option = "";
		$.each(data, function(i) {
		    option += "<option value=" + data[i].pk + ">" + data[i].fields.sector + "</option>";
		});
		$('#id_cod_sector').append(option);
	    
	    }, 'json');
	}
    
    });


////////////////////////////////////////////////////////////////////////////////////////////////////////
// Al cambiar la institucion aparecen las dependencias asociados a el
////////////////////////////////////////////////////////////////////////////////////////////////////////
    $('#institucion').change(function() {
        var id_inst = $('#institucion').val();

        $('#dependencia').find('option:gt(0)').remove().end().select2('val', '0');
        if (id_inst > 0) {
            $.get('/menu/configuraciones/instituciones/busqueda_dependencia/', {'id':id_inst}, function(data) {
                var option = "";
                $.each(data, function(i) {
                    option += "<option value=" + data[i].pk + ">" + data[i].fields.nom_dependencia +"</option>";
                });
                $('#dependencia').append(option);
            }, 'json');
        }
    });
    




////////////////////////////////////////////////////////////////////////////////////////////////////////
// Al cambiar de option en el combo centros dependientes de los sectores
////////////////////////////////////////////////////////////////////////////////////////////////////////
    $('#id_cod_parroquia').change(function() {
	var id_est  = $('#id_cod_estado').val();
	var id_mun  = $("#id_cod_municipio").val();	
	var id_parr = $('#id_cod_parroquia').val();
	var id_cen  = $("#id_cod_n").val();
	
	$('#id_cod_n').find('option:gt(0)').remove().end();
	if (id_est > 0 && id_mun > 0) {	
	    $.get('/configuraciones/centros/busqueda_centros/', {'id_est':id_est,'id_mun':id_mun,'id_parr':id_parr}, function(data) {
	    var option = "";
		$.each(data, function(i) {
		    option += "<option value=" + data[i].fields.cod_n + ">" + data[i].fields.nombre + "</option>";
		});
		$('#id_cod_n').append(option);
	    
	    }, 'json');
	}
    
    });
    

})
////////////////////////////////////////////////////////////////////////////////////////////////////////
// Al sleccionar un checkbo
////////////////////////////////////////////////////////////////////////////////////////////////////////
//$("input:checkbox[name='niveles']").change(function() {
//    var este = $(this)
//    if ($(this).is(':checked')) {
//        $("input:checkbox[name='niveles']").not(este).prop('disabled',true)
//    } else {
//        $("input:checkbox[name='niveles']").not(este).prop('disabled',false)
//    }
//});




////////////////////////////////////////////////////////////////////////////////////////////////////////
// Funcion para Cargar foto 
////////////////////////////////////////////////////////////////////////////////////////////////////////

function PreviewImage() {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("id_foto").files[0]);

        oFReader.onload = function (oFREvent) {
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        };
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////////////
// Funcion global para depurar
////////////////////////////////////////////////////////////////////////////////////////////////////////
function eliminar_data(pk_id, url) {
    id_data= String(pk_id)
    r = confirm("¿Realmente desea eliminar el registro?!");
    if (r == true) {
        location.href=url+id_data;
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////////
