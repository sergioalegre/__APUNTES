//OPERADORES ARITMETICOS, PARA FUNCIONES MATEMATICAS Y STRINGS

	var numero1 = 12;
	var numero2 = 5;

	var total = numero1 + numero2;

	document.write("la suma es " + total);
	document.write("<br>");

	numero1 +=1; //suma uno

	document.write(numero1);
	document.write("<br>");



//OPERADORES RELACIONALES

	var numero1 = 12;
	var numero2 = 12;

	if(numero1 == numero2)
	{
		document.write("Los numeros " + numero1 + " y " + numero2 + "  son iguales<br>");
	}
	else
	{
		document.write("Los numeros " + numero1 + " y " + numero2 + "  no son iguales<br>");
	}



//OPERADORES LOGICOS (&& || !)

	var numero1 = 12;
	var numero2 = 12;
	var numero3 = 10;
	var numero4 = 8;

	if(numero1 == numero2 !! numero3 < numero4)
	{
		document.write("OK");
	}
	else
	{
		document.write("Es falso");
	}

