program files;

    uses crt;

    var 
        num: integer;
        archivo: text;
    
BEGIN
    assign(archivo, 'file01.txt');
    reset(archivo);
    while not eof(archivo) do
        begin
            readln(archivo, num);
            write(num);
            if num mod 2 <> 0 then
                begin
                    writeln(' Impar');
                end
            else
                begin
                    writeln(' Par');
                end;
        end;
    close(archivo);
END.
