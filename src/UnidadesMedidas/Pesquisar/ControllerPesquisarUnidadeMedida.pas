unit ControllerPesquisarUnidadeMedida;

interface

uses
  System.SysUtils, ModelPesquisarCliente, Data.DB, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls,Vcl.Mask,
  ModelPesquisarUnidadeMedida,IViewPesquisarUnidadeMedida;  // Importa a interface

type
  TUnidadeMedidaController = class
  private
    FModel: TUnidadeMedidaModel;
    FView: IPesquisarUnidadeMedida;
  public
    constructor Create(AView: IPesquisarUnidadeMedida);  // Recebe a interface da View
    destructor Destroy; override;
    procedure Pesquisar(const Filtro: string; const PorCodigo, PorNome,PorSigla: Boolean);

  end;


implementation

constructor TUnidadeMedidaController.Create(AView: IPesquisarUnidadeMedida);
begin
  FModel := TUnidadeMedidaModel.Create;  // Cria a Model
  FView := AView;  // Armazena a refer�ncia da View atrav�s da interface
end;

destructor TUnidadeMedidaController.Destroy;
begin
  FModel.Free;
  inherited;
end;

procedure TUnidadeMedidaController.Pesquisar(const Filtro: string; const PorCodigo, PorNome,PorSigla: Boolean);
var
  DataSet: TDataSet;
begin
  // Chama a Model para realizar a pesquisa
  DataSet := FModel.Pesquisar(Filtro, PorCodigo, PorNome,PorSigla);

  // A View ser� respons�vel por chamar esse m�todo para atualizar a grid
  if Assigned(FView) then
    FView.AtualizarGrid(DataSet);  // Chama a fun��o de atualiza��o da Grid na View
end;




end.

