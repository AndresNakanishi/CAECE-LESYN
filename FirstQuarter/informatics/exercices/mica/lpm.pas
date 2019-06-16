Program vuelos;

Var
uno:string;
i:byte;
begin
	for i:= 1 to 10 do
		begin
			uno := concat(uno,' Hola ');
		end;
	writeln(uno);
End.
