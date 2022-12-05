program Projeto_01;

uses
  System.StartUpCopy,
  FMX.Forms,
  Programa_01 in 'Programa_01.pas' {Principal},
  uPermissoes in 'uPermissoes.pas',
  uFluxo in 'uFluxo.pas' {frmFluxo},
  uAplicacao in 'uAplicacao.pas' {frmAplicacao},
  uDM in 'uDM.pas' {dm: TDataModule},
  uUsuarios in 'uUsuarios.pas',
  uGrupos in 'uGrupos.pas',
  uConsultaGrupos in 'uConsultaGrupos.pas' {ConsultasGrupos},
  uConsultaLancamentos in 'uConsultaLancamentos.pas' {ConsultaLancamentos},
  uLancamentos in 'uLancamentos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TfrmFluxo, frmFluxo);
  Application.CreateForm(TConsultasGrupos, ConsultasGrupos);
  Application.CreateForm(TConsultaLancamentos, ConsultaLancamentos);
  Application.CreateForm(TConsultaLancamentos, ConsultaLancamentos);
  Application.Run;
end.
