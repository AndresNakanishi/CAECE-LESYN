program office;

    uses crt;

    var 
        // N, S, O, E
        windDirection: char;
        // Temperatura, humedad, velocidad del viento (wind) y sensación térmica 
        temp, hum, wind, st: real;
        // Agregado a substraer
        stMin: integer;

BEGIN 
    clrscr;
    writeln('Ingrese la temperatura actual: ');
    readln(temp);
    clrscr;
    writeln('Ingrese la humedad actual: (0-100) ');
    readln(hum);
    clrscr;
    writeln('Ingrese la velocidad del viento: ');
    readln(wind);
    clrscr;
    writeln('Ingrese la direccion del viento: (N-O-S-E) ');
    readln(windDirection);
    clrscr;
    stMin:= 0;
    st:= temp;
    if((wind < 10) and (wind <> 0)) then
        begin
            if (hum > 50) then
                begin
                    stMin := stMin + 1;
                end;
        end
    else if(wind >= 10) then
        begin
            if (hum > 50) then
                begin
                    stMin := stMin + 1;
                end;
            if ((windDirection = 'S') or (windDirection = 'O')) then
                begin
                    stMin := stMin + 3;
                end
            else if ((windDirection = 'N') or (windDirection = 'E')) then
                begin
                    stMin := stMin + 1;
                end;
        end;

    if (wind <> 0) then
        // En caso de que el viento no incida, no hay variación en la sensación térmica
        // en función a la temperatura || temperatura = sensación térmica cuando la velocidad del viento = 0
        // Y la humedad no incide no afecta a la sensación térmica tampoco
        begin
            st:= st - stMin;
        end;
    writeln('Temperatura: ', temp:5:2);
    writeln('Direccion del Viento: ', windDirection);
    writeln('Velocidad del Viento: ', wind:5:2);
    writeln('Humedad: ',hum:5:2);
    writeln('Sensacion Termica: ',st:5:2);
    readln();
END. 