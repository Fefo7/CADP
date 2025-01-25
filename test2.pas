
Program test2;

Var 
  c: integer;

Procedure prueba (Var b,a: Integer);
Begin
  b := 10;
  WriteLn(b);
  WriteLn(a);

  While (b>0) Do
    Begin
      a := a+b;
      b := b-2;
      c := c-b;
    End;
  WriteLn('a= ', a, 'b= ', b,'c= ', c);
End;

Var 
  a,b: integer;
Begin
  b := 80;
  c := 30;
  a := 0;
  WriteLn('a= ', a, 'b= ', b,'c= ', c);
  prueba(a,b);
  WriteLn('a= ', a, 'b= ', b,'c= ', c);


End.
