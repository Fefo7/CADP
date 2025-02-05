
Program numCapicua;

Var 
  num, reversedNum, tem2p, digit: Integer;

Begin
  Write('Introduce un numero: ');
  ReadLn(num);

  reversedNum := 0;
  temp := num;

  While temp <> 0 Do
    Begin
      digit := temp Mod 10;  
      reversedNum := reversedNum * 10 + digit;
      temp := temp Div 10;
    End;

  If num = reversedNum Then
    WriteLn('El numero es capicua.')
  Else
    WriteLn('El numero no es capicua.');
End.
