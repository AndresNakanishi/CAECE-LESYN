program func;

	uses crt;

	var 

		alumno, mejorAlumno: string[10];
		nota, n, i, aprobados, desaprobadosPorTP, tpDesaprobados, totalAlumnos, notaTotal : byte;
		promedio, mejorPromedio : real;
		arch: text;
		nombres: string;

BEGIN
	clrscr;
	assign(arch, 'prueba.txt');
    reset(arch);
	readln(arch, n);
	aprobados := 0;
	desaprobadosPorTP := 0;
	totalAlumnos := 0;
	mejorPromedio := 0;
    while not eof(arch) do
        begin
			notaTotal := 0;
			tpDesaprobados := 0;
			read(arch, alumno);
			nombres := nombres + alumno;
			// Leer archivo nota a nota
			for i:= 1 to n do
				begin
					if i <> n then
						begin
							read(arch,nota);
						end
					else 
						begin
							readln(arch,nota);
						end;
					// Si la nota es menor a 4 se considera que el trabajo práctico está desaprobado
					if nota < 4 then
						tpDesaprobados := tpDesaprobados + 1;
					// Se añade a la nota total para calcular el promedio
					notaTotal := notaTotal + nota;
				end;

			// Calculo el promedio
			promedio := notaTotal / n;

			// Evaluamos si está aprobado || Caso A

			if ((promedio >= 4) and (tpDesaprobados <= 1)) then
				aprobados := aprobados + 1;

			// Evaluamos si está desaprobado para el Caso B

			if (tpDesaprobados < 1) then
				desaprobadosPorTP := desaprobadosPorTP + 1;

			// Para el C
			if promedio > mejorPromedio then
				begin
					mejorPromedio := promedio;
					mejorAlumno := alumno;
				end;
			// Contador de Alumnos
			totalAlumnos := totalAlumnos + 1;
        end;
	// Respuestas
	// A
	writeln((aprobados/totalAlumnos*100):2:2,'%');
	// B
	writeln(desaprobadosPorTP);
	// C
	writeln(mejorAlumno);
	writeln(nombres);
    close(arch);
END.
