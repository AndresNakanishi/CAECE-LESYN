PROGRAM NAKANISHI;

TYPE
	TV = array[1..100] of integer;
	TREAL = array[1..100] of real;

VAR
	vEntrada: TV;
	vSalida: TREAL;
	nEntrada, nSalida: byte;

PROCEDURE leerArchivo(var vector:TV;var n:byte);
VAR arch: text;
BEGIN
n := 0;
assign(arch, 'vector.txt');
reset(arch);
while not eoln(arch) do
begin
	n := n + 1;
	read(arch, vector[n]);
end;
close(arch);
END;

PROCEDURE calcular(vector:TV; n:byte; var vProm:TREAL; var nProm: byte);
VAR 
	acum, cantidad: integer;
	i, hayNegativoAntes:byte;
BEGIN
nProm:= 0; acum := 0; cantidad := 0;
for i := 1 to n do
BEGIN
if vector[i] < 0 then
begin
	// Esta variable solo tiene el propósito de  
	// encontrar el primer número negativo en el array
	hayNegativoAntes := 1;
	if ((acum <> 0) and (cantidad <> 0)) then
	begin
	nProm := nProm + 1;
	vProm[nProm] := acum / cantidad;
	acum := 0; cantidad := 0;
	end;
end
else if ((vector[i] > 0) and (hayNegativoAntes = 1)) then
begin
	acum := acum + vector[i];
	cantidad := cantidad + 1;
end;
END;

END;

PROCEDURE mostrarSalida(vector:TREAL; n:byte);
VAR i:byte;
BEGIN
if n <> 0 then
BEGIN
writeln('Los promedios son los siguientes:');
FOR i := 1 to n do
	write(vector[i]:0:2,' ');
END
ELSE 
	writeln('No hubo numeros negativos.');
END;

BEGIN
leerArchivo(vEntrada, nEntrada);
calcular(vEntrada, nEntrada, vSalida, nSalida);
mostrarSalida(vSalida, nSalida);
END.
