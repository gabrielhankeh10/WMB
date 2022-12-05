unit uUsuarios;

interface
  uses FireDac.comp.Client, data.DB, FMX.Graphics, system.SysUtils;
  type Usuarios = class
    private
      FCODUSU: integer;
      FUSUARIO: string;
      FEMAIL: string;
      FSENHA: string;
      FLOGADO: string;
    protected
      FConexao: TFDConnection;
    public
      constructor CrieObj(pConexao: TFDConnection);
      property CODUSU: integer read FCODUSU write FCODUSU;
      property USUARIO: string read FUSUARIO write FUSUARIO;
      property EMAIL: string read FEMAIL write FEMAIL;
      property SENHA: string read FSENHA write FSENHA;
      property LOGADO: string read FLOGADO write FLOGADO;
      function Pesquisar(out erro: string): TFDQuery;
      function incluir(out erro: string):boolean;
      function Alterar(out erro: string):boolean;
      function Excluir(out erro: string):boolean;
  end;
implementation

{ Usuarios }

function Usuarios.Alterar(out erro: string): boolean;
var qy : TFDQuery;
begin
  try
    try
      qy := TFDQuery.Create(nil);
      qy.Connection := Fconexao;
      qy.Active := false;
      qy.SQL.Clear;
      qy.sql.Add('update usuarios set usuario :usuario, email :email, senha :senha, logado :logado');
      qy.sql.Add('where codusu :codusu ;');
      qy.ParamByName('usuario').Value := USUARIO;
      qy.ParamByName('email').Value := EMAIL;
      qy.ParamByName('senha').Value := SENHA;
      qy.ParamByName('logado').Value := LOGADO;
      qy.ExecSQL;
      result:= true;
      erro := ''
    except on E:Exception do
      begin
        erro := 'Nao foi possivel alterar '+e.Message;
        result := false;
      end;
    end;
    finally
      qy.DisposeOf;
    end;
end;


constructor Usuarios.CrieObj(pConexao: TFDConnection);
begin
  FCONEXAO := pConexao;
end;

function Usuarios.Excluir(out erro: string): boolean;
var qy: TFDQuery;
begin
  try
    try
      qy:= TFDQuery.Create(nil);
      qy.Connection := FConexao;
      with qy do
      begin
        Active := false;
        sql.Clear;
        sql.Add('delete from usuarios');
        sql.Add('where codusu :codusu ;');
        ParamByName('codusu').Value := CODUSU;
        ExecSql;
      end;
      result := true;
      erro := '';
    except on E:Exception do
      begin
        erro := 'Nao foi possivel Excluir: '+e.Message;
        result := false;
      end;
    end;
  finally
    qy.DisposeOf;
  end;
end;

function Usuarios.incluir(out erro: string): boolean;
var qy: TFDQuery;
begin
  try
    try
      qy:= TFDQuery.Create(nil);
      qy.Connection := FConexao;
      with qy do
      begin
        Active := false;
        sql.Clear;
        sql.Add('insert into usuarios(usuario, email, senha, logado) values (usuario :usuario, email :email, senha :senha, logado :logado);');
        ParamByName('usuario').Value := USUARIO;
        ParamByName('email').Value := EMAIL;
        ParamByName('senha').Value := SENHA;
        ParamByName('logado').Value := LOGADO;
        ExecSQL;
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

function Usuarios.Pesquisar(out erro: string): TFDQuery;
var qy: TFDQuery;
begin
  try
    qy:= TFDQuery.Create(nil);
    qy.Connection := FConexao;
    with qy do
    begin
      Active:= false;
      sql.Clear;
      sql.add('select * from usuaruis');
      sql.add('where 1 = 1');
      if CODUSU > 0 then
      begin
        sql.Add('and CODUSU :CODUSU');
        ParamByName('codusu').Value := CODUSU;
      end
      else if length(USUARIO) > 0 then
      begin
        sql.Add('and USUARIO :USUARIO');
        ParamByName('usuario').Value := USUARIO;
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
