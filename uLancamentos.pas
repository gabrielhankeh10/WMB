unit uLancamentos;

interface
  uses FireDAC.comp.Client, Data.DB, FMX.Graphics, system.SysUtils;
  type Lancamentos = class
    private
      FNUMLANCTO: integer;
      FHISTORICO: string;
      FVALOR: double;
      FCODGRUPO: integer;
      FCODUSU: integer;
      FDATA: string;
    protected
      FConexao: TFDConnection;
    public
      constructor CrieObj(pConexao: TFDConnection);
      property NUMLANCTO: integer read FNUMLANCTO write FNUMLANCTO;
      property HISTORICO: string read FHISTORICO write FHISTORICO;
      property VALOR: double read FVALOR write FVALOR;
      property CODGRUPO: integer read FCODGRUPO write FCODGRUPO;
      property CODUSU: integer read FCODUSU write FCODUSU;
      property DATA: string read FDATA write FDATA;
      function Pesquisar(out erro: string): TFDQuery;
      function incluir(out erro: string):boolean;
      function Alterar(out erro: string):boolean;
      function Excluir(out erro: string):boolean;
  end;
implementation

{ grupos }

function Lancamentos.Alterar(out erro: string): boolean;
begin

end;

constructor Lancamentos.CrieObj(pConexao: TFDConnection);
begin
  FCONEXAO:= pConexao;
end;

function Lancamentos.Excluir(out erro: string): boolean;
begin

end;

function Lancamentos.incluir(out erro: string): boolean;
var qy: TFDQUery;
begin
  try
    try
      qy:= TFDQuery.Create(nil);
      qy.Connection := FConexao;
      with qy do
      begin
        Active := false;
        sql.Clear;
        sql.Add('insert into Lancamentos(historico, valor, codgrupo, codusu, data) value (historioc :historico, valor :valor, codgrupo :codgrupo, codusu :codusu, data :data);');
        ParamByName('historico').Value := HISTORICO;
        ParamByName('valor').Value := VALOR;
        ParamByName('codgrupo').Value := CODGRUPO;
        ParamByName('codusu').Value := CODUSU;
        ParamByName('data').Value := DATA;
        ExecSql;
      end;
      result := true;
      erro := '';
    except on E:Exception do
      begin
        erro := 'Nao foi possivel inserir erro: '+E.Message;
        result := false;
      end;
    end;
  finally
    qy.DisposeOf;
  end;
end;

function Lancamentos.Pesquisar(out erro: string): TFDQuery;
begin

end;

end.
