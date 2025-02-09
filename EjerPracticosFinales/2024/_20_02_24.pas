{una empresa dispone de una estructura de datos clientes de su comercio 
(500 a lo sumo).De cada cliente conoce el numero de cliente,
 numero de dni y monto que paga. Se pide implementar un programa
que informe la cantidad de clientes cuyo numero de dni es capicua.}
program _20_02_24;
const
    dimf =500;
type 
    cliente = record
        numero: integer;
        dni: integer;
        montoPaga: real;
    end;
    vector = array[1..dimf] of cliente;
procedure cargarVector(var v:vector; var diml: integer);
begin
  // se dispone
end;

Function isCapicua(dni: Integer): Boolean;
Var 
  temp, reverse, digit: Integer;
Begin
  reverse := 0;
  temp := dni;
  While dni <> 0 Do
    Begin
      digit := dni Mod 10;
      reverse := reverse * 10 + digit;
      dni := dni Div 10;
    End;
  isCapicua := (temp = reverse);
End;


procedure procesarDatos(v:vector;diml:integer);
var
    i,cont:integer;
begin
    cont:= 0;
    for i:=1 to diml do
    begin
       if(isCapicua(v[i].dni)) then
         cont:= cont +1;
    end;
    WriteLn('la cantidad de clientes con dni capicua es de: ', cont);
end;

var
    v: vector;
    diml: integer;
begin
  diml:=0;
  cargarVector(v,diml);
  procesarDatos(v,diml);
end.