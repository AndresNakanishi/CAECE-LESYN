program bugs;

    uses crt;

    var
        // sel => Selección
        sel :char;
        // selType => Tipo de Selección para informar
        selType :string;
        // res => subtotal || hec => hectáreas
        // desA => Primer descuento (Mayor a 100 hectáreas)
        // desB => Segundo descuento (Subtotal mayor a $1500)
        hec: integer;
        res, desA, desB :real;

BEGIN 
    clrscr;
    writeln('Elija el tipo de fumigacion que quiere realizar: (1 - 4)');
    readln(sel);
    clrscr;
    writeln('Ingrese la cantidad de hectareas que quiere fumigar:');
    readln(hec);
    clrscr;
    if((sel = '1') or (sel = '2')) then
        begin
            res := hec * 20;
            selType := sel;
        end
    else if(sel = '3') then
        begin
            res := hec * 30;
            selType := sel;
        end
    else if(sel = '4') then
        begin
            res := hec * 40;
            selType := sel;
        end
    else 
        begin
            res := 0;
            selType := 'invalida';
        end;
    // Primer descuento si pasa de 100 hectáreas
    if (hec > 100) then 
        begin
            desA := res * 0.05;
        end
    else
        begin
            desA := 0;
        end;
    // Segundo descuento si el subtotal pasa de 1500
    if (res > 1500) then
        begin
            desB := res * 0.10;
        end
    else 
        begin
            desB := 0;
        end;
    writeln('Seleccion: Tipo ', selType);
    writeln('Cantidad de hectareas: ', hec);
    writeln('Subtotal: $',res:5:2);
    writeln('Descuentos: $',(desA + desB):5:2);
    writeln('Total: ', (res - desA - desB):5:2);
    readln();
END.
