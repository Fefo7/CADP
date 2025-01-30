{ Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020. De
 cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y
 kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y para
 un mismocódigo de auto pueden existir 1 o más viajes. Se pide:
 a. Informar los dos códigos de auto que más kilómetros recorrieron.
 b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de
 viaje}


Program main3;
type
  viaje = record
      numVieje: integer;
      codAuto: integer;
      direDest: String[20];
      direOrig: String[20];
      kmRecorrido: real;
    end;
    listViaje = ^nodo;
    nodo = record
      elem: viaje;
      sig: listViaje;
    end;

procedure CargarListaViajes(var l:listViaje);
begin
  //se dispone
end;
procedure CalcularMaximos(codAutoAct:integer;kmXAuto : real;
    var codMax, codMax2: integer;var kmMax,kmMax2: real);
begin
    if(kmXAuto > kmMax)then
    begin
      kmMax2:= kmMax;
      codMax2:= codMax;
      codMax:= codAutoAct;
      kmMax:= kmXAuto;
    end
    else
      begin
        if (kmXAuto>kmMax2 ) then
        begin
            kmMax2 := kmXAuto;
            codMax2 := codAutoAct;
        end;
      end;
end;

procedure CargarListaOrdenada(var lnue:listViaje; v:viaje ); 
var
  ant,act, nue:listViaje; 
begin
    New(nue);
    nue^.elem:= v;
    ant:= lnue;
    act:= lnue;
    while (act<> nil) and (act^.elem.numVieje > v.numVieje) do
    begin
      ant:= act;
      act:=act^.sig;
    end;
    if(act = ant) then  
      lnue:= nue
    else
      ant^.sig:= nue;
    nue^.sig:=act;
        
end;

procedure ProcesarDatos(l: listViaje; var lnue:listViaje );
var 
  codAutoAct: integer;
  kmXAuto: real;
  codMax,codMax2: integer;
  kmMax,kmMax2: real;
begin
  kmMax:= -1;
  while l<>nil do
  begin
      codAutoAct:= l^.elem.codAuto;
      kmXAuto:= 0;
      while ((l<>nil) and  (l^.elem.codAuto = codAutoAct))do
      begin
          kmXAuto:=kmXAuto + l^.elem.kmRecorrido;
          if(l^.elem.kmRecorrido> 5) then
              CargarListaOrdenada(lnue, l^.elem);
          l := l^.sig;
      end;
      CalcularMaximos(codAutoAct,kmXAuto, codMax, codMax2, kmMax,kmMax2);
  end;
  WriteLn('2 codigos con mas kilometros recorridos: ',codMax, 'cod2: ',codMax2 );

end;
var
  l,listNue:listViaje;
begin
  l:=nil;
  listNue:= nil;
  CargarListaViajes(l);
  ProcesarDatos(l,listNue);

end.

