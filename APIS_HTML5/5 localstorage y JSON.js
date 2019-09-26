function Lista(clave)
{
	this.clave = clave;
	this.agregarActividad = function(actividad)
	{
		if(this.validarNavegador()){ //si el navegador soporta LocalStorage
			if(localStorage.getItem(this.clave)){ //comprobarmos si existia ya el localstorage o es la primera vez
				var actividades = JSON.parse(localStorage.getItem(this.clave));  //parse convierte el JSON a array, es lo contrario a stringify
			}
			else //es la primera vez, asi que inicializamos el array
			{
				var actividades = [];
			}
			actividades.push(actividad); //metemos la nueva actividad en el array
			localStorage.setItem(this.clave, JSON.stringify(actividades)); //en json se guardan conjuntos clave, valor, el segundo parametro es donde lo guardamos, actividades, pero convertido a JSON
			//stringify convierte array en JSON, es lo contrario a parse
			//es equivalente a : localStorage[this.clave] = JSON.stringify(actividades);
			return true;
		}	
		else return false;
	}

	this.validarNavegador = function()  //para comprobar si el navegador soporta LocalStorage
	{  
		if(typeof(Storage) !== "undefined") return true;
		else return false;
	}

	this.obtenerActividades = function()
	{
		if(localStorage.getItem(this.clave) != "undefined"){ //comprobarmos si ya hay algo en localstorage o es la primera vez
			return JSON.parse(localStorage.getItem(this.clave));
		}
		else return null;
	}

	this.eliminarActividad = function(actividad)
	{
		//primero leemos todas 
		var actividades = JSON.parse(localStorage.getItem(this.clave));

		//recorremos el array devolviendo todos los elementos que no sean el que queremos eliminar
		actividades = actividades.filter(function(i){
			return i != actividad;
		});

		//ya eliminado escribimos de nuevo la lista actualizada
		localStorage.setItem(this.clave, JSON.stringify(actividades));
	}

	this.eliminarTodasLasActividades = function(){
		localStorage.removeItem(this.clave);
	}
}