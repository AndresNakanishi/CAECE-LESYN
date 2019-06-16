program pdo;

uses crt;

TYPE VECTOR = array[1..100] of integer;
	
VAR
	pares, impares, nulos, n, mult: byte;
	a: VECTOR;

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

PROCEDURE numeros(a:VECTOR;n:byte;var par, impar, nulo:byte);
VAR k: byte;
BEGIN
par := 0; impar := 0; nulo := 0;
for k:= 1 to n do
BEGIN
	IF (a[k] <> 0) THEN
		BEGIN
			IF ((a[k] MOD 2) = 0) THEN
				par := par + 1
			ELSE
				impar := impar + 1;
		END
	ELSE
		nulo := nulo + 1;
END;
END;

PROCEDURE multiplos(a:VECTOR; n:byte; mult:byte);
VAR k: byte;
BEGIN
for k:= 1 to n do
begin
	if ( ((a[k] mod 2) = 0) and (a[k] <> 0)) then
		writeln('Multiplo del numero en posicion ',k,'(',a[k],'): ',(a[k] * mult));
end;
END;

PROCEDURE maximo(a:VECTOR; n:byte);
VAR k, lugar: byte; maximo:word; 
BEGIN
lugar := 1; maximo := a[lugar];
for k := 2 to n do
begin
	if a[k] > maximo then
	begin
		lugar := k;
		maximo := a[k]
	end;
end; 
writeln('El valor maximo encontrado es ',maximo,' y es encontrado en el lugar ',lugar);
END;

begin
	writeln('Ingresa un numero para multiplicar a los pares:');
	readln(mult);
	clrscr;
	LeerVector(a, n);
	numeros(a, n, pares, impares, nulos);
	writeln('Pares: ', pares);
	writeln('Impares: ', impares);
	writeln('Nulos: ', nulos);
	writeln('-----');
	multiplos(a,n, mult);
	writeln('-----');
	maximo(a,n);
end.
