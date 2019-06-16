PROGRAM eldiez;

USES CRT;

TYPE
	vector = array[1..100] of real;
	posiciones = array[1..100] of byte;
VAR
	v: vector;
	n: byte;
	x: real;
	
procedure generateArray(size:byte; x: real;var vector:vector);	
var i: byte;
begin
	for i:= 1 to size-1 do
		vector[i] := random(100) + random(10)/10;
	if (x > 10) then
		vector[n] := x
	else
		vector[n] := 3.2;
end;

PROCEDURE escribirArreglo(vector:vector;n:byte);
var i : byte;
BEGIN
	for i:= 1 to n do
	begin
		writeln(i,' : ',vector[i]:0:1);
	end;
END;

PROCEDURE buscarLaX(x:real;v:vector;n:byte);
var 
	i,k: byte;
	posicion: posiciones;
BEGIN
	k := 0;
	for i:=1 to n do
		if (v[i] = x) then
		begin
			k := k + 1;
			posicion[k] := i;
		end;
	if k <> 0 then
		if k = 1 then
			writeln('El numero pertenece al conjunto en la posicion ',posicion[1])
		else
		begin
			writeln('El numero aparece en el conjunto ', k ,' veces.');
			writeln('Sus posiciones son: ');
			for i:= 1 to k do
				write(posicion[i],' ');
		end
	else
		writeln('El numero no aparece en el conjunto.');
END;


BEGIN
	writeln('Ingrese el numero que quiere encontrar:');
	readln(x);
	writeln('Ingrese el tamanio del arreglo:');
	readln(n);
	clrscr;
	generateArray(n,x,v);
	buscarLaX(x,v,n);
END.
