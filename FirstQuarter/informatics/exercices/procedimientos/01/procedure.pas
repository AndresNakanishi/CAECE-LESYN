program llamadas;

function puntos(ll,li,le:word):word;
begin
	ll := (ll div 100)*25;
	li := (li div 20)*15;
	le := (le div 5)*3;
	if ll >= 200 then
		ll := ll + 5;
	if li >= 40 then
		li := li + 5;
	if le >= 10 then
		le := le + 5;
	if (ll <> 0) and (ll <> 0) and (ll <> 0) then
		puntos := ll + le + li + 5
	else
		puntos := ll + le + li;
end;

var
	arch: text;
	cod, codMax: string[3];
	max, ll, li, le, tp: word;

BEGIN
assign(arch, 'llamadas.txt');
reset(arch);
max := 0;
while not eof(arch) do
begin
	readln(arch, cod, ll, li, le);
	tp := puntos(ll, li, le);
	writeln(cod, ' ', tp:4);
	if tp > max then
	begin
		max:= tp; codMax := cod;
	end;
end;
if max <> 0 then
	writeln(codMax, ' es el usuario que tuvo mas puntos.')
else
	writeln('Nadie tuvo más puntos.');
close(arch);
END.
