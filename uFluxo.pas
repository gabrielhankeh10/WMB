unit uFluxo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmFluxo = class(TForm)
    Layout1: TLayout;
    Cabecalho: TLayout;
    Image1: TImage;
    Saldo: TLayout;
    SaldoCenter: TLayout;
    lblSaldo: TLabel;
    lblDataSaldo: TLabel;
    EntradasSaidas: TLayout;
    Entradas: TLayout;
    Saidas: TLayout;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFluxo: TfrmFluxo;

implementation

{$R *.fmx}

end.
