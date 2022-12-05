unit Programa_01;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.StdCtrls, FMX.MediaLibrary.Actions,uPermissoes,FMX.StdActns, uAplicacao,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, uUsuarios, uGrupos, uConsultaGrupos, uConsultaLancamentos, uLancamentos;

type
  TPrincipal = class(TForm)
    LayoutForm: TLayout;
    LayoutTop: TLayout;
    LayoutCorpo: TLayout;
    LayoutLogin: TLayout;
    Image1: TImage;
    RoundRect1: TRoundRect;
    EditLogin: TEdit;
    StyleBook1: TStyleBook;
    LayoutSenha: TLayout;
    RoundRect2: TRoundRect;
    EditSenha: TEdit;
    LayoutAcessar: TLayout;
    RoundRect3: TRoundRect;
    TabForm: TTabControl;
    TabCadastro: TTabItem;
    TabLogin: TTabItem;
    Layout1: TLayout;
    LayoutCab: TLayout;
    Image2: TImage;
    LayoutCorpoCad: TLayout;
    LayoutEmailCad: TLayout;
    RoundRect4: TRoundRect;
    LayoutSenhaCad: TLayout;
    RoundRect5: TRoundRect;
    LayoutSalvarCad: TLayout;
    RoundRect6: TRoundRect;
    LayoutLoginCad: TLayout;
    RoundRect7: TRoundRect;
    TabSalvar: TTabItem;
    TabAddFoto: TTabItem;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    CircFoto: TCircle;
    Layout6: TLayout;
    Layout7: TLayout;
    Image4: TImage;
    Image5: TImage;
    LayoutRodapeLogin: TLayout;
    LayoutRodapeCadastro: TLayout;
    LayoutRodapeSalvar: TLayout;
    Active: TActionList;
    Layout2: TLayout;
    Layout8: TLayout;
    Action1: TAction;
    actLogin: TChangeTabAction;
    actCadastro: TChangeTabAction;
    actSalvar: TChangeTabAction;
    actFoto: TChangeTabAction;
    Layout9: TLayout;
    actCamera: TTakePhotoFromCameraAction;
    actGaleria: TTakePhotoFromLibraryAction;
    Label1: TLabel;
    edtEmail: TEdit;
    Label2: TLabel;
    lblTelaCadastro: TLabel;
    edtSenha: TEdit;
    RoundRect8: TRoundRect;
    Label4: TLabel;
    actAddFoto: TChangeTabAction;
    Label6: TLabel;
    Label5: TLabel;
    Layout12: TLayout;
    Layout13: TLayout;
    Layout10: TLayout;
    Label7: TLabel;
    Label8: TLabel;
    lblFacaLogin: TLabel;
    actUsuariosCadastrados: TChangeTabAction;
    edtLogin: TEdit;
    TabCadastroGrupo: TTabItem;
    LayoutTodoGrupo: TLayout;
    LayoutCabecalho: TLayout;
    LayoutFoto: TLayout;
    LayoutAjusteFoto: TLayout;
    Image3: TImage;
    LayoutCadastroGrupo: TLayout;
    RoundRect11: TRoundRect;
    edtGrupo: TEdit;
    LayoutCadastroOrdem: TLayout;
    RoundRect12: TRoundRect;
    edtOrdem: TEdit;
    LayoutSalvarGrupo: TLayout;
    RoundRect13: TRoundRect;
    Label9: TLabel;
    lblConsultarGrupo: TLabel;
    TabLancamentos: TTabItem;
    LayoutTodoLancamentos: TLayout;
    LayoutTopoLancamento: TLayout;
    LayoutLancamento: TLayout;
    LayoutGrupoLancto: TLayout;
    RoundRect14: TRoundRect;
    LayoutValorLancto: TLayout;
    edtCodigoGrupoLancamento: TEdit;
    RoundRect15: TRoundRect;
    edtValorLancamento: TEdit;
    LayoutHistorico: TLayout;
    Rectangle1: TRectangle;
    edtHistoricoLancamento: TEdit;
    LayoutRodapeLancto: TLayout;
    LayoutSalvar: TLayout;
    RoundRect16: TRoundRect;
    Label11: TLabel;
    lblNomeConsulta: TLabel;
    Rectangle2: TRectangle;
    Label10: TLabel;
    actCadastroGrupo: TChangeTabAction;
    actLancamento: TChangeTabAction;
    Label12: TLabel;
    LayoutCadastroGrupoLanto: TLayout;
    Rectangle3: TRectangle;
    Label3: TLabel;
    Layout11: TLayout;
    Image6: TImage;
    Layout14: TLayout;
    Image7: TImage;
    Layout16: TLayout;
    ImageVoltar: TImage;
    procedure Image7Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Layout2Click(Sender: TObject);
    procedure ImageVoltarClick(Sender: TObject);
    procedure lblCadastroClick(Sender: TObject);
    procedure lblFotoClick(Sender: TObject);
    procedure lblCadastroLoginClick(Sender: TObject);
    procedure CircFotoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure lblTelaCadastroClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure lblFacaLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label9Click(Sender: TObject);
    procedure lblConsultarGrupoClick(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Layout14Click(Sender: TObject);

  private
    { Private declarations }
    aPermissao: TPermissoes;
    oLancamento: Lancamentos;
    oUsuario : Usuarios;
    oGrupos : Grupos;

    procedure ErroPermissao(Sender: TObject);
  public
    { Public declarations }


  end;

var
  Principal: TPrincipal;

implementation

{$R *.fmx}

procedure TPrincipal.CircFotoClick(Sender: TObject);
begin
  actFoto.Execute;
  //aPermissao.Camera(actCamera, ErroPermissao);
  //actLibraryCamera.Execute;
end;

procedure TPrincipal.ErroPermissao(Sender: TObject);
begin
  ShowMessage('Nao tem permissao para esse recurso');
end;



procedure TPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  principal := nil;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
  //TabForm.ActiveTab := TabLogin;
  aPermissao := TPermissoes.Create;
end;

procedure TPrincipal.FormDestroy(Sender: TObject);
begin
  aPermissao.DisposeOf;
end;

procedure TPrincipal.Image4Click(Sender: TObject);
begin
  aPermissao.Camera(actCamera,ErroPermissao);
end;

procedure TPrincipal.Image5Click(Sender: TObject);
begin
   aPermissao.PhotoLibrary(actGaleria,ErroPermissao);
end;

procedure TPrincipal.Image6Click(Sender: TObject);
begin
  actLancamento.Execute;
end;

procedure TPrincipal.Image7Click(Sender: TObject);
begin
  //TabForm.ActiveTab := TabSalvar;
  actLogin.Execute;
end;

procedure TPrincipal.ImageVoltarClick(Sender: TObject);
begin
  //TabForm.ActiveTab := TabLogin;
  actLogin.Execute;
end;

procedure TPrincipal.Image9Click(Sender: TObject);
begin
  //TabForm.ActiveTab := TabLogin;
  actLogin.Execute;
end;

procedure TPrincipal.Label11Click(Sender: TObject);
begin
  oLancamento.CODGRUPO := strtoint(edtCodigoGrupoLancamento.Text);
  oLancamento.VALOR := StrToFloat(edtValorLancamento.Text);
  oLancamento.HISTORICO := edtHistoricoLancamento.Text;
end;

procedure TPrincipal.Label12Click(Sender: TObject);
begin
  if not assigned(ConsultaLancamentos) then
  application.CreateForm(TConsultaLancamentos, ConsultaLancamentos);
  application.MainForm := ConsultaLancamentos;
  ConsultaLancamentos.Show;
  Principal.Close;
end;

procedure TPrincipal.Label1Click(Sender: TObject);
begin
  oUsuario.USUARIO := EditLogin.Text;
  oUsuario.EMAIL := edtEmail.Text;
  oUsuario.SENHA := EditSenha.Text;
  oUsuario.LOGADO := EditLogin.Text;
end;

procedure TPrincipal.Label2Click(Sender: TObject);
begin
  actLancamento.Execute;
end;

procedure TPrincipal.Label3Click(Sender: TObject);
begin
  actCadastroGrupo.Execute;
end;

procedure TPrincipal.lblTelaCadastroClick(Sender: TObject);
begin
  actCadastro.Execute;
end;


procedure TPrincipal.Label6Click(Sender: TObject);
begin
  actLogin.Execute;
end;

procedure TPrincipal.Label7Click(Sender: TObject);
begin
  actSalvar.Execute;
end;

procedure TPrincipal.Label8Click(Sender: TObject);
begin
  actCadastro.Execute;
end;

procedure TPrincipal.Label9Click(Sender: TObject);
begin
  oGrupos.GRUPO := edtGrupo.Text;
  oGrupos.ORDEM := strtoint(edtOrdem.Text);
  actLancamento.Execute;
end;

procedure TPrincipal.Layout14Click(Sender: TObject);
begin
  actLogin.Execute;
end;

procedure TPrincipal.Layout2Click(Sender: TObject);
begin
  //TabForm.ActiveTab := TabCadastro;
  actCadastro.Execute;
end;

procedure TPrincipal.lblCadastroClick(Sender: TObject);
begin
  //TabForm.ActiveTab := TabCadastro;
  actCadastro.Execute;
end;

procedure TPrincipal.lblCadastroLoginClick(Sender: TObject);
begin
  //TabForm.ActiveTab := TabCadastro;
  actCadastro.Execute;
end;

procedure TPrincipal.lblConsultarGrupoClick(Sender: TObject);
begin
    if not assigned(ConsultasGrupos) then
    application.CreateForm(TConsultasGrupos, ConsultasGrupos);
    application.MainForm := ConsultasGrupos;
    ConsultasGrupos.Show;
    Principal.Close;
end;

procedure TPrincipal.lblFacaLoginClick(Sender: TObject);
begin
  actLogin.Execute;
end;

procedure TPrincipal.lblFotoClick(Sender: TObject);
begin
  actFoto.Execute;
  //actFoto.Execute;
end;

end.
