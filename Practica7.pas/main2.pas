
{Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
 automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada
 (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código 1122,
 el cual debe procesarse.
 La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el cliente
 debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene contratada.
 Una vez finalizada la lectura de todos los clientes, se pide:
 a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente por su
 seguro automotriz (monto básico + monto adicional).
 b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
 c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
 estructura.}

Program main2;
const
  maxCat = 6;
type
  polizaRang = 1..maxCat;
  cliente = record
    codCli: integer;
    dni: integer;
    apellido: String[25];
    nombre: string[25];
    polizaCont: polizaRang;
    montoBasico: real;
    end;
    tabla = array[polizaRang] of real;
    listCliente = ^nodo;
    nodo= record
      elem: cliente;
      sig: listCliente;
    end;

procedure cargarTabla(var t:tabla);
begin
  // se dispone
end;
procedure cargarCliente(var c:cliente);
begin
  Writeln('ingrese el codcliente');
  ReadLn(c.codCli);
  Writeln('ingrese el dni');
  ReadLn(c.dni);
  Writeln('ingrese el apellido');
  ReadLn(c.apellido);
  Writeln('ingrese el nombre');
  ReadLn(c.nombre);
  Writeln('ingrese la poliza');
  ReadLn(c.polizaCont);
  Writeln('ingrese el monto basico');
  ReadLn(c.montoBasico);
end;
procedure agregarAdelante(var l: listCliente; c:cliente);
var
  aux: listCliente;
begin
  new(aux);
  aux^.elem:= c;
  aux^.sig:= l;
  l:= aux;
end;

procedure CargarLista(var l:listCliente);
var
  c:cliente;
begin
  repeat
    cargarCliente(c);
    agregarAdelante(l,c);
  until  c.dni = 1122;
end;

procedure imprimirCliente(c:cliente; monto: real);
begin
  WriteLn('dni: ', c.dni);
  WriteLn('codigo de cliente: ', c.codCli);
  WriteLn('nombre: ', c.nombre);
  WriteLn('apellido: ', c.apellido);
  WriteLn('poliza contratado: ', c.polizaCont);
  WriteLn('monto total: ', (c.montoBasico + monto));
end;
function almenosDosNueve(dni: Integer): Boolean;
var 
  cant,digit: integer;
begin
  cant:=0;
  while cant<= 2  do
  begin
    digit:= dni mod 10;
    dni:= dni div 10;
    if(digit = 9) then
      cant:= cant+1;
  end;
  almenosDosNueve:= (cant = 2);
end;
procedure EliminarCliente(var l: listCliente; codC: Integer);
var
  act,ant: listCliente;
begin
  act:= l;
  ant:= l;
  while (act<> nil )and (act^.elem.codCli <> codC) do
  begin
    ant:= act;
    act:= act^.sig;
  end;
  if(act <> nil) then
  begin
    if(act = L) then
        l:= l^.sig
    else
        ant^.sig:= act^.sig;
    Dispose(act);
  end
  else
    WriteLn('la lista esta vacia');


end;
procedure ProcesarDatos(l:listCliente; t: tabla);
begin
  while l<> nil do
  begin
    imprimirCliente(l^.elem, t[l^.elem.polizaCont]);
    if(almenosDosNueve(l^.elem.dni))then
    begin
      WriteLn('cliente con al menos dos nueves en su dni');
      WriteLn('nombre: ', l^.elem.nombre);
      WriteLn('apellido: ', l^.elem.apellido);
    end;
    l:=l^.sig;
  end;
end;

var
  t:tabla;
  l:listCliente;
  codC:integer;
Begin
  cargarTabla(t);
  CargarLista(l);
  ProcesarDatos(l,t);
  WriteLn('ingrese un codigo de cliente para eliminar');
  ReadLn(codC);
  EliminarCliente(l, codC);
End.
