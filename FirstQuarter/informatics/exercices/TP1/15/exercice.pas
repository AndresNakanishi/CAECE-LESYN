program medicine;

    uses crt;

    var 
        // success => Cantidad de Pacientes que mejoraron
        // neutral => Cantidad de Pacientes que no mejoraron
        // failures => Cantidad de Pacientes que empeoraron
        success, neutral, failures: integer;
        // Porcentaje 
        percentage :real;
        // qualification => Resultado del Experimento
        qualification :string;
BEGIN 
    clrscr;
    writeln('Ingrese la cantidad de pacientes que mejoraron: ');
    readln(success);
    clrscr;
    writeln('Ingrese la cantidad de pacientes que no mejoraron: ');
    readln(neutral);
    clrscr;
    writeln('Ingrese la cantidad de pacientes que empeoraron: ');
    readln(failures);
    clrscr;
    // Indicar el resultado del experimento
    if ( (success > (neutral + failures))  and (neutral > failures)) then
        begin
            qualification := 'Exitosa';
        end
    else if (success > (neutral + failures)) then
        begin
            qualification := 'Neutra';
        end
    else 
        begin
            qualification := 'Fracasada';
        end;
    // Calcular el porcentaje de positivos sobre los no negativos
    // Teniendo en cuenta que Positivos => success | no negativos => neutral | negativos => failures
    if (success <> 0) then
        begin
            percentage := success * 100 / neutral;
        end
    else
        begin
            percentage := 0;
        end;
    
    writeln('Resultado de la prueba: ', qualification);
    writeln('Porcentaje de positivos sobre los no negativos: ', percentage:4:2,'%');
    readln();
END.
