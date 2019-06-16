PROGRAM MATRIX;

uses crt;

TYPE
	MT = array[1..4,1..4] of integer;
	TV = array[1..4] of integer;
VAR
	matriz: MT;
	n, m: byte;

PROCEDURE leerArchivo(var matriz:MT;var n,m:byte);
VAR 
	i, j: byte;
	arch: text;
BEGIN
n := 0;
assign(arch, 'matriz.txt');
reset(arch);
read(arch, n); read(arch, m);
for i:= 1 to n do
	for j:= 1 to m do
	begin
		read(arch, matriz[i,j]);
	end;
close(arch);
END;

PROCEDURE escribirMatriz(matriz: MT; n,m:byte);
VAR
	i,j: byte;
BEGIN
for i:= 1 to n do
begin
	write('Fila ',i,': ');
	for j:= 1 to m do
	begin
		if (j = m) then
			writeln(matriz[i,j]:4)
		else
			write(matriz[i,j]:4,' - ');
	end;
end;
END;

FUNCTION encontrar(matriz:MT; n,m:byte; num:integer):integer;
var 
	i,j :byte;
	veces: integer;
BEGIN
	veces := 0;
	for i:=1 to n do
		for j:= 1 to m do
			if (matriz[i,j] = num) then
				veces := veces + 1;
	encontrar := veces;
END;

PROCEDURE uno(matriz:MT; n,m:byte);
VAR
	num: integer;
BEGIN
	writeln('Ingrese un numero: ');readln(num);
	writeln('Su numero se encuentra ', encontrar(matriz, n, m, num) ,' veces en la matriz.');
	writeln('Presione cualquier tecla para continuar...');
	readkey;
END;

PROCEDURE dos(matriz:MT; n,m:byte);
var 
	i,j: byte;
	pos, neg, nul: integer;
BEGIN
	pos:= 0; neg:= 0; nul := 0;
	for i:= 1 to n do
		for j:= 1 to m do
		begin
			if	matriz[i,j] <> 0 then
				if matriz[i,j] < 0 then
					pos:= pos + 1
				else
					neg:= neg + 1
			else
				nul := nul + 1;
		end;
	writeln('Cantidad de Positivos: ', pos);
	writeln('Cantidad de Negativos: ', neg);
	writeln('Cantidad de Nulos: ', nul);
	writeln('Presione cualquier tecla para continuar...');
	readkey;
END;

PROCEDURE tres(var matriz:MT; n,m:byte);

BEGIN
END;

PROCEDURE escribirMatrizActual(matriz:MT; n,m:byte);
BEGIN
	escribirMatriz(matriz,n,m);
	writeln('Presione cualquier tecla para continuar...');
	readkey;
END;

PROCEDURE Menu(matriz:MT; n,m:byte);
VAR op:char;
BEGIN
	repeat
	writeln('Matriz actual posee ', n ,' filas y ',m,' columnas.');
	writeln('1 - Dado un numero, calcular cuantas veces se repite (puede no estar).');
	writeln('2 - Indicar cuantos elementos son nulos, positivos y negativos.');
	writeln('3 - Intercambiar la fila K con la fila H (K y H menor o igual que N).');
	writeln('4 - Escribir matriz actual.');
	writeln('F - Salir');
	op := UPCASE(readkey);
	case op of
		'1':uno(matriz, n, m);
		'2':dos(matriz, n, m);
		'3':tres(matriz, n, m);
		'4':escribirMatrizActual(matriz, n, m);
	end;
	until(op = 'F');
END;

BEGIN
	leerArchivo(matriz, n, m);
	Menu(matriz, n,m);
END.
