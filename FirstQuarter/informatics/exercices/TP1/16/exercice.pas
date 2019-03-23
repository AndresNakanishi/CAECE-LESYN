program transport;

    uses crt;

    const 
        // Valores por categoría
        common = 2;
        special = 2.5;
        aerial = 3;
        // Sobrecargos por peso
            // Si sobrepasa los 15KG
            charge3 = 0.30;
            // Si sobrepasa entre más de 10KG y hasta 15KG
            charge2 = 0.20;
            // Si sobrepasa entre más de 5KG y hasta 10KG
            charge1 = 0.10;
    var 
        // Weight => Peso | Subtotal => Monto a pagar | addCharge => Sobrecargo por peso
        weight, subtotal, addCharge: real;
        // category => Categoría
        category :char;
        // Variable adicional, solo funcional a la usabilidad del programa
        selCategory :string;
BEGIN
    clrscr;
    writeln('Ingrese el peso del paquete: ');
    readln(weight);
    clrscr;
    writeln('Ingrese el metodo de envio: ');
    writeln('1 - Comun ');
    writeln('2 - Especial ');
    writeln('3 - Aereo ');
    readln(category);
    clrscr;
    // Se calcula el precio sin sobrecargos
    case category of
        '1': 
            begin
                selCategory := 'Comun';
                subtotal := weight * common;
            end;
        '2':
            begin
                selCategory := 'Especial';
                subtotal := weight * special;
            end;
        '3':
            begin
                selCategory := 'Aerea';
                subtotal := weight * aerial;
            end;
        else
            begin
                selCategory := 'Invalida';
                subtotal := 0;
            end;
    end;
    // Se calcula si hay sobrecargos
    if (weight < 5) then
        begin
            addCharge:= 0;
        end
    else if((weight >= 5) and (weight < 10)) then
        begin
            addCharge:= subtotal * charge1;
        end
    else if((weight >= 10) and (weight < 15)) then
        begin
            addCharge:= subtotal * charge2;
        end
    else
        begin
            addCharge:= subtotal * charge3;
        end;
    writeln('Peso de la carga: ', weight:4:2);
    writeln('Metodo de Envio: ', selCategory);
    writeln('Subtotal: $', subtotal:5:2);
    writeln('Recardo por peso: $', addCharge:5:2);
    writeln('Total: $', (subtotal + addCharge):5:2);
    readln();
END.
