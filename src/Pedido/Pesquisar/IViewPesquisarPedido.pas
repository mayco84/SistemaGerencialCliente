unit IViewPesquisarPedido;

interface

uses
  Data.DB;  // Importante para o TDataSet

 type
  IPesquisarPedido = interface
  ['{59D60D8E-EBBD-4D67-9035-70EE40A585B2}'] // ID �nico para a interface
    procedure AtualizarGrid(ADataSet: TDataSet);  // Defina o m�todo que a View implementar�
  end;

implementation

end.
