unit keygenu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils , SbpBase58;

Const
  KLEN = 32 ;

Type
  TKeyValue = Array[0..KLEN-1] Of Byte ;

Const
  KMAXVALUE : TKeyValue =
    ($ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,
     $fe,$ba,$ae,$dc,$e6,$af,$48,$a0,$3b,$bf,$d2,$5e,$8c,$d0,$36,
     0,0);

Type

  { TKey }

  TKey = Class
  Private
    FKeyValue : TKeyValue ;
    FKeyHex   : String    ;
    procedure SetKeyValue(AValue: TKeyValue);
  Public
    Constructor Create ;
    Property KeyValue : TKeyValue read FKeyValue write SetKeyValue ;
    Property KeyHex   : String Read FKeyHex ;

  End ;

Function NewKeyValue : TKeyValue ;
Function KeyValue2Hex(AValue:TKeyValue):String ;

implementation

Function NewKeyValue : TKeyValue ;
 var
  i,mm : byte  ;
  mb : boolean ;

 Begin
   mb:=True;
   for i:=0 to KLEN-1 Do
    begin
      if mb then mm:=KMAXVALUE[i] else mm:=$ff;
      Result[i]:=Random(mm+1);
      if mb and (Result[i]<mm) then mb:=false;
    end;

 end;

Function KeyValue2Hex(AValue:TKeyValue):String ;
 var i : byte ;
 begin
   Result:='';
   for i:=0 to KLEN-1 Do Result:=Result+IntToHex(AValue[i]);
   Result:=LowerCase(Result);
 end;

{ TKey }

procedure TKey.SetKeyValue(AValue: TKeyValue);
begin
  FKeyValue:=AValue;
  FKeyHex:=KeyValue2Hex(AValue);
end;

constructor TKey.Create;
begin
  KeyValue:=NewKeyValue;
end;

initialization
 Randomize ;
end.

