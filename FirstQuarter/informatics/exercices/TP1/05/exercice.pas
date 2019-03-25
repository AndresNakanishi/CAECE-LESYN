program cajas;

    uses crt;

    const
        // Constantes del Valor definido en el enunciado para cada tipo de caja
        big = 5.00;
        medium = 3.00;
        small = 2.50;

    var
        // Tipo de Caja (typeof)
        typeof: string;
        // Peso, Tamaño y Resultado 
        // Comentario sobre res: Solo es para aumentar la legibilidad del código
        weight, size, res: real;

BEGIN
    clrscr;
    writeln('Ingrese el peso en KG: ');
    readln(weight);
    clrscr;
    writeln('Ingrese el tamanio de la caja en CM: ');
    readln(size);
    clrscr;
    if((weight < 5) and (size < 50)) then
        // Caja pequeña, con un peso menor a 5Kg y una longitud menor a 50cm.
        begin
            typeof:= 'Chica';
            res:= small * weight;
        end
    else if((weight > 10) and (size > 90)) then
        // Caja grande, con un peso mayor a 10Kg y una longitud superior a 90cm.
        begin
            typeof:= 'Grande';
            res:= big * weight;
        end
    else if((weight >= 5) and (weight <= 10)) then
        // Caja mediana, con un peso mayor a 5Kg hasta 10kg inclusive y su longitud no importa.
        // Problema del cliente: Olvido de definir qué pasa con la longitud de las cajas en clasificación "mediana"
        begin
            typeof:= 'Mediana';
            res:= medium * weight;
        end
    else 
        // Todo lo que escape a las especificaciones del cliente,
        // se incluirá en esta sección hasta la proxima revisión/reunión con el cliente
        // donde NO se clasificará la caja ingresada
        begin
            typeof:= 'No clasifica.';
            res:= 0;
        end;
    writeln('Tipo de Caja: ',typeof);
    writeln('Precio Total: $',res:5:2);
    readln();
END.
