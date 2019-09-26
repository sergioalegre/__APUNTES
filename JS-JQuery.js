/***********
JS - jQuery
***********/

//CARGAR UNA FUNCION AL CARGAR UNA PÁGINA
	//JS 
	window.addEventListener('load', init);
	function init(){}
	//jQuery
	$(function(){});
	$(document).ready(function(){});  //¿? no estoy 100% seguro


//SELECCIONAR ELEMENTOS
	//JS método1
	document.querySelector('#elemento');
	//JS método2
	document.getElementById('elemento');
	//jQuery


//DATASET
	//Leer JS
	var elementos = document.querySelectorAll('[data-atributo]');
	//Leer jQuery

	//escribir JS
	elementos.dataset.a = "nuevo valor";
	//escribir jQuery
	$('#elementos').data('atributo','nuevo valor');


//CREAR ELEMENTOS
	//JS
	var target = document.getElementById('contenido');
	var imagen = document.createElement('img');
	imagen.setAttribute('src','img/1.jpg');
	target.appendChild(imagen);
	//jQuery
	

//MANEJAR EVENTOS
	//JS método1
	elemento.addEventListener('click', function(){});
	//JS método2
	elemento.onclick = function(){};
	//jQuery


//AÑADIR,QUITAR,SABER SI TIENE UNA CLASE CSS, Y PERMUTAR CLASE CSS DE UN ELEMENTO
	//JS
	elemento.classlist.add('rojo');  //se pueden añadir varias separandolas por comas
	elemento.classlist.remove('rojo');
	if(elemento.classList.contains('rojo')){}
	elemento.classList.toggle('rojo');
	//jQuery
