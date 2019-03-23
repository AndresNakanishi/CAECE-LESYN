program parking;

    uses crt;

    const 
        commercial = 6;
        particular = 5;
    
    var
        // hours => Cantidad de horas de estadía
        hours: integer;
        // carType => Tipo de auto => su función es simplemente para comunicarle al usuario el tipo seleccionado
        // Esta variable no es necesaria para el funcionamiento correcto de la aplicación, pero mejora su usabilidad
        carType : string;
        // client => Tipo de Cliente || sel => Tipo de coche
        client, sel: char;
        // subtotal => Subtotal
        // discount => Descuento aplicado
        subtotal, discount: real;
BEGIN 
    clrscr;
    writeln('Cliente habitual? (S - N)');
    readln(client);
    clrscr;
    writeln('Tipo de coche: (C - P)');
    readln(sel);
    clrscr;
    writeln('Cantidad de horas de la estadia: ');
    readln(hours);
    clrscr;
    // 
    sel := UPCASE(sel);
    client := UPCASE(client);
    discount:= 0;
    // A partir del tipo de auto, se hace el cálculo
    case sel of
        'C':
            begin
                // Cálculo comercial
                carType:= 'Comercial';
                subtotal:= hours * commercial;
            end;
        'P':
            begin
                // Cálculo Particular
                carType:= 'Particular';
                subtotal:= hours * particular;
            end;
        else
            begin
                // No se calcula
                subtotal:= 0;
                carType:= 'Inválido';
            end;
    end;
    // Horas
    if ((hours <= 12) and (hours > 3)) then
        begin
            // Se calcula el descuento
            // Se podría tranquilamente utilizar el descuento cómo constante para "optimizar el código"
            // Pero creo funciona y nada, está perfecto así c:
            discount := subtotal * 0.05; 
        end
    else if (hours > 12) then 
        begin
            case sel of
                'C':
                    begin
                        subtotal:= 65;
                    end;
                'P':
                    begin
                        subtotal:= 35;
                    end;
            end;
        end;
    // Tipo de Cliente
    if (client = 'S') then
        begin
            // Si es cliente, se agrega el 10% (en este caso), y si hay un descuento anterior se agrega
            discount := discount + (subtotal * 0.10);
        end;
    writeln('Es cliente? ', client);
    writeln('Cantidad de Horas: ', hours);
    writeln('Tipo de auto: ', carType);
    writeln('Subtotal: ', subtotal:4:2);
    writeln('Descuento: ', discount:4:2);
    // Se substrae el descuento al subtotal (cálculo de horas x precio según el tipo de auto)
    writeln('Total: ', (subtotal - discount):4:2);
    readln();
END.
