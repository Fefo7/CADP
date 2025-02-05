
{Una facultad dispone de los dni de aquellos estudiantes que no cumplen con los requisitos de regularidad (a lo sumo 1000),
los cuales no pueden seguir siendo estudiantes de la Facultad. Además, dispone de una estructura en la cual almacena todos los estudiantes;
de cada estudiante se conoce DNI, apellido y legajo. Esta estructura se encuentra ordenada por DNI. Se pide realizar un programa que elimine
(eficientemente en tiempo de ejecución) de la estructura que posee todos los estudiantes aquellos estudiantes que han perdido la regularidad.}
Program _06_08_24;

Const 
  dimf = 1000;

Type 
  vector = array[1..dimf] Of integer;
  estudiante = Record
    dni: integer;
    apellido: string[30];
    legajo: Integer;
  End;
  listEstudiante = ^nodo;
  nodo = Record
    elem: estudiante;
    sig: listEstudiante;
  End;
Procedure cargarvector(Var v: vector; Var diml: Integer);
Begin
  // se dispone
End;

Procedure cargarLista(Var estudiantes: listEstudiante);
Begin
  // se dispone
End;

Procedure eliminarEstuLista(dni: integer; Var l: listEstudiante);

Var 
  act, ant: listEstudiante;
Begin
  act := l;
  While (act <> Nil) And (act^.elem.dni < dni) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If ((act <> Nil) And (act^.elem.dni = dni)) Then
    Begin
      If (act = l) Then
        l := l^.sig
      Else
        ant^.sig := act^.sig;
      dispose(act);
    End;
End;

Procedure eliminarEstudiantes(v: vector; diml: integer; Var estudiantes:
                              listEstudiante);

Var 
  i: integer;
Begin
  For i := 1 To diml Do
    Begin
      eliminarEstuLista(v[i], estudiantes);
    End;
End;

Var 
  estudiantes: listEstudiante;
  v: vector;
  diml: integer;
Begin
  estudiantes := Nil;
  diml := 0;
  cargarvector(v, diml);
  cargarLista(estudiantes);
  eliminarEstudiantes(v, diml, estudiantes);
End.
