
Program numCapicua;

Var 
  num, reversedNum, temp, digit: Integer;

Begin
  Write('Introduce un numero: ');
  ReadLn(num);

  reversedNum := 0;
  temp := num;

  While temp <> 0 Do
    Begin
      digit := temp Mod 10;
      WriteLn('digito que se esta comprobando: ',digit);
      reversedNum := reversedNum * 10 + digit;
      WriteLn('numero en reversa: ', reversedNum);
      temp := temp Div 10;
      WriteLn('numero que se esta cortando: ', temp);

    End;

  If num = reversedNum Then
    WriteLn('El numero es capicua.')
  Else
    WriteLn('El numero no es capicua.');
End.
