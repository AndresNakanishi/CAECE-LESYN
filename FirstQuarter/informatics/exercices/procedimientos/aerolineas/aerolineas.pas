program aerolineas;

procedure sobrepesoCosto(categoria:char;peso:byte;var sobrepeso,costo:word);
begin
	if ((categoria = 'A') and (peso > 40)) then
		sobrepeso := peso - 40
	else if ((categoria = 'B') and (peso > 30)) then
		sobrepeso := peso - 30
	else if ((categoria = 'C') and (peso > 23)) then
		sobrepeso := peso - 23
	else
		sobrepeso := 0;
	case categoria of
		'A': costo := sobrepeso * 1;
		'B': costo := sobrepeso * 3;
		'C': costo := sobrepeso * 8;
	end;
end;

var
	arch: text;
	categoria: char;
	vuelo, maxVuelo: string[3];
	peso: byte;
	sobrepeso, costo, i, n, totalA, totalB, totalC, max, costoTotaldelVuelo: word;

begin
assign(arch,'aerolineas.txt');
reset(arch);
max := 0;
while not eof(arch) do
begin
	totalA := 0; totalB := 0; totalC := 0; costoTotaldelVuelo := 0;
	readln(arch, vuelo, n);
	writeln(vuelo, n);
	for i:= 1 to n do
	begin
		readln(arch, categoria, peso);
		sobrepesoCosto(categoria, peso, sobrepeso, costo);
		case categoria of			
			'A': totalA := totalA + sobrepeso;
			'B': totalB := totalB + sobrepeso;
			'C': totalC := totalC + sobrepeso;
		end;
		costoTotaldelVuelo := costoTotaldelVuelo + costo; 
		writeln('Pasajero ',i,': tiene se excedio en ', sobrepeso,' kilos y su importe aumentara en ', costo, ' pesos.');
	end;
	writeln('A: ', totalA, ' de sobrepeso');
	writeln('B: ', totalB, ' de sobrepeso');
	writeln('C: ', totalC, ' de sobrepeso');
	if	costoTotaldelVuelo > max then
	begin
		max := costoTotaldelVuelo; maxVuelo := vuelo;
	end;
	writeln('----');
end;
writeln(maxVuelo, ' fue el vuelo de mayor importe por sobrepeso.');
close(arch);
end.
