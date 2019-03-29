program pas;

    uses crt;

    var 
        i: integer;

begin
    clrscr;
    for i := 0 to 255 do
        begin
            write(i, ' = ', char(i),' --- ');
        end;
    readln();
end.
