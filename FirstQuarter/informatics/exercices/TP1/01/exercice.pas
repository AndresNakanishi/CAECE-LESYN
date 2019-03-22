Program SaltoHipico;
    
    Uses
        crt;

    Var
        // H => Height (Altura)
        // D => Distance (Distancia)
        h,d: real;

begin

    clrscr;
    writeln('Ingrese la altura del salto: ');
    readln(h);
    clrscr;
    writeln('Ingrese la distancia del salto: ');
    readln(d);
    clrscr;
    if((d > 2.5) AND (h > 2.5)) then
        // El caso donde tanto la distancia como la altura superan los 2.5m
        begin
            clrscr;
            writeln('Salto Bueno');
        end
    else if((d > 2.5) or (h > 2.5)) then
        // El caso donde la distancia o la altura superan los 2.5m
        begin
        clrscr;
        writeln('Salto Normal');
        end
    else
        // El caso donde ni la distancia o la altura superan los 2.5m
        begin
        clrscr;
        writeln('Salto Malo');
        end;
    writeln('El salto fue de ',h:4:2,' metros y la distancia de ',d:4:2,' metros');
    readln;
END.    