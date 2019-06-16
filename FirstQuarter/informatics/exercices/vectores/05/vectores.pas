program autos;

uses crt;

TYPE
	patente = array[1..100] of string[7];
	modelo = array[1..100] of word;
	precio = array[1..100] of real;
 
VAR
	vPat: patente;
	vMod: modelo;
	vPre: precio;
	n: byte;


PROCEDURE LeerArchivo(var patente:patente;var modelo:modelo;var precio:precio;var n:byte);
VAR arch: text;
BEGIN
	n := 0;
	assign(arch, 'vector.txt');
	reset(arch);
	while not eof(arch) do
	begin
		n := n + 1;
		readln(arch, patente[n],modelo[n],precio[n]);
	end;
	close(arch);
END;

FUNCTION minimo(precio:precio; n:byte):real;
var 
	i: byte; 
	min: real;
begin
	min := precio[1];
	for i:= 2 to n do
	begin
		if (precio[n] < min) then
			min := precio[n];
	end;
	minimo := min;
end;

PROCEDURE precioMinimo(vMod:modelo; vPre: precio; n: byte);
var 
	vPrecAnio : precio;
	anio:word;
	j, k: byte;
BEGIN
	clrscr;
	j := 0;
	writeln('Ingrese un anio: ');readln(anio);
	for k := 1 to n do
	begin
		if vMod[k] = anio then
		begin
			j := j + 1;
			vPrecAnio[j] := vPre[k];
		end;
	end;
	clrscr;
	if	j <> 0 then
		writeln('El precio minimo para el anio ',anio,' fue de $',minimo(vPrecAnio, j):0:2)
	else
		writeln('No hubo un precio ese anio.');
	writeln('Presione cualquier tecla para continuar...');
	readkey;
END;

PROCEDURE cantidadDeVehiculos(precio:precio; n:byte);
var
	contador, i : byte;
	monto: real;
BEGIN
	clrscr;
	writeln('Indique un precio: ');readln(monto);
	contador := 0;
	for i := 1 to n do
	begin
		if monto > precio[i] then
			contador := contador + 1;
	end;
	clrscr;
	writeln('La cantidad de autos por debajo de $',monto:0:2,' son: ', contador);
	writeln('Presione cualquier tecla para continuar...');
	readkey;
END;

FUNCTION promedio (precio:precio; n:byte):real;
var 
	i : byte;
	acumulador: real;
begin
	acumulador := 0;
	for i:= 1 to n do
	begin
		acumulador := acumulador + precio[i];
	end;
	promedio := acumulador / n;
end;

PROCEDURE rango(modelo: modelo; precio: precio; n: byte);
var 
	vPrecio: precio;
	anioA, anioB: word;
	i, j: byte;
BEGIN
	clrscr;
	writeln('Ingrese el anio inicial: '); readln(anioA);
	writeln('Ingrese el anio final: '); readln(anioB);
	j := 0;
	for i := 1 to n do
	begin
		if ((modelo[i] >= anioA) and (modelo[i] <= anioB)) then
		begin
			j := j + 1;
			vPrecio[j] := precio[i];
		end;
	end;
	if j <> 0 then
		writeln('El promedio de los autos entre el ',anioA,' y el anio ',anioB,' es de $',promedio(vPrecio,j):0:2)
	else
		writeln('No hay autos en ese rango de anios.');
	writeln('Presione cualquier tecla para continuar...');
	readkey;
END;

PROCEDURE escribirPatentes(patentes:patente;n:byte);
var i : byte;
BEGIN
	for i:= 1 to n do
	begin
		writeln(i,': ',patentes[i]);
	end;
END;

PROCEDURE mostrarPatentes(patentes:patente; modelos:modelo; n:byte);
var 
	patentesPost2018:patente;
	i, j: byte;
BEGIN
	clrscr;
	j := 0;
	for i := 1 to n do
	begin
		if modelos[i] > 2018 then
		begin
			j := j + 1;
			patentesPost2018[j] := patentes[i];
		end;
	end;
	if j <> 0 then
		begin
			writeln('Las patentes post 2018 son: ');
			escribirPatentes(patentesPost2018,j);
		end
	else
		writeln('No hay patentes despues del anio 2018.');
	writeln('Presione cualquier tecla para continuar...');
	readkey;
END;

FUNCTION buscar(patente:patente;x:string;n: byte):byte;
var i:byte;
BEGIN
	i := 1;
	while (i <= n) and (x <> patente[i]) do
		i := i + 1;
	if patente[i] = x then
		buscar := i
	else 
		buscar := 0;
END;

PROCEDURE buscarPatente(patente:patente;modelo:modelo;precio:precio;n:byte);
var 
	buscada: string[7];
	posicion: byte;
BEGIN
	clrscr;
	writeln('Esbriba la patente a buscar..');readln(buscada);
	clrscr;
	posicion := buscar(patente, buscada, n);
	if	posicion <> 0 then
	begin
		writeln('Auto encontrado!');
		writeln('Patente: ',patente[posicion]);
		writeln('Modelo: ',modelo[posicion]);
		writeln('Precio: $',precio[posicion]:0:2);
	end
	else
		writeln('No hay ningun auto con esa patente.');
	writeln('Presione cualquier tecla para continuar...');
	readkey;
END;

PROCEDURE Menu(vPat: patente; vMod:modelo; vPre:precio;n:byte);
var op: char;
BEGIN
	repeat
	clrscr;
	writeln('---- Menu ----');
	writeln('1 - Minimo por anio dado');
	writeln('2 - Para un precio dado, la cantidad de vehiculos por debajo de dicho valor');
	writeln('3 - Para un rango de anios dado, precio promedio de los autos en dicho rango (Puede no existir)');
	writeln('4 - Mostrar las patentes posteriores al anio 2018');
	writeln('5 - Buscar un auto por patente');
	writeln('0 - Salir');
	op := readkey;
	case op of
		'1': precioMinimo(vMod, vPre, n);
		'2': cantidadDeVehiculos(vPre,n);
		'3': rango(vMod,vPre,n);
		'4': mostrarPatentes(vPat,vMod,n);
		'5': buscarPatente(vPat,vMod,vPre,n);
	end;
	until(op = '0');
END;

BEGIN
	LeerArchivo(vPat,vMod,vPre,n);
	Menu(vPat,vMod,vPre,n);
END.
