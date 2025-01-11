unit IViewPesquisarUnidadeMedida;

interface

uses
  Data.DB;  // Importante para o TDataSet

 type
  IPesquisarUnidadeMedida = interface
   ['{4B1DF01B-E849-4A40-ADBB-A664F7416225}'] // ID �nico para a interface
    procedure AtualizarGrid(ADataSet: TDataSet);  // Defina o m�todo que a View implementar�
  end;

implementation

end.
