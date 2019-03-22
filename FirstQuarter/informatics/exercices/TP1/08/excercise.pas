program bank;

    uses crt;

    const
        million = 1000000;

    var
		// Credit => Crédito
		credit: string;
        // OLD => Antigüedad
        old: integer;
        // Value => Valor del inmueble || Salary => Salario
        value, salary: real;

BEGIN
    clrscr;
    writeln('Ingrese el valor de su inmueble: (En caso de no tener, ingresar 0)');
    readln(value);
    clrscr;
    writeln('Ingrese la antiguedad de su empleo:');
    readln(old);
    clrscr;
    writeln('Ingrese su salario: ');
    readln(salary);
    clrscr;
    if((value >= million) and (salary <= 1000)) then
        // Inmueble de mayor o igual a un millón y un salario menor o igual a 1000
        begin
            credit:= 'OTORGADO';
        end
    else if((value <= million) and (salary > 1500)) then
        // Inmueble menor o igual a un millón y salario mayor a 1500 
        begin
            credit:= 'OTORGADO';
        end
    else if((value = 0) and (salary > 1500) and (old > 5)) then
        // En este caso, no tiene inmueble, un salario de más de 1500 y una antiguedad de más de 5 
        begin
            credit:= 'OTORGADO';
        end
    else 
        begin
            credit:= 'DENEGADO';
        end;
    writeln('Salario de: $',salary:5:2);
    writeln('Antiguedad: ',old);
    writeln('Valor de su inmueble: $', value:5:2);
    writeln('Credito: ', credit);
    readln();
END.
