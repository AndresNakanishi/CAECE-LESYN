PROGRAM CAMI;

TYPE
	vector = array[1..100] of integer;

VAR
	a, b: vector;
	n: byte;

PROCEDURE leerArchivo(var a,b:vector;var n:byte);
var 
	i:byte;
	arch: text;
BEGIN
assign(arch,'cam.txt');
reset(arch);
readln(arch,n);
writeln(n);
for i:= 1 to n do
begin
	read(arch,a[i]);
	write(a[i])
end;
for i:= 1 to 2*n do
begin
	read(arch, b[i]);
	write(b[i])
end;
close(arch);
END;

BEGIN
	leerArchivo(a,b,n);
END.
