unit IViewPesquisarProdutos;

interface

uses
  Data.DB;  // Importante para o TDataSet

 type
  IPesquisarProdutos = interface
  ['{C58E40D6-ABE4-4865-B3E8-9FF5C83E80D8}'] // ID �nico para a interface
    procedure AtualizarGrid(ADataSet: TDataSet);  // Defina o m�todo que a View implementar�
  end;

implementation

end.
