program parcial;

var
	archivo: text;
	medicos, i, obraSocial, contadorParticulares, cantidadDePacientes: byte;
	recargo, mayorMonto, montoPorMedico, promedio: real;
	car, turno: char;
	matricula, medicoQueMasCobro : string[5];
	
function importeConsulta(obraSocial:byte;turno:char;recargo:real):real;
var rec, valor: real;
begin
case obraSocial of
	1:valor := 0;
	2:valor := 350;
	3:valor := 200;
	4:valor := 800;
end;
if turno = 'N' then
begin
	rec := valor * recargo;
	if	rec > 50 then
		importeConsulta := valor + rec
	else
		importeConsulta := valor + 50;
end
else
	importeConsulta := valor;
end;

begin
assign(archivo, 'parcial.txt');
reset(archivo);
readln(archivo,medicos);
readln(archivo,recargo);
recargo := recargo / 100;
contadorParticulares := 0;
mayorMonto := 0;
for i:= 1 to medicos do
begin
	montoPorMedico := 0;
	cantidadDePacientes := 0;
	read(archivo, matricula);
	writeln(matricula);
	read(archivo, obraSocial, car, turno);
	while (obraSocial <> 0) do
	begin
		writeln(obraSocial, turno);
		read(archivo, obraSocial, car, turno);
	end;
	writeln('----');
end;
close(archivo);
end.
