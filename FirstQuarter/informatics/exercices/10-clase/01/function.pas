program func;

	uses crt;

var 
		contador, contadorVerdad, numeroUno, numeroDos: integer;
        arch: text;
		porcentaje: real;
		
function par(mayor:integer;menor:integer):boolean;
begin
	if ( (mayor mod menor) = 0 ) then
		par := true
	else
		par := false;
end;


BEGIN
	clrscr;
	assign(arch, 'pares.txt');
    reset(arch);
    contador := 0;
    contadorVerdad := 0;
    while not eof(arch) do
        begin
			contador := contador + 1;
            readln(arch, numeroUno, numeroDos);
			if numeroUno > numeroDos then
				begin
					if	(par(numeroUno,numeroDos) = true) then
						contadorVerdad := contadorVerdad + 1;
				end
			else 
				begin
					if	(par(numeroDos,numeroUno) = true) then
						contadorVerdad := contadorVerdad + 1;
				end;
        end;
    close(arch);
    porcentaje := contadorVerdad / contador * 100;
    writeln('El porcentaje de de los pares que se cumplen es: ',porcentaje:2:2,'%');
END.
