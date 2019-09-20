#!/usr/bin/env python
# coding: utf-8

    anInteger = 3
    anInteger/3
    if type(anInteger) == "int":
        print("OK!")

    aBoolean = True
    type(aBoolean)
    3 > 1 #True
    1 > 2 #False


##LISTAS: son listas mutables definidas entre corchetes

    lista = []
    lista #devolvera []

    lista.append(23) #lo añaderá al final
    lista #devolvera [23]

    lista += ["the", 32]
    lista #devolvera [23, 'the', 32]

    len(lista) #devolvera 3

    lista = [3,-2,45,99,4]
    lista[0] #devolvera 3

    lista[:] #devolvera toda la lista: [3, -2, 45, 99, 4]

    lista[2:] #devolvera desde la posición 2: [45, 99, 4]

    lista[2:4] #devolvera desde la posición 2 a la 4: [45, 99]

    lista.index(-2) #busca la posición dentro de la lista: 1

    lista.remove(-2) #eliminar esa valor de la lista
    #otro metodo de eliminar
    eliminado = lista.pop(-2) #elimina el penultimo elemento
    eliminado #devolverá 99
    lista #devolverá [3, 45, 4]

    sorted (lista) #ordenará siempre y cuando sea todo int, o texto
    sorted (lista, reverse=True) #ordenar al revés



##TUPLAS: listas NO mutables, definidas entre parentesis

    tupla =(3,2,"hola", [], "hola")
    tupla.count("hola") #devolverá 2

    #tupla += 1 #devolverá error, no se puede modificar una tupla

    tupla[3].append("Adios") #esto si es permitido porque el elemento de posicion 3 de la tupla es una lista
    tupla #devolverá (3, 2, 'hola', ['Adios'], 'hola')


##DICCIONARIOS: definidos entre llaves {} separa elementos con :

    dicc = {"nombre":"Sergio", "llave":"25"}
    dicc["llave"] #devuelve 25

    #dicc["NOMBRE"] #devuelve error, es casesensitive

    dicc.keys() #devuelve todas las llaves: dict_keys(['nombre', 'llave'])
    dicc.values() #devuelve todos los valores: dict_values(['Sergio', '25'])

    len(dicc) #devuelve 2

    del dicc["nombre"]
    dicc #devuelve {'llave': '25'}


##STRINGS, CADENAS

    cadena = "Test \t \n \" "
    cadena #devuelve 'Test \t \n " '
    #print(cadena) #devuelve Test tabula, salto de carro y "

    cadena = "mi variable string %s" % ("CADENA")
    cadena #devuelve 'mi variable string CADENA'

    cadena = "mi variable float %f" % (3)
    cadena #devuelve 'mi variable float 3.000000'

    cadena = "mi texto"
    cadena[4] #'e'
    cadena[1:3] #'i '

    #cadena.capitalize() #'Mi texto'
    #cadena.upper() #'MI TEXTO'

    cadena.replace("texto", "XXX") #buscara texto y lo remplazará por XXX
    cadena

    cadena.split(" ") #transforma una cadena en lista con el patron usado de parametro en este caso un espacio
    cadena #devolvera ["mi", "texto"]

    cadena.index("texto") #devuelve la posición dentro de la lista en este caso 1


##TIPS

    var = "cadena"
    get_ipython().run_line_magic('pinfo', 'var.strip')


    Ctrl + Enter para ejecutar
    Ctrl + / para comentar en bloque


##OPERADORES LOGICOS

    x = 50
    x == 49 #False
    x !=49 #True

    x = "22"
    int(x) == 22 #Convertivo x a int y la comparacion es valida


##IF
    x=6
    if x > 20:
        print("OK")
    elif x / 3 == 2:
        print("x es 6")
    elif type(x) == str:
        print("x es una cadena")
    else:
        print("NOT OK")


##TRY EXCEPT
    #ejemplo1
    try:
        3/0
        print("lo hizo")
    except Exception as ex:
        print("excepcion: %s" % ex)
        

    #ejemplo2
    lista = [1,2,3,4]
    a = "XXX"
    try:
        if (5 not in lista) and (a =="XXX"):
            3*0
            print("lo hizo")
    except ZeroDivisionError as ex:
        print("Error: %s" % ex)
    except ArithmeticError as ex:
        print("Error: %s" % ex)
    finally:
        print("termine")


##ADVANCED LOGIC
    x = ["Casa", 3, 22]
    y= 12
    z = "Coche"

    if (2 in x) or (y > x[1]):
        print("cumple una condicion")
    else:
        print("NO las cumple")


