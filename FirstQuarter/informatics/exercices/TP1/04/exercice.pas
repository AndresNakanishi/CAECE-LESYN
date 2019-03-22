Program precio;
    
    uses crt;

    var
        // Quantity => Cantidad
        quantity: integer;
        // Price => Precio
        // Res => Resultado (Subtotal)
        // Des => Descuento (Descuento)
        price, res, des: real;

BEGIN
    clrscr;
    writeln('Ingrese el precio unitario: ');
    readln(price);
    clrscr;
    writeln('Ingrese la cantidad de articulos vendidos: ');
    readln(quantity);
    clrscr;
    // Calculo del Subtotal
    res:= price * quantity;
    if(quantity < 100) then
        // Caso donde se compraron menos de 100 unidades
        begin
            des:= 0;
        end
    else if((quantity >= 100) and (quantity < 500)) then
        // Caso donde se compraron 100 o más unidades y menos de 500
        begin
            des:= res * 0.05;
        end
    else if((quantity >= 500) and (quantity < 2000)) then
        // Caso donde se compraron 500 o más unidades y menos de 2.000
        begin
            des:= res * 0.07;
        end
    else if((quantity >= 2000) and (quantity < 10000)) then
        // Caso donde se compraron 2.000 o más unidades y menos de 10.000
        begin
            des:= res * 0.10;
        end
    else
        // Caso donde se compraron más unidades de 10.000
        begin
            des:= res * 0.15;
        end;
    // Solo para recordar lo ingresado
    writeln('Precio Unitario: $', price:5:2);
    writeln('Cantidad: ', quantity);
    // Mostrar toda la data
    writeln('Subtotal: $', res:5:2);
    writeln('Descuento: $', des:5:2);
    writeln('Total: $', (res-des):5:2);
    readln();
END.
