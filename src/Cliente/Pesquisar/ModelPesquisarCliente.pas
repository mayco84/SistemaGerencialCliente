unit ModelPesquisarCliente;

interface

uses
  System.SysUtils, Data.DB, FireDAC.Comp.Client, uDM;

type
  TClienteModel = class
  public
    function PesquisarClientes(const Filtro: string; const PorCodigo, PorNome,PorEMail: Boolean): TDataSet;
  end;

implementation

function TClienteModel.PesquisarClientes(const Filtro: string; const PorCodigo, PorNome,PorEMail: Boolean): TDataSet;
var
  Query: TFDQuery;
begin
 Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.Conexao;

    // Monta a consulta SQL inicial
    Query.SQL.Text := 'SELECT id, NomeCompleto, CPF, Telefone, Email FROM Cliente WHERE 1=1';

    // Adiciona condições baseadas nos filtros
    if PorCodigo then
      Query.SQL.Add('AND id LIKE :FiltroCodigo');
    if PorNome then
      Query.SQL.Add('AND NomeCompleto LIKE :FiltroNome');
    if PorEmail then
      Query.SQL.Add('AND Email LIKE :FiltroEmail');

    // Define os parâmetros para cada filtro aplicado
    if PorCodigo then
      Query.ParamByName('FiltroCodigo').AsString := '%' + Filtro + '%';
    if PorNome then
      Query.ParamByName('FiltroNome').AsString := '%' + Filtro + '%';
    if PorEmail then
      Query.ParamByName('FiltroEmail').AsString := '%' + Filtro + '%';

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