##PROBLEMA IMPUT
    x = input("dame un numero: ")

    try:
        x = int(x) #le convertimos a entero

        if x > 20:
            print("es mayor de 20")

        elif x % 2 == 1:
            print("es un numero impar y menor a 20")

        else:
            print ("Ni par ni mayor a 20, era: " + x)
        
    except:
        print("no me diste un numero")

##FOR LOOPS
    #ejemplo1
    lista = [4,13,25,41,78]
    for i in lista:
        print(i)
        
    #ejemplo2
    cadena ="hola"
    for c in cadena:
        print(c)

    #ejemplo3
    for orden_inv in sorted(lista, reverse=True): #ordenar una lista
        print(orden_inv)

    #ejemplo4
    dicc = {"nombre":"Sergio", "edad":41, "perfil":{}}
    for a in dicc:
        print(a, dicc[a], type(dicc[a]))

    #ejemplo5
    dicc2 = {"hora1": 2, "hora2": 13, "hora3": 19}
    for valor in dicc2.values():
        print(valor) #devuelve 2 13 19

    #ejemplo6
    for clave, valor in dicc2.items():
        print(clave, valor) #devuelve hora1 2 hora2 13 hora3 19


##WHILE LOOPS
    #ejemplo1
    i = 0
    while i < 10:
        print("looping")
        i += 1

    #ejemplo2
    i = 1
    while (i<10) and (i%2==1):
        print("loop",i)
        i+=1

##CONTINUE, BREAK, PASS
    #ejemplo1
    lista1 = [1,3,5,7,9,12,23]
    for index, data in enumerate(lista1): #funcion enumerate
        print(index, data)

    lista2 = [9,8,7,6]
    for d1, d2 in zip(lista1, lista2): #funcion zip
        print(d1,d2)
        

    for i in lista1[:2]: #imprime los dos primeros elementos de lista1
        print(i)
        

    #ejemplo2
    dicc ={"nombre":"sergio", "edad":"41"}
    for valor in dicc.values():
        if valor == "sergio":
            print("Soy yo")
            continue #probar con break y pass para ver que hace
    #         break
    #         pass
        print(valor)


##PROBLEMA ROMBO
    ancho = 5
    for i in range(ancho):
        #print("i=",i)
        print(''*(ancho-i-1)+'$'*(i+1))
    for j in range(ancho-1,0,-1):
        #print("j=",j)
        print(''*(ancho-j)+'$'*(j))
        


##PROBLEMA ADIVINA EL NUMERO
    import random
    numero = random.randint(1,10) #elegimos un aleatorio de 1 a 10
    respuesta = 0
    intento = 0
    while(respuesta != numero):
            respuesta = int(input("dime un numero "))
            intento+=1
            if (respuesta == numero):
                print("Has encontrado el numero en el intento: %s" % intento)
                break
            continue


##FUNCIONES
    #ejemplo1
    def funcion1(param1):
        if type(param1) in [int, float]:
            print("es entero o float")
            
    x = funcion1("a")
    y = funcion1(4.0)

    #ejemplo2 - funcion con dos parametros y con return
    def suma(x,y):
        return x+y

    suma(2,3)


## *args y **kwargs
    #ejemplo1 con *args, aceptará un numero indefinido de parametros y crea una lista con ellos
    def funcion1(*args):
        for arg in args:
            print(type(arg))

    funcion1(1,"casa",4.0)

    #ejemplo2 *args y un parametro de inicio
    def funcion2(param1, param2, *args): #que se salte los dos primeros parametros
        for arg in args:
            print(type(arg)) #devolverá <class 'float'>

    funcion2(1,"casa",4.0)

    #ejemplo3 con **kwargs, aceptará un numero indefinido de parametros y crea un diccionario con ellos
    def funcion3(**kwargs):
        print(kwargs) #devuelve {'x': 1, 'y': 3, 'z': 7}

    funcion3(x=1, y=3, z=7)

    #ejemplo4 con **kwargs, que se salte los dos primeros parametros
    def funcion4(p1,p2,**kwargs):
        print(kwargs) #devuelve {'x': 2, 'y': 3, 'z': 4}

    funcion4(1, "casa", x=2, y=3, z=4)

    #ejemplo5 *args y **kwargs juntos
    def funcion5(*args,**kwargs):
        print(args,kwargs) #devuelve una lista y un diccionario (2, 'coche', -4) {'x': 3, 'y': 4, 'z': 5}

    funcion5(2, "coche", -4, x=3, y=4, z=5)


