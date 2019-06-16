program super;

function dto(importe:real):real;
var
	dto1, aux, dto2: real;
begin
	// Descuento en Pesos por cada 100 pesos
	dto1 := round(importe) DIV 100 * 3;
	// Aux que ayuda a calcular el descuento 2
	aux := importe - (dto1 / 3 * 100);
	// Descuento en Pesos por el sobrante que no llegue a 100 pesos
	if (aux <= 20) then
		dto2 := aux * 0.015
	else if (aux <= 50) then
		dto2 := aux * 0.02
	else if (aux < 100) then
		dto2 := aux * 0.025;
	if importe > 500 then
		dto := (importe * 0.01) + dto1 + dto2
	else
		dto := dto1 + dto2;
end;

var
	arch: text;
	importe, descuento, descuentoTotal: real;
	n, i : word;

begin
assign(arch,'supermercado.txt');
reset(arch);
readln(arch, n);
descuentoTotal := 0;
for i:= 1 to n do
begin
	readln(arch, importe);
	descuento := dto(importe);
	// Sumamos descuentos
	descuentoTotal := descuentoTotal + descuento;
	writeln('Compra ',i,': Importe - ', importe:7:2, ' | Descuento - ',descuento:5:2,' | Importe final - ', (importe - descuento):7:2);
end;
writeln('----');
writeln('El descuento total es de: ', descuentoTotal:4:2);
close(arch);
end.
