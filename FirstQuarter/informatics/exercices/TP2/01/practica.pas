program mochila;

    uses crt;

    var 
        vector: array of integer;
        num: integer;
        arch:text;

procedure leerArchivo(fileName:string);
    var 
		i:integer;
		vector: array of integer;
begin
    i := 0;
    assign(arch,fileName);
    reset(arch);
        repeat
            read(arch, num);
            vector[i] := num;
            i := i + 1;
        until (eof(arch));
    close(arch);
end;
    
BEGIN
    leerArchivo('archivo01.txt');
    readln();
END.
