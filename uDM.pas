unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB, system.IOUtils,
  FireDAC.Comp.Client;

type
  Tdm = class(TDataModule)
    conexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  with conexao do
  begin
     {$IFDEF MSWINDOWS}
     try
        params.values['Database'] := 'C:\Users\PDIVI-085\Desktop\Servidor Gabriel\Cod\2 Semestre 2022\Prog. Web Mobile\01 - 18-08-2022\'+'banco\webMobile.db';
        connected := true;
     except on E:Exception do
        raise Exception.Create('Erro conexao BD'+E.Message);

     end;
     {$ELSE}
     params.Values['DRIVERID'] = 'SQLITE';
     TRY
        params.values['Database'] := Tpath.Combine(TPatch.GetDocumentsPath,'webMobile.db';
        connected := true;
     except on E:Exception do
        raise Exception.Create('Erro conexao BD'+E.Message);
     end;
     {$ENDIF$}
  end;
end;
end.
