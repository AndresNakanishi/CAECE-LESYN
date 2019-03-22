program phonecalls;

    uses crt;

    const
        minLocalCalls = 100;
        minUrbanCalls = 20;
        minInterCalls = 5;

    var
        // Los tres tipos de llamadas + points => puntos
        // Categories => Cantidad de categorías acreditadas
        categories, points, localCalls, urbanCalls, interCalls: integer;

BEGIN 
    clrscr;
    writeln('Ingrese la cantidad de llamadas locales: ');
    readln(localCalls);
    clrscr;
    writeln('Ingrese la cantidad de llamadas interurbanas: ');
    readln(urbanCalls);
    clrscr;
    writeln('Ingrese la cantidad de llamadas internacionales: ');
    readln(interCalls);
    clrscr;
    points := 0;
    categories := 0;
    // Determina si tiene puntos por llamadas locales
    if (localCalls > minLocalCalls) then
        begin
            points:= points + 25;
            categories := categories + 1;
        end;
    // Determina si tiene puntos por llamadas interurbanas
    if (urbanCalls > minUrbanCalls) then
        begin
            points:= points + 15;
            categories := categories + 1;
        end;
    // Determina si tiene puntos por llamadas internacionales
    if (interCalls > mininterCalls) then
        begin
            points:= points + 3;
            categories := categories + 1;
        end;

    // Determina si tiene puntos adicionales por superar el doble del mínimo por llamadas locales
    if(localCalls > (minLocalCalls * 2)) then
        begin
            points:= points + 5;
        end;
    // Determina si tiene puntos adicionales por superar el doble del mínimo por llamadas interurbanas
    if(urbanCalls > (minUrbanCalls * 2)) then
        begin
            points:= points + 5;
        end;
    // Determina si tiene puntos adicionales por superar el doble del mínimo por llamadas internacionales
    if(interCalls > (minInterCalls * 2)) then
        begin
            points:= points + 5;
        end;
    // Si tiene las 3 categorías acreditadas se añaden 5 puntos.
    if(categories = 3) then
        begin
            points:= points + 5;
        end;
    writeln('Cantidad de llamadas locales: ', localCalls);
    writeln('Cantidad de llamadas interurbanas: ', urbanCalls);
    writeln('Cantidad de llamadas internacionales: ', interCalls);
    writeln('Cantidad de puntos: ', points);
    readln();
END.