

























{Un comercio dispone de una estructura de datos con las facturas realizadas
durante agosto de 2023. De cada factura se conoce el número de factura, código
de cliente, código de sucursal (1..5) y monto total. Se pide implementar un
programa que lea un código de sucursal e invoque a un módulo que reciba dicho
código y elimine las facturas correspondientes al código de sucursal recibida.
Además debe retornar la cantidad de facturas eliminadas.}

Program _10_10_23;

Const 
  maxS = 5;

Type 
  rango = 1..maxS;
  factura = Record
    numero: integer;
    codeC: Integer;
    codeS: rango;
    montoTotal: real;
  End;
  listFactura = ^nodo;
  nodo = Record
    elem: factura;
    sig: listFacturaM;
  End;
Procedure CargarLista(Var l:listFactura);
Begin
  //se dispone
End;
Procedure ProcesarDatos(codeS: Integer; Var l:listFactura;Var cantEliminadas:
                        integer);

Var 
  act,ant: listFactura;
Begin
  act := l;
  ant := l;
  While act <> bil Do
    Begin
      If (act^.elem.codeS <> codeS)Then
        Begin
          ant := act;
          act := act^.sig;
        End
      Else
        Begin
          If (act = l)Then
            l := act^.sig
          Else
            ant^.sig := act^.sig;
          cantEliminadas := cantEliminadas +1;
          Dispose(act);
          act := ant^.sig;
        End;
    End;
End;

Var 
  l: listFactura;
  codeEliminar: rango;
  cantEliminadas: integer;
Begin
  L := Nil;
  cantEliminadas := 0;
  CargarLista(l);
  WriteLn('ingrese el codigo de sucursal a eliminar(1..5)');
  ReadLn(codeEliminar);
  ProcesarDatos(codeEliminar, l, cantEliminadas);
  WriteLn('cantidad de facturas eliminadas de la sucursal ',codeEliminar,
          'es de: ', cantEliminadas);

End.
