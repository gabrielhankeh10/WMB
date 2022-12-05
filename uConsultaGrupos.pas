unit uConsultaGrupos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, uGrupos;

type
  TConsultasGrupos = class(TForm)
    LayoutTodo: TLayout;
    LayoutTop: TLayout;
    lblNomeConsulta: TLabel;
    Rectangle1: TRectangle;
    LayoutPesquisar: TLayout;
    LayoutCampoPesquisa: TLayout;
    LayoutBuscar: TLayout;
    RoundRect1: TRoundRect;
    Label9: TLabel;
    RoundRect2: TRoundRect;
    edtPesquisaGrupo: TEdit;
    StyleBook1: TStyleBook;
    LayoutListView: TLayout;
    ListViewGrupos: TListView;
    procedure Label9Click(Sender: TObject);
  private
    { Private declarations }
    oGrupo: Grupos;
    procedure Adiciona(pImg: TStream; pGrupo: string; pOrdem: integer);
  public
    { Public declarations }
  end;

var
  ConsultasGrupos: TConsultasGrupos;

implementation

{$R *.fmx}

procedure TConsultasGrupos.Adiciona(pImg: TStream; pGrupo: string;
  pOrdem: integer);
begin

end;

procedure TConsultasGrupos.Label9Click(Sender: TObject);
var mImg: TStream;
    k: integer;
    pGrupo, pOrdem : Grupos;

begin
  mImg := TMemoryStream.Create;
  for k := 1 to 8 do
   // adiciona(pGrupo,pOrdem);
end;

end.
