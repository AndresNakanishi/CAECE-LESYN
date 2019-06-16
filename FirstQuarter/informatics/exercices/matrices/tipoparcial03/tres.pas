PROGRAM tres;

USES CRT;

TYPE
	st10 = string[10];
	productos = array[1..100] of st10;
	preciosC = array[1..100] of integer;
	preciosG = array[1..100,1..100] of integer;

VAR
	produCuidados: productos;
	preciosCuidados: preciosC;
	preciosComercios: preciosG;
	n,m: byte;

PROCEDURE leerArchivo(var prod:productos; var precios: preciosC; var preciosCom:preciosG; var n,m:byte);
VAR
	i,j: byte;
	arch: text;
BEGIN
assign(arch,'tres.txt'); reset(arch);
read(arch,n);readln(arch,m);
for i:= 1 to n do
begin
	read(arch, prod[i]); read(arch, precios[i]);
	for j:= 1 to m do
		if j = m then
			readln(arch,preciosCom[i,j])
		else
			read(arch,preciosCom[i,j]);
end;
close(arch);
END;

PROCEDURE resolverA(prod:productos; precios: preciosC; preciosCom:preciosG; n,m:byte);
VAR
	acum: integer;
	i,j:byte;
BEGIN
writeln('A:');
for i:= 1 to n do
begin
	acum:= 0;
	write(i,' - ',prod[i],' - Precio Cuidado: ',precios[i],' - Precio Promedio: ');
	for j:= 1 to m do
		acum := acum + preciosCom[i,j];
	writeln(acum/m:0:1);
end;
writeln('Presione cualquier tecla para continuar...');
readkey;
END;

PROCEDURE resolverB(precios: preciosC; preciosCom:preciosG; n,m:byte);
VAR 
	cont:integer;
	i,j: byte;
BEGIN
writeln('B:'); write('Comercio: ');
for j:= 1 to m do
begin
	cont:= 0;
	for i:= 1 to n do
		if preciosCom[i,j] <= precios[i] then
			cont := cont + 1;
	if j = m then
		writeln(j,' : ',cont)
	else
		write(j,' : ',cont, ' - ');
end;
writeln('Presione cualquier tecla para continuar...');
readkey;
END;

PROCEDURE resolverC(prod:productos; precios: preciosC; preciosCom:preciosG; n,m:byte);
var
	i,j,x:byte;
BEGIN
writeln('Ingrese un numero del 1 al ',n);
readln(x);
clrscr;
for i:= 1 to n do
	for j:= 1 to m do
END;

PROCEDURE Menu(prod:productos; precios: preciosC; preciosCom:preciosG; n,m:byte);
var
	op:char;
BEGIN
	repeat
	clrscr;
	writeln('1 - A');
	writeln('2 - B');
	writeln('3 - C');
	writeln('S - Salir');
	op := UPCASE(readkey);
	case op of
		'1':resolverA(prod, precios, preciosCom, n, m);
		'2':resolverB(precios, preciosCom, n, m);
		'3':resolverC(prod, precios, preciosCom, n, m);
	end;
	until(op = 'S');
END;

BEGIN
	leerArchivo(produCuidados, preciosCuidados, preciosComercios, n, m);
	Menu(produCuidados, preciosCuidados, preciosComercios, n, m);
END.
