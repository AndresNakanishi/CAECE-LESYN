program pdo;

uses crt;

TYPE VECTOR = array[1..100] of integer;
	
VAR
	n, mas, menos: byte;
	V, Vpos, Vneg: VECTOR;

procedure LeerVector(var a:VECTOR;var n:byte);
Var
	arch: text;
Begin
Assign(arch, 'vector.txt');
Reset(arch); n:=0;
While Not EOLN(arch) do
Begin
	n:= n + 1;
	Read(arch, a[n]);
End;
Close(arch);
End;

procedure EscribirVector(var a:VECTOR;var n:byte);
var k:byte;
BEGIN
	write('[');
	for k:= 1 to n do
	begin
		if k <> n then
			write(a[k],',')
		else
			writeln(a[k],']');
	end;
END;

PROCEDURE PositivosNegativos(a: VECTOR; n:byte; var Vpos,Vneg:VECTOR; var mas,menos:byte);
var k:byte;
BEGIN
	mas:= 0; menos := 0;
	for k:= 1 to n do
	if	a[k] > 0 then 
		begin
			mas := mas + 1;
			Vpos[mas] := a[k];
		end
		else
		begin
			menos := menos + 1;
			Vneg[menos] := a[k];
		end;
END;

PROCEDURE MostrarElNumeroso(Vpos,Vneg: VECTOR; mas,menos:byte);
BEGIN
	if mas <> menos then
		begin
			if	mas > menos then
				write('El arreglo mas grande es el positivo con ',mas,' elementos: ');EscribirVector(Vpos,mas)
			else
				write('El arreglo mas grande es el negativo con ',menos,' elementos: ');EscribirVector(Vneg,menos);
		end
	else
		begin
		gotoxy(1,1);writeln('Ambos elementos tienen ',mas,' elementos.');
		gotoxy(1,3);write('Vector positivo: ');EscribirVector(Vpos,mas);
		gotoxy(1,5);write('Vector negativo: ');EscribirVector(Vneg,menos);
		end;
END;

begin
	LeerVector(V, n);
	PositivosNegativos(V,n,Vpos,Vneg,mas,menos);
	MostrarElNumeroso(Vpos,Vneg,mas,menos);
end.

