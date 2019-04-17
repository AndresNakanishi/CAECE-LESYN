program eva;

    uses crt;

    var
        // I = Contador, Cobradores = Cantidad de Cobradores
        i, cobradores: byte;
        // Objetivo = Objetivo a recaudar
        // monto = Cobro individual
        // TotalRecaudado = Suma de lo recaudado (Acumulador)
        // TotalCheque = Suma de lo recaudado en medio de pago Cheque (Acumulador)
        // TotalCobrador = Suma de lo recaudado por el cobrador
        // MayorDiferencia = Diferencia más grande de siempre y cuando sea mayor a 0
        objetivo, monto, totalRecaudado, totalCheque, totalCobrador, mayorDiferencia: word;
        // Nombre del Cobrador, Nombre del Cobrador que menos recaudó
        nombre, menorRecaudacion: string;
        // Variable Selección donde elegimos el método de pago o si es el fin de la misma
        sel: char;
BEGIN 
    clrscr;
    writeln('Ingrese la cantidad de cobradores: ');
    readln(cobradores);
    clrscr;
    // Se inicializa el acumulador
    totalRecaudado := 0; 
    totalCheque := 0;
    mayorDiferencia := 0;
    // --------------
    // Inicia el primer ciclo
    for i := 1 to cobradores do
        begin
            writeln('Ingrese el nombre del Cobrador: ');
            readln(nombre);
            writeln('Ingrese el objetivo a recaudar por ', nombre ,': ');
            readln(objetivo);
            writeln('----');
            // Inicializamos la variable de recaudación total por cobrador
            totalCobrador := 0;
            // Ciclo anidado que se repite siempre y cuando el método de pago no sea F (Que sería la condición de corte)
            repeat
                writeln('Ingrese el Medio de Pago: (C = Cheque | E = Efectivo | F = Fin)');
                sel := readkey;
                sel := UPCASE(sel);
                // Inicializamos la variable en caso de que queden valores residuales
                monto := 0;     
                // Solo pido datos si no estoy en la condición F           
                if (sel <> 'F') then
                    begin
                        Writeln('Ingresa el monto: ');
                        readln(monto);
                    end;
                if (sel = 'C') then
                    totalCheque := totalCheque + monto;
                // Se acumulan los montos cobrados sin importar el tipo de medio de pago
                if (sel <> 'F') then
                    totalCobrador := totalCobrador + monto;    
            until (sel = 'F');
            // Estructura condicional para ver la diferencia del total del cobrador con el objetivo
            if (((objetivo - totalCobrador) > 0) and ((objetivo - totalCobrador) > mayorDiferencia)) then
                begin
                    mayorDiferencia := (objetivo - totalCobrador);
                    menorRecaudacion := nombre;
                end;
            writeln('Cobrador: ',nombre);
            writeln('Recaudado por ', nombre, ': $',totalCobrador);
            writeln();
            writeln('----');
            writeln();
            // Se acumula el total recaudado
            totalRecaudado := totalRecaudado + totalCobrador;
        end;
    // Termina el primer ciclo    
    writeln('El cobrado que menos recaudo fue: ', menorRecaudacion);
    writeln('Porcentaje de la recaudacion en Cheques: ',((totalCheque/totalRecaudado)*100):0:2,'%');
END.
