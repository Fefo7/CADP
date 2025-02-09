
{Un comercio dispone de una estructura de datos con las facturas (como máximo 2000 facturas)
realizadas durante marzo de 2023. De cada factura se conoce el número de
factura, código de cliente, código de sucursal y monto total. Las facturas se
encuentran ordenadas por código de sucursal. Se pide implementar un programa
con un módulo que reciba la estructura que se dispone y devuelva el código de
sucursal con mayor cantidad de facturas. El programa debe informar el valor
retornado por el módulo.}

Program _11_04_23;

Type 

  factura = Record
    num: Integer;
    codeC: integer;
    codeS: Integer;
    montoTotal: real;
  End;
  listFactura = ^nodo;
  nodo = Record
    elem: factura;
    sig: listFactura;
  End;
Procedure CargarLista (Var l: listFactura);
Begin
  //se dispone
End;
Procedure actulizarMaximo(Var sucursalMax,cantFacturasMax: Integer;  actS,
                          cantFacturas : integer);
Begin
  If (cantFacturas > cantFacturasMax)Then
    Begin
      sucursalMax := actS;
      cantFacturasMax := cantFacturas;
    End;
End;

Procedure Procesardatos(l:listFactura; Var sucursalMax,cantFacturasMax: Integer)
;

Var 
  actS: Integer;
  cantFacturas: integer;
Begin
  While (l<>Nil) Do
    Begin
      actS := l^.elem.codeS;
      cantFacturas := 0;
      While (l<> Nil) And (l^.elem.codeS = actS) Do
        Begin
          cantFacturas := cantFacturas +1;
          l := l^.sig;
        End;
      actulizarMaximo(sucursalMax,cantFacturasMax, actS, cantFacturas);
    End;
End;

Var 
  l: listFactura;
  sucursalMax: integer;
  cantFacturasMax: integer;
Begin
  l := Nil;
  cantFacturasMax := -1;
  CargarLista(l);
  Procesardatos(l,sucursalMax,cantFacturasMax);
  WriteLn('la sucursal con mas facturas vendidas fue: ', sucursalMax, 'con: ',
          cantFacturasMax, 'vendidas' );
End.
