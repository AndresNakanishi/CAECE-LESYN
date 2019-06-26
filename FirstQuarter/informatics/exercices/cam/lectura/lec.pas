program lectura;

uses crt;

TYPE
	TM = array[1..10, 1..10] of integer;

PROCEDURE leerArchivo(var matriz:TM;var n,m:byte);
VAR 
	arch:text;
	i,j:byte;
BEGIN
assign(arch,'lec.txt'); reset(arch);
// Leemos filas y columnas
read(arch,n,m);readln(arch);
for i:= 1 to n do
begin
	for j:= 1 to m do
		read(arch,matriz[i,j]);
	readln(arch);
end;
close(arch);
END;

PROCEDURE escribirArchivo(matriz:TM; n,m:byte);
var
	i,j:byte;
BEGIN
for i:= 1 to n do
begin
	for j:= 1 to m do
		write(matriz[i,j],' ');
	writeln();
end;
END;

var
	matriz: TM;
	n,m: byte;

BEGIN
	leerArchivo(matriz, n, m);
	escribirArchivo(matriz,n,m);
END.
