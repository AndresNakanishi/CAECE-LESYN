program seven;

    uses crt;

    var 
        sel : char;
        a, b, num, acu, count: real;

BEGIN 
    acu := 0;
    count := 0;
    clrscr;
    writeln('Ingrese el valor inicial del rango: ');
    readln(a);
    writeln('Ingrese el valor final del rango: ');
    readln(b);
    clrscr;
    writeln('Ingrese un número: ');
    readln(num);
    writeln('Quiere ingresar otro número: (S - N)');
    readln(sel);
    sel := UPCASE(sel);
    while (sel = 'S') do
        begin
            if ((num >= a) and (num <= b)) then
                begin
                    count := count + 1;
                    acu := acu + num;
                end;
            clrscr;
            writeln('Ingrese un numero: ');
            readln(num);
            writeln('Quiere ingresar otro numero: (S - N)');
            readln(sel);
            sel := UPCASE(sel);
        end;
    writeln('El promedio de los numeros dentro del rango es: ', (acu/count):0:2);
END.
