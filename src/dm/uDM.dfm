object DM: TDM
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=D:\Programas\CadastroPessoa\BaseDeDados\BaseDeDados.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 112
    Top = 64
  end
end
