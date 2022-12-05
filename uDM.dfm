object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 448
  Width = 431
  object conexao: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      
        'Database=C:\Users\PDIVI-085\Desktop\Servidor Gabriel\Cod\2 Semes' +
        'tre 2022\Prog. Web Mobile\Programa Atualizado\WBM_2022-12-04_GAB' +
        'RIEL_AUGUSTO_HANKE\Banco\webMobile.db'
      'DriverID=SQLite')
    Connected = True
    Left = 144
    Top = 312
  end
end
