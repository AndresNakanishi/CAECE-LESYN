program six;

    uses crt;

    var 
        num, count: integer;
        even, odd: real;

BEGIN
    count := 0;
    odd := 0;
    even := 0;
    clrscr;
    writeln('Ingrese un numero: ');
    readln(num);
    while (num <> 0) do
        begin
			clrscr;
            count := count + 1;
            if ((num mod 2) <> 0) then
                begin
                    odd:= odd + 1; 
                end
            else
                begin
                    even:= even + 1;
                end;
            writeln('Ingrese un numero: ');
            readln(num);
        end;
    writeln('El porcentaje de pares es: ', ((even/count)*100):4:2,'%');
    writeln('El porcentaje de impares es: ', ((odd/count)*100):4:2,'%');
    readln;
END.
