unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls ,SbpBase58, keygenu;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
Var Key : TKey ;
begin
 Key := TKey.Create;
 Memo1.Lines.Add(Key.KeyHex);

 Memo1.Lines.Add(TBase58.BitCoin.Encode(Key.KeyValue));
end;

end.

