program super;

    uses crt;

    var 
        // amount => Monto de la compra
        // DiscountA => Primer descuento aplicado al cociente
        // DiscountB => Segundo descuento aplicado al módulo
        // DiscountC => Tercer descuento, aplica al subtotal - descuentos si el monto supera los 500
        // Quotient => Cociente
        // Remainder => Resto (Módulo)
        // Res => Total de la compra con Descuentos (Menos del descuento que aplica a los montos superiores a 500)
        amount, discountA, discountB, discountC, quotient, remainder, res: real;

BEGIN 
    clrscr;
    writeln('Ingrese el monto de la compra: ');
    readln(amount);
    clrscr;
    quotient := (TRUNC(amount) DIV 100);
    remainder := (TRUNC(amount) MOD 100);
    discountA := quotient * 3;
    discountB := 0;
    if (remainder <= 20) then
        begin
            discountB := 0.015 * remainder; 
        end
    else if ((remainder > 20) and (remainder <= 50)) then
        begin
            discountB := 0.02 * remainder;
        end
    else if ((remainder > 50) and (remainder < 100)) then
        begin
            discountB := 0.025 * remainder;
        end;
    res := amount - discountA - discountB;
    if (amount > 500) then
        begin
            discountC:= res * 0.01;
        end
    else 
        begin
            discountC:= 0;
        end;
    writeln('Subtotal: $', amount:5:2);
    writeln('Descuentos: $', (discountA + discountB + discountC):5:2);
    writeln('Total: $', (res - discountC):5:2);
    readln();
END.
