
Program test;

Var c, d: integer;

Procedure prueba(Var a:integer; Var b:integer; Var c:integer);

Var 
  a: integer;
Begin
  a := (b Div 3) + c;

  b := (18 Div a) +d;

  If ((a+b)> 5) Then b := b+(a*2)
  Else b := (b+a)*3;
  c := a + b+c;
  WriteLn('valor a: ', a, 'valor b: ', b, 'valor c: ',c);
End;

Var 
  a,b: integer;
Begin
  a := 4;
  b := 3;
  c := 8;
  d := 5;
  prueba(b,c,a);
  WriteLn('valor a: ', a, 'valor b: ', b, 'valor c: ',c)
End.
