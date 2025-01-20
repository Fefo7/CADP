
Program main1;

Const 
  maxRang = 5;

Type 
  rango = 1..maxRang;
  vecContador = array[rango] Of integer;
  persona = Record
    dni: Integer;
    apellido: Integer;
    nombre: integer;
    edad: 1..100;
    codGenero: rango;
  End;
  listActores = ^nodo;
  nodo = Record
    elem: persona;
    sig: listActores;
  End;
Procedure inicializarVector(Var v: vecContador);

Var 
  i: integer;
Begin
  For i:=1 To maxRang Do
    Begin
      v[i] := 0;
    End;
End;
Procedure leerPersona(Var p: persona);
Begin
  WriteLn('ingrese el dni');
  ReadLn(p.dni);
  WriteLn('ingrese el nombre');
  ReadLn(p.nombre);
  WriteLn('ingrese el apellido');
  ReadLn(p.apellido);
  WriteLn('ingrese el edad');
  ReadLn(p.edad);
  WriteLn('ingrese el codeGenero');
  ReadLn(p.codGenero);

End;

Procedure agregarAdelante(Var l: listActores; p:persona);

Var 
  nue: listActores;
Begin
  new(nue);
  nue^.elem := p;
  nue^.sig := l;
  l := nue;
End;

Procedure cargarActores(Var l:listActores; Var v:vecContador);

Var 
  p: persona;
Begin
  Repeat
    leerPersona(p);
    agregarAdelante(l,p);
    v[p.codGenero] := v[p.codGenero] + 1;
  Until p.dni = 33555444;
End;
Procedure cantidadDniPares(Var cantPersonas: integer; dni:Integer);

Var 
  digit,par, impar: integer;
Begin
  par := 0;
  impar := 0;
  While dni <> 0 Do
    Begin
      digit := dni Mod 10;
      dni := dni Div 10;
      If ((digit Mod 2) = 0)Then
        par := par+1
      Else
        impar := impar+1;
    End;
  If par > impar Then
    cantPersonas := cantPersonas +1;
End;
Procedure buscarMaximos(v:vecContador; Var codG,codG2 : rango; Var max,max2:
                        Integer);

Var 
  i: integer;
Begin
  For i:=1 To maxRang Do
    Begin
      If (v[i]> max) Then
        Begin
          max2 := max;
          codG2 := codG;
          max := v[i];
          codG := i;
        End
      Else
        If v[i] > max2 Then
          Begin
            max2 := v[i];
            codG2 := i;
          End;
    End;
End;

Procedure procesarDatos(l:listActores;v:vecContador);

Var 
  cantPersonas: integer;
  codG,codG2: rango;
  max,max2: integer;
Begin
  cantPersonas := 0;
  max := -1;
  While l <> Nil Do
    Begin
      cantidadDniPares(cantPersonas, l^.elem.dni);
      buscarMaximos(v,codG,codG2,max,max2);
      l := l^.sig;
    End;
  WriteLn('cantidad de personas con mas numero pares: ', cantPersonas);
  WriteLn('codigos de genero maximos: ', codG, codG2);

End;

Procedure eliminarNodo(Var l:listActores; act: listActores;ant: listActores);
Begin
  If (act = l) Then
    l := l^.sig
  Else
    ant^.sig := act^.sig;
  Dispose(act);
End;

Procedure eliminarDato(Var l: listActores);

Var 
  dni: Integer;
  act,ant: listActores;
Begin
  WriteLn('ingrese el dni que quiera eliminar');
  ReadLn(dni);
  act := l;
  While (act<> Nil) And (act^.elem.dni <> dni ) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If ((act <> Nil) And (act^.elem.dni = dni))Then
    Begin
      eliminarNodo(l,act,ant);
    End
  Else
    WriteLn('no se encontro el dni');
End;


Var 
  l: listActores;
  v: vecContador;
Begin
  l := Nil;
  inicializarVector(v);
  cargarActores(l,v);
  procesarDatos(l,v);
  eliminarDato(l);
End.
