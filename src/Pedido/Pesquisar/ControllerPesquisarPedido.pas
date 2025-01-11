unit ControllerPesquisarPedido;

interface

uses
  System.SysUtils, ModelPesquisarCliente, Data.DB, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls,Vcl.Mask,
  ModelPesquisarPedido,IViewPesquisarPedido;

type
  TPedidoController = class
  private
    FModel: TPedidoModel;
    FView: IPesquisarPedido;
  public
    constructor Create(AView: IPesquisarPedido);  // Recebe a interface da View
    destructor Destroy; override;
    procedure Pesquisar(const Filtro: string; const PorCodigo, PorNome: Boolean);
  end;


implementation

constructor TPedidoController.Create(AView: IPesquisarPedido);
begin
  FModel := TPedidoModel.Create;  // Cria a Model
  FView := AView;  // Armazena a refer�ncia da View atrav�s da interface
end;

destructor TPedidoController.Destroy;
begin
  FModel.Free;
  inherited;
end;

procedure TPedidoController.Pesquisar(const Filtro: string; const PorCodigo, PorNome: Boolean);
var
  DataSet: TDataSet;
begin
  // Chama a Model para realizar a pesquisa
  DataSet := FModel.Pesquisar(Filtro, PorCodigo, PorNome);

  // A View ser� respons�vel por chamar esse m�todo para atualizar a grid
  if Assigned(FView) then
    FView.AtualizarGrid(DataSet);  // Chama a fun��o de atualiza��o da Grid na View
end;


end.

