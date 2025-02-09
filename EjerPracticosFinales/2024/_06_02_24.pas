
{Una empresa dispone de una estructura de datos con las ventas de su
comercio. De cada venta se conoce número de venta, cantidad de
productos y tipo de pago (efectivo o tarjeta). Se pide implementar
un programa que genere una segunda estructura con las ventas cuya
cantidad de productos tenga más dígitos pares que impares. En la
estructura generada deben quedar almacenadas las ventas de tipo de 
pago efectivo antes que las de tipo de pago con tarjeta.}
Program _06_02_24;

Type 
  rango = 1..2; // 1 (efectivo) 2 (tarjeta)
  venta = Record
    numero: integer;
    cantProd: Integer;
    tipoPago: rango;
  End;
  listVenta = ^nodo;
  nodo = Record
    elem: venta;
    sig: listVenta;
  End;

Procedure InicializarLista(Var l: listVenta);
Begin
  l := Nil;
End;

Procedure CargarLista(Var l: listVenta);
Begin
  // Implementar la carga de la lista
End;

Function MasPares(cantProd: Integer): Boolean;

Var 
  digit, pares, impares: integer;
Begin
  pares := 0;
  impares := 0;
  While cantProd <> 0 Do
    Begin
      digit := cantProd Mod 10;
      cantProd := cantProd Div 10;
      If (digit Mod 2) = 0 Then
        pares := pares + 1
      Else
        impares := impares + 1;
    End;
  MasPares := (pares > impares);
End;

Procedure AgregarAlfinal(Var l, ult: listVenta; v: venta);

Var 
  aux: listVenta;
Begin
  new(aux);
  aux^.elem := v;
  aux^.sig := Nil;
  If l = Nil Then
    l := aux
  Else
    ult^.sig := aux;
  ult := aux;
End;

Procedure ProcesarDatos(ventas: listVenta; Var ventasPares: listVenta);

Var 
  ultEfectivo, ultTarjeta: listVenta;
Begin
  ultEfectivo := Nil;
  ultTarjeta := Nil;
  While ventas <> Nil Do
    Begin
      If MasPares(ventas^.elem.cantProd) Then
        Begin
          If ventas^.elem.tipoPago = 1 Then
            AgregarAlfinal(ventasPares, ultEfectivo, ventas^.elem)
          Else
            AgregarAlfinal(ventasPares, ultTarjeta, ventas^.elem);
        End;
      ventas := ventas^.sig;
    End;
  If ultTarjeta <> Nil Then
    ultTarjeta^.sig := ultEfectivo;
End;

Procedure ImprimirLista(l: listVenta);
Begin
  While l <> Nil Do
    Begin
      writeln('Numero de Venta: ', l^.elem.numero);
      writeln('Cantidad de Productos: ', l^.elem.cantProd);
      writeln('Tipo de Pago: ', l^.elem.tipoPago);
      l := l^.sig;
    End;
End;

Var 
  ventas, ventasPares: listVenta;
Begin
  InicializarLista(ventas);
  InicializarLista(ventasPares);
  CargarLista(ventas);
  ProcesarDatos(ventas, ventasPares);
  ImprimirLista(ventasPares);
End.
