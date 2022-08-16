unit UPong;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  Tcampo = class(TForm)
    moverDireita: TTimer;
    bola: TPanel;
    jogador1: TPanel;
    jogador2: TPanel;
    moverEsquerda: TTimer;
    Label1: TLabel;
    procedure moverDireitaTimer(Sender: TObject);
    procedure moverEsquerdaTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  campo: Tcampo;
  espacamento: Integer;

implementation

{$R *.dfm}

procedure colisaoJogador1;
var
  parede:Integer;
begin
  parede := campo.bola.Left + campo.bola.Width;
  if parede >= campo.jogador1.left then
  begin
     campo.moverDireita.Enabled := false;
     campo.moverEsquerda.Enabled := true;
  end;
end;
procedure Tcampo.moverDireitaTimer(Sender: TObject);
begin
   bola.Left := bola.Left + 5;
   label1.Caption := intToStr(bola.Left);
   colisaoJogador1;
end;

procedure Tcampo.moverEsquerdaTimer(Sender: TObject);
begin
    bola.Left := bola.Left - 5;
    label1.Caption := intToStr(bola.Left);
    colisaoJogador1;
end;

procedure Tcampo.FormKeyDown(Sender: TObject;
var Key: Word;
  Shift: TShiftState);
begin
  if key = 38 then
  begin
    espacamento := 5;
    campo.jogador1.Top := campo.jogador1.top - espacamento;
  end;

  if key = 40 then
  begin
    espacamento := 5;
    campo.jogador1.Top := campo.jogador1.Top + espacamento;
  end;

  if key = 119 then
  begin
    espacamento := 5;
    campo.jogador2.Top := campo.jogador2.top - espacamento;
  end;

  if key = 115 then
  begin
    espacamento := 5;
    campo.jogador2.Top := campo.jogador2.Top + espacamento;
  end;
end;

end.
