PROGRAM DOS;

TYPE 
	st10 = string[10];
	TV = array[1..100] of st10;
	TM = array[1..100,1..100] of word;

VAR
	nombres, rtaA: TV;
	kms: TM;
	n, m, k: byte;
	meta: word;

PROCEDURE leerArchivo(var nombres:TV; var kms:TM;var meta:word;var n,m:byte);
VAR
	i: byte;
	arch: text;
BEGIN
n := 0;m := 7;
assign(arch,'dos.txt');reset(arch);
readln(arch, meta);
while not eof(arch) do
begin
	n := n + 1;
	read(arch,nombres[n]);
	for i:= 1 to m do
	begin
		if i <> m then
			read(arch,kms[n,i])
		else
			readln(arch,kms[n,i]);
	end;
end;
close(arch);
END;

FUNCTION supero(kms: TM; n,m:byte;meta: word):byte;
VAR
	i :byte;
BEGIN
supero := 0;
for i:= 1 to m do
	if kms[n,i] >= meta then
		supero := 1;
END;

PROCEDURE resolverA(nombres: TV; kms: TM; n,m:byte;meta :word; var rtaA:TV;var k:byte);
var
	i: byte;
BEGIN
k := 0;
for i:= 1 to n do
begin
	if (supero(kms, i, m, meta) = 1) then
	begin
		k := k + 1;
		rtaA[k] := nombres[i];
	end
end;
writeln('Respuesta A: ');
for i:= 1 to k do
	writeln(rtaA[i]);
END;

PROCEDURE resolverB(nombres: TV; kms: TM; n,m:byte; meta: word);
VAR 
	i,j: byte;
	promedio, promMax: real;
	acum, noMetaCont, noMetaContMax: word;
	nombreMax: st10;
BEGIN
promMax := 0; noMetaContMax := 0;
for i:= 1 to n do
begin
	acum := 0; noMetaCont := 0;
	for j:= 1 to m do
	begin
		acum := acum + kms[i,j];
		if kms[i,j] >= meta then
			noMetaCont := noMetaCont + 1;
	end;
	promedio := acum / 7;
	if promedio > promMax then
	begin
		promMax := promedio;
		nombreMax := nombres[i];
		noMetaContMax := noMetaCont;
	end;
end;
writeln('Respuesta B:');
writeln(noMetaContMax, ' dias (',nombreMax,')');
END;

BEGIN
	leerArchivo(nombres, kms, meta, n, m);
	resolverA(nombres, kms, n, m, meta, rtaA, k);
	resolverB(nombres, kms, n, m, meta);
END.
