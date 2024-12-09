unit ModelCliente;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Error, uDM;

type
  TClienteModel = class
  private
    FID: Integer;
    FNomeCompleto: string;
    FCPF: string;
    FEndereco: string;
    FBairro: string;
    FCidade: string;
    FUF: string;
    FCEP: string;
    FTelefone: string;
    FEmail: string;
    FDataNascimento: TDateTime; // Alterado para TDateTime para manipulação precisa de datas
    FNumero: string;
    FComplemento: string;
    FTipoPessoa: string;
    FRG: string;
    FFisicaJuridica: string;

    procedure SetID(const Value: Integer);
    procedure SetNomeCompleto(const Value: string);
    procedure SetCPF(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetBairro(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetUF(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetDataNascimento(const Value: TDateTime); // Alterado para TDateTime
    procedure SetNumero(const Value: string);
    procedure SetComplemento(const Value: string);

    procedure SetTipoPessoa(const Value: string);
    procedure setRG(const Value: string);
    procedure SetFisicaJuridica(const Value: string);


  public
    property ID: Integer read FID write SetID;
    property NomeCompleto: string read FNomeCompleto write SetNomeCompleto;
    property TipoPessoa: string read FTipoPessoa write SetTipoPessoa;
    property FisicaJuridica: string read FFisicaJuridica write SetFisicaJuridica;
    property CPF: string read FCPF write SetCPF;
    property RG: string read FRG write setRG;
    property Endereco: string read FEndereco write SetEndereco;
    property Bairro: string read FBairro write SetBairro;
    property Cidade: string read FCidade write SetCidade;
    property UF: string read FUF write SetUF;
    property CEP: string read FCEP write SetCEP;
    property Telefone: string read FTelefone write SetTelefone;
    property Email: string read FEmail write SetEmail;
    property DataNascimento: TDateTime read FDataNascimento write SetDataNascimento;
    property Numero: string read FNumero write SetNumero;
    property Complemento: string read FComplemento write SetComplemento;

    function BuscarPorID(const ClienteID: Integer): TClienteModel;
    function SalvarCliente(out NovoID: Integer): Boolean;
    function DeletarCliente: Boolean;
    function AtualizarCliente: Boolean;
  end;

implementation

{ TClienteModel }

procedure TClienteModel.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TClienteModel.SetNomeCompleto(const Value: string);
begin
  FNomeCompleto := Value;
end;

procedure TClienteModel.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TClienteModel.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TClienteModel.SetFisicaJuridica(const Value: string);
begin
  FFisicaJuridica := Value;
end;

procedure TClienteModel.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TClienteModel.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TClienteModel.SetUF(const Value: string);
begin
  FUF := Value;
end;

procedure TClienteModel.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TClienteModel.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TClienteModel.SetTipoPessoa(const Value: string);
begin
  FTipoPessoa := Value;
end;

procedure TClienteModel.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TClienteModel.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
end;

procedure TClienteModel.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TClienteModel.setRG(const Value: string);
begin
  FRG := Value;
end;

procedure TClienteModel.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

function TClienteModel.SalvarCliente(out NovoID: Integer): Boolean;
var
  Query: TFDQuery;
  LastIDQuery: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  LastIDQuery := TFDQuery.Create(nil);
  try
    Query.Connection := DM.Conexao;

    Query.SQL.Text := 'INSERT INTO Cliente (NomeCompleto, FisicaJuridica, TipoPessoa, CPF, RG, Endereco, Bairro, Cidade, UF, CEP, Telefone, Email, DataNascimento, Numero, Complemento) ' +
                      'VALUES (:NomeCompleto, :FisicaJuridica, :TipoPessoa, :CPF, :RG, :Endereco, :Bairro, :Cidade, :UF, :CEP, :Telefone, :Email, :DataNascimento, :Numero, :Complemento)';
    Query.ParamByName('NomeCompleto').AsString := FNomeCompleto;
    Query.ParamByName('FisicaJuridica').AsString := FFisicaJuridica;
    Query.ParamByName('TipoPessoa').AsString := FTipoPessoa;
    Query.ParamByName('CPF').AsString := FCPF;
    Query.ParamByName('RG').AsString := FRG;
    Query.ParamByName('Endereco').AsString := FEndereco;
    Query.ParamByName('Bairro').AsString := FBairro;
    Query.ParamByName('Cidade').AsString := FCidade;
    Query.ParamByName('UF').AsString := FUF;
    Query.ParamByName('CEP').AsString := FCEP;
    Query.ParamByName('Telefone').AsString := FTelefone;
    Query.ParamByName('Email').AsString := FEmail;
    Query.ParamByName('DataNascimento').AsDateTime := FDataNascimento;
    Query.ParamByName('Numero').AsString := FNumero;
    Query.ParamByName('Complemento').AsString := FComplemento;

    try
      Query.ExecSQL;

      // Obter o último ID gerado
      LastIDQuery.Connection := DM.Conexao;
      LastIDQuery.SQL.Text := 'SELECT last_insert_rowid() AS LastID';
      LastIDQuery.Open;

      if not LastIDQuery.IsEmpty then
      begin
        NovoID := LastIDQuery.FieldByName('LastID').AsInteger;
        Result := True;
      end;

    except
      on E: EFDException do
      begin
        if Pos('UNIQUE constraint failed', E.Message) > 0 then
          raise Exception.Create('Este CPF já está cadastrado no sistema. Por favor, insira um CPF diferente.')
        else
          raise Exception.Create('Erro ao salvar o cliente: ' + E.Message);
      end;
      on E: Exception do
        raise Exception.Create('Erro ao salvar o cliente: ' + E.Message);
    end;
  finally
    Query.Free;
    LastIDQuery.Free;
  end;
end;

function TClienteModel.DeletarCliente: Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.Conexao;
    Query.SQL.Text := 'DELETE FROM Cliente WHERE ID = :ID';
    Query.ParamByName('ID').AsInteger := FID;

    try
      Query.ExecSQL;
      Result := True;
    except
      on E: Exception do
        raise Exception.Create('Erro ao deletar cliente: ' + E.Message);
    end;
  finally
    Query.Free;
  end;
end;

function TClienteModel.AtualizarCliente: Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.Conexao;
    Query.SQL.Text := 'UPDATE Cliente SET NomeCompleto = :NomeCompleto, FisicaJuridica = :FisicaJuridica, ' +
                      'TipoPessoa = :TipoPessoa, CPF = :CPF, RG = :RG, Endereco = :Endereco, Bairro = :Bairro, ' +
                      'Cidade = :Cidade, UF = :UF, CEP = :CEP, Telefone = :Telefone, Email = :Email, ' +
                      'DataNascimento = :DataNascimento, Numero = :Numero, Complemento = :Complemento ' +
                      'WHERE ID = :ID';
    Query.ParamByName('NomeCompleto').AsString := FNomeCompleto;
    Query.ParamByName('FisicaJuridica').AsString := FFisicaJuridica;
    Query.ParamByName('TipoPessoa').AsString := FTipoPessoa;
    Query.ParamByName('CPF').AsString := FCPF;
    Query.ParamByName('RG').AsString := FRG;
    Query.ParamByName('Endereco').AsString := FEndereco;
    Query.ParamByName('Bairro').AsString := FBairro;
    Query.ParamByName('Cidade').AsString := FCidade;
    Query.ParamByName('UF').AsString := FUF;
    Query.ParamByName('CEP').AsString := FCEP;
    Query.ParamByName('Telefone').AsString := FTelefone;
    Query.ParamByName('Email').AsString := FEmail;
    Query.ParamByName('DataNascimento').AsDateTime := FDataNascimento;
    Query.ParamByName('Numero').AsString := FNumero;
    Query.ParamByName('Complemento').AsString := FComplemento;
    Query.ParamByName('ID').AsInteger := FID;

    try
      Query.ExecSQL;
      Result := True;
    except
      on E: Exception do
        raise Exception.Create('Erro ao atualizar o cliente: ' + E.Message);
    end;
  finally
    Query.Free;
  end;
end;


function TClienteModel.BuscarPorID(const ClienteID: Integer): TClienteModel;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM.Conexao;  // Supondo que DM.Conexao seja a conexão com o banco de dados
    Query.SQL.Text := 'SELECT * FROM Cliente WHERE id = :ID';
    Query.ParamByName('ID').AsInteger := ClienteID;
    Query.Open;

    if not Query.Eof then
    begin
      // Preenche o objeto TClienteModel com os dados recuperados da consulta
      Result := TClienteModel.Create;
      Result.ID := Query.FieldByName('id').AsInteger;
      Result.NomeCompleto := Query.FieldByName('NomeCompleto').AsString;
      Result.Email := Query.FieldByName('Email').AsString;
      Result.Telefone := Query.FieldByName('Telefone').AsString;
      Result.CPF := Query.FieldByName('CPF').AsString;
      Result.RG := Query.FieldByName('RG').AsString;
      Result.FFisicaJuridica := Query.FieldByName('FisicaJuridica').AsString;
      Result.TipoPessoa := Query.FieldByName('TipoPessoa').AsString;
      Result.Endereco := Query.FieldByName('Endereco').AsString;
      Result.Bairro := Query.FieldByName('Bairro').AsString;
      Result.Cidade := Query.FieldByName('Cidade').AsString;
      Result.UF := Query.FieldByName('UF').AsString;
      Result.CEP := Query.FieldByName('CEP').AsString;
      Result.DataNascimento := Query.FieldByName('DataNascimento').AsDateTime;
      Result.Numero := Query.FieldByName('Numero').AsString;
      Result.Complemento := Query.FieldByName('Complemento').AsString;

    end
    else
    begin
      Result := nil;  // Caso não encontre o cliente
    end;
  except
    Query.Free;
    raise;
  end;
end;


end.
