program tp2;

    uses crt;

    const
        // Valor de la tecla escape en la tabla ASCII
        escape = 27;

procedure MostrarMensaje(texto: string);
	var i:char;
begin
	clrscr;
    writeln(texto);
	writeln('Precione una tecla para continuar...');
	i := readkey;
end;

procedure Menu();
    
    var
        boton: char; 
    
    begin
        repeat
            clrscr;
            writeln('Menu:');
            writeln('1 - Ejercicio 1');
            writeln('2 - Ejercicio 2');
            writeln('3 - Ejercicio 3');
            writeln('4 - Ejercicio 4');
            writeln('5 - Ejercicio 5');
            writeln('6 - Ejercicio 6');
            writeln('7 - Ejercicio 7');
            writeln('8 - Ejercicio 8');
            writeln('9 - Ejercicio 9');
            writeln('a - Ejercicio 10');
            writeln('ESC - Salir ');
            boton := readkey;
            case boton of
                '1':
                    begin
                        MostrarMensaje(boton);
                    end;
                '2':
                    begin
                        MostrarMensaje(boton);
                    end;
                '3':
                    begin
                        MostrarMensaje(boton);
                    end;
                '4':
                    begin
                        MostrarMensaje(boton);
                    end;
                '5':
                    begin
                        MostrarMensaje(boton);
                    end;
                '6':
                    begin
                        MostrarMensaje(boton);
                    end;
                '7':
                    begin
                        MostrarMensaje(boton);
                    end;
                '8':
                    begin
                        MostrarMensaje(boton);
                    end;
                '9':
                    begin
                        MostrarMensaje(boton);
                    end;
                'a':
                    begin
                        MostrarMensaje(boton);
                    end;
                char(escape):
                    begin
                        clrscr;
                        writeln('Hasta Luego!');					
                    end;
            else
                begin
                    clrscr;
                    writeln('Opcion Invalida');
                    writeln('Precione una tecla para continuar...');
                    boton := readkey;
                end;
            end;
        until (boton = char(escape));
    end;

BEGIN
    Menu();
END.
