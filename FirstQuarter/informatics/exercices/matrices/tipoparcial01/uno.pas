PROGRAM uno;

uses crt;

TYPE
	TV = array[1..100] of integer;
	TR = array[1..100] of real;
	TM = array[1..100, 1..100] of integer;

VAR
	matriz : TM;
	vector, vFila : TV;
	vProm : TR;
	n, m, size: byte;
	
PROCEDURE leerArchivo(var matriz: TM; var vector: TV;var n,m:byte);
var
	arch:text;
	i, j: byte;
BEGIN
assign(arch, 'uno.txt'); reset(arch);
read(arch, n); readln(arch, m);
for i:= 1 to n do
begin
	for j:= 1 to m do
		read(arch,matriz[i,j]);
	readln(arch,vector[i]);
end;
close(arch);
END;

FUNCTION promedio(matriz: TM; vector:TV; fila,columnas:byte):real;
var 
	i: byte;
	suma, divisor:integer;
BEGIN
suma:= 0; divisor:= 0;
for i:= 1 to columnas do
begin
	if ((matriz[fila, i] mod vector[fila]) = 0) then
	begin
		suma := suma + matriz[fila, i];
		divisor := divisor + 1;
	end;
end;
if suma > 0 then
	promedio := suma / divisor
else 
	promedio := 0;
END;

FUNCTION BusquedaMatriz(vProm:TR; n:byte; promedio:real):byte;
var 
	i: byte;
BEGIN
BusquedaMatriz := 0;
for i:= 1 to n do
begin
	if (vProm[i] = promedio) then
		BusquedaMatriz := 1;
end;
END;

PROCEDURE generarArreglos(matriz: TM; vector:TV; n,m:byte; var vProm:TR; var vFila:TV; var size:byte);
var 
	i: byte;
	prom : real;
BEGIN
size := 0;
for i:= 1 to n do
begin
	prom := promedio(matriz, vector, i, m);
	if((prom <> 0) and (BusquedaMatriz(vProm, n , prom) <> 1)) then
	begin
		size := size + 1;
		vProm[size] := prom;
		vFila[size] := i;
	end;
end;
END;

PROCEDURE imprimirArreglos(vProm:TR; vFila:TV; n:byte);
var
	i: byte;
BEGIN
	writeln('vProm   vFila');
	for i:=1 to n do
		writeln(vProm[i]:5:2,' - ',vFila[i]:5);
END;

BEGIN
	leerArchivo(matriz, vector, n, m);
	generarArreglos(matriz, vector, n, m, vProm, vFila, size);
	imprimirArreglos(vProm, vFila, size);
END.
