PROGRAM ascendente;

TYPE
	vector = array[1..100] of integer;
VAR
	v: vector;
	n: byte;

PROCEDURE LeerArchivo(var v:vector;var n:byte);
VAR arch: text;
BEGIN
	n := 0;
	assign(arch, 'vector.txt');
	reset(arch);
	while not eoln(arch) do
	begin
		n := n + 1;
		read(arch, v[n]);
	end;
	close(arch);
END;

FUNCTION VerificarAscendente(v:vector; n:byte):boolean;
var 
	i:byte;
BEGIN
	i:= 1;
	while ((i <= n) and (v[i] < v[i+1])) do
		i:= i + 1;
	VerificarAscendente := (i = n);
END;

BEGIN
	LeerArchivo(v,n);
	if VerificarAscendente(v,n) then
		writeln('El vector esta ordenado.')
	else
		writeln('El vector no esta ordenado.');
END.
