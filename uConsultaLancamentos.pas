unit uConsultaLancamentos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TConsultaLancamentos = class(TForm)
    LayoutTodoLancto: TLayout;
    LayoutTop: TLayout;
    Rectangle1: TRectangle;
    lblNomeConsulta: TLabel;
    LayoutPesquisar: TLayout;
    LayoutCampoPesquisa: TLayout;
    RoundRect2: TRoundRect;
    edtPesquisaGrupo: TEdit;
    LayoutBuscar: TLayout;
    RoundRect1: TRoundRect;
    Label9: TLabel;
    LayoutListView: TLayout;
    ListView: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConsultaLancamentos: TConsultaLancamentos;

implementation

{$R *.fmx}

end.
