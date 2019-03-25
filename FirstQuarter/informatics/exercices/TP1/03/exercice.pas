Program peso;
    
    uses crt;

    var
        // Category => Categoría
        // Size => Talla
        category, size: string;
        // Weight => Peso
        weight: real;

BEGIN
    clrscr;
    writeln('Ingrese su peso en Kilos: ');
    readln(weight);
    clrscr;
    if(weight < 40) then
        // Caso donde la persona pesa menos de 40 Kilos
        begin
            category:= 'Persona Delgada';
            size:= 'Talle 1';
        end
    else if((weight >= 40) and (weight < 60)) then
        // Caso donde la persona pesa entre de 40 Kilos y menos de 60 Kilos
        begin
            category:= 'Persona de peso Normal';
            // Volvemos a usar un solo condicional para verificar el talle de la persona.
            if (weight <= 50) then
                begin
                    size:= 'Talle 1';
                end
            else
                begin
                    size:= 'Talle 2';
                end;
        end
    else if((weight >= 60) and (weight < 80)) then
        // Caso donde la persona pesa entre de 60 Kilos y menos de 80 Kilos
        begin
            category:= 'Persona con Sobrepeso';
            size:= 'Talle 2';
        end
    else
        begin
            category:= 'Persona Obesa';
            size:= 'Talle 3';
        end;
    writeln(category,' de ',size);
    readln();
END.
