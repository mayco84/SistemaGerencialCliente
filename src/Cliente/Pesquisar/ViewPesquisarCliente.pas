unit ViewPesquisarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, ControllerPesquisarCliente, IViewPesquisarCliente, ViewCliente;

type
  TfrmPesquisarClientes = class(TForm, IViewPesquisarClientes)  // Implementa a interface
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    edtPesquisar: TEdit;
    gbxOpcoes: TGroupBox;
    cbxCodigo: TCheckBox;
    cbxNome: TCheckBox;
    dbgClientes: TDBGrid;
    dtsCliente: TDataSource;
    cbxEMail: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dbgClientesDblClick(Sender: TObject);
  private
    FController: TClienteController;  // Referência para a Controller
    procedure AtualizarGrid(ADataSet: TDataSet);  // Implementação do método da interface
  public
    { Public declarations }
  end;

var
  frmPesquisarClientes: TfrmPesquisarClientes;

implementation

{$R *.dfm}

procedure TfrmPesquisarClientes.FormCreate(Sender: TObject);
begin
  FController := TClienteController.Create(Self);  // Passa a referência da View (como interface) para a Controller
end;

procedure TfrmPesquisarClientes.FormDestroy(Sender: TObject);
begin
  FController.Free;  // Libera a memória da Controller
end;

procedure TfrmPesquisarClientes.btnNovoClick(Sender: TObject);
var
  lTelaCliente : TfrmCliente;
begin
  lTelaCliente := TfrmCliente.Create(nil);
  try
    lTelaCliente.ShowModal;
  finally
    FreeAndNil(lTelaCliente)
  end;
end;

procedure TfrmPesquisarClientes.btnPesquisarClick(Sender: TObject);
var
  Filtro: string;
  PorCodigo, PorNome,EMail: Boolean;
begin
  Filtro := edtPesquisar.Text;
  PorCodigo := cbxCodigo.Checked;
  PorNome := cbxNome.Checked;
  EMail := cbxEMail.Checked;


  // Chama a Controller para buscar os dados
  FController.PesquisarClientes(Filtro, PorCodigo, PorNome,EMail);
end;

procedure TfrmPesquisarClientes.dbgClientesDblClick(Sender: TObject);
var
  ClienteID: Integer;
  frmCliente: TfrmCliente;
begin
  if Not Assigned(dtsCliente.DataSet) then
    Exit;

  // Certifica-se de que há um registro selecionado
  if not dtsCliente.DataSet.IsEmpty then
  begin
    if dtsCliente.DataSet.FieldByName('id').AsInteger <=0 then
    begin
      MessageDlg('É necessário selecionar um item para editar.',TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
      Exit;
    end;

    ClienteID := dtsCliente.DataSet.FieldByName('id').AsInteger;

    // Cria o formulário de cliente e carrega os dados
    frmCliente := TfrmCliente.Create(nil);
    try
      frmCliente.pnlDados.Enabled := True;
      // Passa o ID do cliente para o formulário
      frmCliente.CarregarClientePorID(ClienteID); // Carrega os dados com o ID do cliente

      frmCliente.ShowModal; // Exibe o formulário modal
    finally
      frmCliente.Free;  // Libera o formulário após o uso
    end;
  end;
end;

procedure TfrmPesquisarClientes.AtualizarGrid(ADataSet: TDataSet);
begin
  // Atualiza o DataSource com o novo dataset
  dtsCliente.DataSet := ADataSet;

  // Atualiza a grid com os dados corretos
  dbgClientes.Columns[0].FieldName := 'id';
  dbgClientes.Columns[1].FieldName := 'Nome Completo';
  dbgClientes.Columns[2].FieldName := 'CPF';
  dbgClientes.Columns[3].FieldName := 'Telefone';
  dbgClientes.Columns[4].FieldName := 'Email';
end;

end.

