program piecesM;

    uses crt;

    var
        // Pieces => Piezas totales
        // Fail1 => Piezas falladas de grado 1
        // Fail2 => Piezas falladas de grado 2
        // failT => Total de piezas falladas 
        pieces, fail1, fail2, failT: integer;
        // quality => Calidad de la producción
        quality: string;
        // totalPF => Porcentaje de fallas sobre el total producción
        // pFail1 => Porcentaje de fallas de grado 1 sobre el total de piezas falladas
        // pFail2 => Porcentaje de fallas de grado 2 sobre el total de piezas falladas
        totalPF, pFail1, pFail2: real;
BEGIN 
    clrscr;
    writeln('Ingrese la cantidad de piezas: ');
    readln(pieces);
    clrscr;
    writeln('Ingrese la cantidad de fallas de grado 1: ');
    readln(fail1);
    clrscr;
    writeln('Ingrese la cantidad de fallas de grado 2: ');
    readln(fail2);
    clrscr;
    // Calcular los fallos totales
    failT := fail1 + fail2;
    // Se calcula el Porcentaje de fallas sobre el total de la producción
    // Porcentaje total de fallas = Total de fallas * 100 / Total de las piezas
    totalPF := failT * 100 / pieces;
    // Se calcula el Porcentaje de fallas de grado 1 sobre el total de piezas falladas
    // Fallas de Grado 1 en función de las fallas totales = Total de fallas grado 1 * 100 / Total de fallas
    pFail1 := fail1 * 100 / failT;
    // Se calcula el Porcentaje de fallas de grado 2 sobre el total de piezas falladas
    // Fallas de Grado 2 en función de las fallas totales = Total de fallas grado 2 * 100 / Total de fallas
    pFail2 := fail2 * 100 / failT;

    if (totalPF < 10) then
        begin
            quality := 'Muy Buena';    
        end
    else if ((pFail1 < 20) and (totalPF > 10)) then
        begin
            quality := 'Buena';    
        end
    else if ((pFail1 = pFail2) and (totalPF > 10)) then
        begin
            quality := 'Regular';    
        end
    else
        begin
            quality := 'Mala';    
        end;

    writeln('Piezas totales: ', pieces);
    writeln('Porcentaje de fallas: ', totalPF:4:2,'%');
    writeln('Porcentaje de fallas de grado 1: ',pFail1:4:2,'%');
    writeln('Porcentaje de fallas de grado 2: ',pFail2:4:2,'%');
    writeln('Calidad de la produccion: ', quality);
    readln();
END.
