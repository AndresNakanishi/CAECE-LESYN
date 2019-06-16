program vector;

USES crt;

TYPE
	ret = array[1..100] of integer;

VAR
	k: ret;
	n: byte;

procedure generateArray(size:byte;var vector:ret);	
var i: byte;
begin
	for i:= 1 to size do
		if i mod 2 <> 0 then
			vector[i] := 2
		else
			vector[i] := 2;
end;

function sonTodosPares(vector:ret; n:byte):boolean;
var i: byte;
begin
	i := 1;
	while (i <= n) and ((vector[i] mod 2) = 0) do
		i := i + 1;
	sonTodosPares := (i > n);
end;


BEGIN
	n := 15;
	generateArray(n, k);
	if sonTodosPares(k,n) then
		writeln('Si')
	else
		writeln('No');
END.