##CLASES (objetos que almacenan funciones y atributos)
    #ejemplo1
    class clase1():
        test = 69
        def add10(self, p1): #https://pythontips.com/2013/08/07/the-self-variable-in-python-explained/
            #p1 será una variable local a la función
            self.p1 = p1
            if type(self.p1) != int:
                print("no es entero")
            else:
                print("es entero, le sumo 10")
                return p1 + 10

    a = clase1()
    a.add10(3) #devolvera 13
    #a.add10() #devolvera error porque falta el parametro
    a.test #devolvera 69

    #ejemplo2 cargar clases desde archivos
    from nombre_fichero import clase2 #habra un fichero llamado nombre_fichero.py en el mismo directorio q este archivo de Jupyter

    nombre_fichero.funcion()


##PROBLEMA manejo cadenas de texto
    texto = "en un lugar de la mancha de cuyo nombre no quiero acordarme"

    class parseador_lenguaje(object):
        def contar_palabras(self, document, **kwargs):
            self.document = document
            listaPalabras = {}
            if kwargs["raw"] == True:
                palabrasSplit = document.split(" ") #lo separams en palabras
            for palabra in palabrasSplit:
                if palabra not in listaPalabras:
                    listaPalabras[palabra] = 0
                listaPalabras[palabra] +=1
                
            return listaPalabras
        
        def contar_letras_diferentes(self, document, raw):
            self.document = document
            self.raw = raw
            diccLetras = {}
            if (type(self.raw) == bool) and (self.raw is not True):
                self.document = " ".join(self.document)
            elif type(self.raw) != bool:
                raise TypeError("Debe ser verdadero o falso")
            else:
                pass
            
            document = document.replace(" ","").lower()
            for caracter in document:
                if caracter not in diccLetras:
                    diccLetras[caracter] = 0
                diccLetras[caracter] +=1
                
            return diccLetras
        
        def eliminar_palabra(self, texto, *args):
            stopWords = args
            if type(texto) != list:
                texto = texto.split(" ")
            removedWords = [word for word in texto if word.lower() not in stopWords]
            
            return removedWords

    a = parseador_lenguaje()

    #dejar descomentada una de estas 3 líneas para ejecutar una de las funciones
    #a.contar_palabras(texto, raw=True)
    #a.contar_letras_diferentes(texto, True)
    a.eliminar_palabra(texto, "lugar", "mancha")


##PROBLEMA procesar datos de un .csv
    #columnas del archivo .csv
    # page_id
    # name
    # urlslug
    # ID
    # ALIGN
    # EYE
    # HAIR
    # SEX
    # GSM
    # ALIVE
    # APPEARANCES
    # FIRST APPEARANCE
    # Year

    import csv
    totalApariciones = {}
    vivosDict = {}

    with open('marvel-wikia-data.csv') as csv_file:
        reader = csv.reader(csv_file, delimiter=',')
        contador_lineas = 0
        for row in reader: #recorremos las rows
            nombre = row[1].split("(")[0].rstrip() #los nombres son Spider-Man (Peter Parker), asi quitamos lo que haya tras encontrar un parentesis
            vivoomuerto = row[9]
            mundo = row[1][row[1].find("(")+1:row[1].find(")")]
            try:
                aparecido = int(row[10])
            except:
                continue
            if vivoomuerto == "Living Characters":
                if mundo not in vivosDict:
                    vivosDict[mundo] = []
                if mundo not in totalApariciones:
                    totalApariciones[mundo] = 0
                    
                vivosDict[mundo].append(nombre)
                totalApariciones[mundo] += int(aparecido) 
                
        print(f'He leido {line_count} lineas.')

    print("Lista de personajes vivos: ",vivosDict)
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    print("Apariciones de cada personaje: ",totalApariciones)

##PROBLEMA adivinar numero
    import random

    cuantos_juegos = int(input("Cuantos juegos quieres "))
    i=0

    for i in range(cuantos_juegos):
        print("Comineza el juego número",i+1)
        numero = random.randint(1,5)
        respuesta = 0
        intento = 0
        while(respuesta != numero):
                respuesta = int(input("dime un numero "))
                intento+=1
                if(respuesta > numero):
                    print("muy alto")
                elif(respuesta < numero):
                    print("muy bajo")
                elif (respuesta == numero):
                    print("Has encontrado el numero en el intento: %s" % intento)
                continue
        i+=1
