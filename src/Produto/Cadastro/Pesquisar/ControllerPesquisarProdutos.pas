unit ControllerPesquisarProdutos;

interface

uses
  System.SysUtils, ModelPesquisarCliente, Data.DB, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls,Vcl.Mask,
  ModelPesquisarProdutos,IViewPesquisarProdutos;

type
  TProdutosController = class
  private
    FModel: TProdutosModel;
    FView: IPesquisarProdutos;
  public
    constructor Create(AView: IPesquisarProdutos);  // Recebe a interface da View
    destructor Destroy; override;
    procedure Pesquisar(const Filtro: string; const PorCodigo, PorNome: Boolean);

  end;


implementation

constructor TProdutosController.Create(AView: IPesquisarProdutos);
begin
  FModel := TProdutosModel.Create;  // Cria a Model
  FView := AView;  // Armazena a refer�ncia da View atrav�s da interface
end;

destructor TProdutosController.Destroy;
begin
  FModel.Free;
  inherited;
end;

procedure TProdutosController.Pesquisar(const Filtro: string; const PorCodigo, PorNome: Boolean);
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

