program university;

    uses crt;

    var
        // Día de la inscripción
        // Cantidad de Materias => subjects
        day, subjects: integer;
        // Precio por Materia => pricePerSubject
        // Descuento por más de 3 materias => discount
        // Descuento por inscripción sobre el TOTAL => inscriptionP
        // Sobrecargo por inscripción sobre el TOTAL => charge
        // Resultado => Subtotal
        pricePerSubject, discount, inscriptionP, charge, res: real;

BEGIN
    clrscr;
    writeln('Ingrese el dia de inscripcion: 01 - 31');
    readln(day);
    clrscr;
    writeln('Ingrese el descuento por mas de 3 materias: (1 - 100) ');
    readln(discount);
    clrscr;
    writeln('Ingrese el valor por materia: ');
    readln(pricePerSubject);
    clrscr;
    writeln('Ingrese la cantidad de materias: ');
    readln(subjects);
    clrscr;
    // Calculo el subtotal
    res:= pricePerSubject * subjects;
    // Asumiendo que el usuario ingreso un entero del 1 - 100, se corre la coma para facilitar la operatoria
    discount:= discount / 100;

    if(day <= 5) then
        // Según el día de inscripción
        begin
            inscriptionP:= res * 0.05;
        end
    else if(day >= 25) then
        begin
            charge:= res * 0.12;
        end
    else 
        begin
            inscriptionP:= 0.00;
        end;
    if (subjects > 3) then
        begin
            discount:= (subjects - 3) * pricePerSubject * discount;
        end;
    writeln('Cantidad de Materias: ',subjects);
    writeln('Precio por Materia: ',pricePerSubject:5:2);
    writeln('Subtotal: ', res:5:2);
    writeln('Descuento:', (inscriptionP + discount):5:2);
    writeln('Recargo:', charge:5:2);
    writeln('Total: ', (res + charge - (inscriptionP + discount)):5:2);
END.