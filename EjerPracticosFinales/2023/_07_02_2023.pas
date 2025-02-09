
{Un comercio dispone de la información de sus clientes. De cada cliente se
conoce su DNI, fecha y monto de la compra. La información está ordenada por el
DNI del cliente, Se pide implementar un programa que genere una estructura de
datos que contenga DNI del cliente, la cantidad de compras que realizó y el
monto total de las compras, sólo con los clientes que realizaron más de 5
compras.}

Program _07_02_2023;

Type 
  cliente = Record
    dni: integer;
    monto: real;
    fecha: string[25];
  End;
  clienteRegistro = Record
    dni: Integer;
    cantCompras: integer;
    montoTotalCompras: real;
  End;
  listCliente = ^nodo;
  nodo = Record
    elem: cliente;
    sig: listCliente;
  End;
  ventasXcliente = ^nodo2;
  nodo2 = Record
    elem: clienteRegistro;
    sig: ventasXcliente;
  End;

Procedure CargarLista( Var l:listCliente);
Begin
  // se dispone
End;

Procedure agregarAdelante(c:clienteRegistro; Var l:ventasXcliente);

Var 
  aux: ventasXcliente;
Begin
  new(aux);
  aux^.elem := c;
  aux^.sig := l;
  l := aux;
End;

Procedure procesarDatos(cli: listCliente; Var cliRegis: ventasXcliente);

Var 
  cliRegs: clienteRegistro;
  dniAct: Integer;
Begin
  While (cli<> Nil) Do

    Begin
      dniAct := cli^.elem.dni;
      cliRegs.cantCompras := 0;
      cliRegs.montoTotalCompras := 0;
      While (cli<> Nil) And (cli^.elem.dni = cliRegs.dni) Do
        Begin
          cliRegs.cantCompras := cliRegs.cantCompras +1;
          cliRegs.montoTotalCompras := cliRegs.montoTotalCompras + cli^.elem.
                                       monto;
          cli := cli^.sig;
        End;
      If (cliRegs.cantCompras > 5) Then
        Begin
          cliRegs.dni := dniAct;
          agregarAdelante(cliRegs, cliRegis);
        End;
    End;
End;

Var 
  clientes: listCliente;
  cliRegis: ventasXcliente;
Begin
  clientes := Nil;
  cliRegis := Nil;
  CargarLista(clientes);
  procesarDatos(clientes, cliRegis);
End.
