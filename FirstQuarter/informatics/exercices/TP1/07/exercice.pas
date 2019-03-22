program parcials;

    uses crt;

    var
        // prom => Promedio
        // fParcial => Primer Parcial
        // sParcial => Segundo Parcial
        prom, fParcial, sParcial: real;

BEGIN
    clrscr;
    writeln('Ingrese la nota del primer parcial');
    readln(fParcial);
    clrscr;
    writeln('Ingrese la nota del segundo parcial');
    readln(sParcial);
    clrscr;
    prom:= fParcial + sParcial;
    if ((prom >= 14) and (sParcial > 6)) then
        // Promueve el alumno al tener un promedio mayor o igual a 14 y su segundo parcial con una nota mayor a 6
        begin
            writeln('El alumno PROMUEVE.');
        end
    else if(prom >= 10) then
        // El alumno está Habilitado para rendir finales, ya que la suma de ambos parciales es igual o mayor a 10
        begin
            writeln('El alumno esta HABILITADO.');
        end
    else
        // Si no se cumplen cualquiera de las dos condiciones, será desaprobado.
        begin
            writeln('El alumno esta DESAPROBADO.');
        end;
    readln();
END.
