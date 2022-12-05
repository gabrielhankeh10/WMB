unit uGrupos;

interface
  uses FireDAC.comp.Client, Data.DB, FMX.Graphics, system.SysUtils;
  type grupos = class
    private
    FIMG: TBITMAP;
    FCODGRUPO: integer;
    FORDEM: integer;
    FGRUPO: STRING;
    protected
      FConexao: TFDConnection;
    public
      constructor CrieObj(pConexao: TFDConnection);
      property CODGRUPO: integer read FCODGRUPO write FCODGRUPO;
      property GRUPO: STRING read FGRUPO write FGRUPO;
      property IMG: TBITMAP read FIMG write FIMG;
      property ORDEM: integer read FORDEM write FORDEM;
      function Pesquisar(out erro: string): TFDQuery;
      function incluir(out erro: string):boolean;
      function Alterar(out erro: string):boolean;
      function Excluir(out erro: string):boolean;
  end;
implementation

{ grupos }

function grupos.Alterar(out erro: string): boolean;
var qy: TFDQuery;
begin
  try
    try
      qy := TFDQuery.Create(nil);
      qy.Connection := Fconexao;
      qy.Active:= false;
      qy.SQL.Clear;
      qy.SQL.Add('update grupos set grupo = :grupo, ordem = :ordem, img = :img ');
      qy.SQL.Add('where codGrupo = :codGrupo ;');
      qy.ParamByName('grupo').Value := GRUPO;
      qy.ParamByName('ordem').Value := ORDEM;
      qy.ParamByName('IMG').Assign(img);
      qy.ExecSQL;
      result:= true;
      erro := '';
    except on E:Exception do
      begin
        erro := 'Nao foi possivel alterar '+E.Message;
        result := false;
      end;

    end;
  finally
    qy.DisposeOf;
  end;
end;

constructor grupos.CrieObj(pConexao: TFDConnection);
begin
  FCONEXAO:= PConexao;
end;

function grupos.Excluir(out erro: string): boolean;
var qy: TFDQuery;

begin
try
  try
    qy:= TFDQuery.Create(nil);
    qy.Connection := FConexao;
    with qy do
    begin
      Active:= false;
      sql.Clear;
      sql.add('delete from grupos');
      sql.Add('where codgrupo = :codgrupo ;' );
      ParamByName('codgrupo').Value := CODGRUPO;
      ExecSQL;

    end;
    result:= true;
    erro:= '';
  except on E:Exception do
    begin
      erro := 'Nao foi possivel Excluir : '+E.Message;
      result := false;
    end;
  end;
finally
  qy.DisposeOf;
end;
end;

function grupos.incluir(out erro: string): boolean;
var qy: TFDQuery;
begin
try
  try
    qy:= TFDQuery.Create(nil);
    qy.Connection := FConexao;
    with qy do
    begin
      Active:= false;
      sql.Clear;
      sql.add('insert into grupos(grupo, ordem, img) values(grupo :grupo, ordem :ordem, img :img);');
      ParamByName('grupo').Value := GRUPO;
      ParamByName('ordem').Value := ORDEM;
      ParamByName('IMG').Assign(IMG);
      ExecSql;
    end;
    result:= true;
    erro:= '';
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

function grupos.Pesquisar(out erro: string): TFDQuery;
var qy: TFDQuery;
begin
  try
    qy:= TFDQuery.Create(nil);
    qy.Connection := FConexao;
    with qy do
    begin
      Active:= false;
      sql.Clear;
      sql.add('select * from grupos');
      sql.add('where 1 = 1');
      if CODGRUPO > 0 then
      begin
        sql.Add('and CODGRUPO = :CODGRUPO');
        ParamByName('CODGRUPO').Value := CODGRUPO;
      end
      else if length(GRUPO) > 0 then
      begin
        sql.Add('and GRUPO = :GRUPO');
        ParamByName('GRUPO').Value := GRUPO;
      end;
      sql.Add(' ;');
      Active := true;

    end;
    result := qy;
    erro := '';
  except on Ex:Exception do
    raise Exception.Create('Error Message'+Ex.Message);

  end;
end;

end.
