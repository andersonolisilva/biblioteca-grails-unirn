// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require bootstrap
//= require_tree .
//= require_self

var galeria = {
		init : function(){
			$("#frmGaleria").submit(galeria.submit);
			galeria.loadLista();
		},
		submit: function(e){
			e.preventDefault();
			console.log("Preparando para Enviar");
			$.ajax({
				url:"/GaleriaVirtual/galeria/save",
				type: "POST",
				contentType: "application/json",
				data: $("#frmGaleria").serialize()
			}).done(function(){
				$("#frmGaleria input[type='text'],textarea").val("");
				galeria.loadLista();
			})
			console.log("Concluído!");
		},
		loadLista: function(){
			$.ajax({
				url:"/GaleriaVirtual/galeria/listAll",
				type: "GET",
				contentType: "application/json"
			}).done(function(data){
				console.log(data);
				//$("#tblGaleria")
			})
		}
};

$(document).ready(function(){
	galeria.init();
});