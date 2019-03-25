Program Farmer;
    
    Uses
        crt;

    Const
        t = 38.00;
        s = 67.00;
        g = 56.00;

    Var
        // Sel = Selección
        sel: char;
        // Quantity => Cantidad
        // Humidity => Humedad
        // Res => Resultado (Subtotal) = Cantidad * Precio
        // Des => Descuento por Humedad
        quantity, humidity, res, des: real;

begin

    clrscr;
    writeln('Ingrese el tipo de cosecha: ');
    writeln('Posibles entradas T => Trigo, G => Girasol, S => Soja');
    readln(sel);
    sel:= UPCASE(sel);
    clrscr;
    writeln('Las toneladas de la cosecha: ');
    readln(quantity);
    clrscr;
    writeln('Ingrese el porcentaje de humedad: (1 - 100) ');
    readln(humidity);
    clrscr;
    case sel of
       'G': 
            begin
                res:= (g * quantity);
            end;
       'S': 
            begin
                res:= (s * quantity);
            end;
       'T': 
            begin
                res:= (t * quantity);
            end;
       else writeln('Entrada Incorrecta'); 
    end;

    if(humidity >= 10) then
        begin
            des:= (res * 0.08);
        end
    else
        begin
            des:= 0;
        end;
    writeln('Subtotal: $ ',res:5:2);
    writeln('Descuento por humedad: $', des:5:2);
    writeln('Total: $', (res-des):5:2);
    readln;
END.    
