{Una empresa dispone de la información de las asistencias de sus empleados durante un período de tiempo. De cada empleado conoce: 
DNI, apellido y nombre, código de departamento en el que trabaja (entre 1 y 100), fecha y si estuvo presente o no ese día 
(no todos los días se pasa asistencia y los empleados pueden haber estado trabajando o haber faltado). Esta estructura se encuentra ordenada por
código de departamento. Se pide realizar un programa que informe el departamento con más empleados presentes durante el período evaluado por la empresa.}
program _03_09_24;
const
    maxCod = 100;
type
    rango= 1..maxCod;
    empleado = record
        dni:integer;
        ape_nom: String[30];
        codeDepa: rango;
        fecha: String[30];
        presente: boolean;
    end;
    listAsistencia= ^nodo;
    nodo= record
        elem: empleado;
        sig: listAsistencia;
    end;
procedure cargarListaOrdenada(var l:listAsistencia);
begin
  //se dispone
end;
procedure ActualizarMaximo(cantEmpleados: integer; actDepa: rango; var max:integer; var numDepaMax:rango );
begin
    if(cantEmpleados > max)then
    begin
      max:= cantEmpleados;
      numDepaMax:= actDepa;
    end;
      
end;
procedure procesarDatos(l: listAsistencia);
var
    actDepa,numDepaMax: rango;
    max, cantEmpleados:Integer;
begin
  max:= -1;
  while l<>nil do
  begin
        cantEmpleados:=0;
        actDepa:= l^.elem.codeDepa;
        while (l<>nil) and (l^.elem.codeDepa = actDepa) do
        begin
           if(l^.elem.presente)then
                cantEmpleados:= cantEmpleados +1;
            l:=l^.sig;
        end;
        ActualizarMaximo(cantEmpleados, actDepa, max , numDepaMax);
  end;
  WriteLn('el departamento con mas empleados fue: ', numDepaMax);
end;
var
    l:listAsistencia;
begin
  l:=nil;
  cargarListaOrdenada(l);
  procesarDatos(l);
end.