unit ModelPesquisarUnidadeMedida;

interface

uses
  System.SysUtils, Data.DB, FireDAC.Comp.Client, uDM;

type
  TUnidadeMedidaModel = class
  public
    function Pesquisar(const Filtro: string; const PorCodigo, PorNome,PorSigla: Boolean): TDataSet;
  end;

implementation

function TUnidadeMedidaModel.Pesquisar(const Filtro: string; const PorCodigo, PorNome,PorSigla: Boolean): TDataSet;
var
  Query: TFDQuery;
begin
 Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.Conexao;

    // Monta a consulta SQL inicial
    Query.SQL.Text := 'SELECT id, DescricaoUnidadeMedida, SiglaUnidadeMedida FROM UnidadeMedida WHERE 1=1';

    // Adiciona condições baseadas nos filtros  e os parâmetros para cada filtro aplicado
    if PorCodigo then
    begin
      Query.SQL.Add('AND id LIKE :FiltroCodigo');
      Query.ParamByName('FiltroCodigo').AsString := '%' + Filtro + '%';
    end;

    if PorNome then
    begin
      Query.SQL.Add('AND DescricaoUnidadeMedida LIKE :FiltroNome');
      Query.ParamByName('DescricaoUnidadeMedida').AsString := '%' + Filtro + '%';
    end;

    if PorSigla then
    begin
      Query.SQL.Add('AND SiglaUnidadeMedida LIKE :FiltroEmail');
      Query.ParamByName('SiglaUnidadeMedida').AsString := '%' + Filtro + '%';
    end;

    // Executa a consulta
    Query.Open;

    // Retorna o dataset com os dados
    Result := Query;
  except
    on E: Exception do
    begin
      Query.Free; // Libera a query somente em caso de erro
      raise;      // Relança a exceção para tratamento externo
    end;
  end;
  {//*
   A destruição da Query ocorre apenas no bloco except se houver uma exceção. Caso contrário,
    a Query é retornada como Result e sua responsabilidade de liberar passa para quem chamou a função.
  *//}
end;

end.

