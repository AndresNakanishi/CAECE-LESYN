program honolulu;

    uses crt;

    const
        vipDiscount = 0.15;
        equipmentCharge = 5;
        firstAmount = 30;
        secondAmount = 25;
        thirdAmount = 18;

    var 
        total : real;
        classes: integer;
        equipment, vip: char;

BEGIN 
    clrscr;
    writeln('Ingrese si tiene equipo: (S - N)');
    readln(equipment);
    equipment:= UPCASE(equipment);
    clrscr;
    writeln('Ingrese si es un cliente VIP: (S - N)');
    readln(vip);
    vip:= UPCASE(vip);
    clrscr;
    writeln('Ingrese la cantidad de clases: ');
    readln(classes);
    clrscr;
    if (classes <= 5) then
        begin
            total := classes * firstAmount;
        end
    else if ((classes > 5) and (classes <= 12)) then
        begin
            total := classes * secondAmount;
        end
    else 
        begin
            total := classes * thirdAmount;
        end;
    if (equipment = 'N') then
        begin
            total := total + (classes * equipmentCharge);
        end;
    if (vip = 'S') then
        begin
            total := total - (total * vipDiscount);
        end;
    
    writeln('El importe total es de: ', total:4:2);
    readln();
END.