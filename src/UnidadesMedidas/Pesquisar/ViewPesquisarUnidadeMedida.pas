unit ViewPesquisarUnidadeMedida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, ViewUnidadeMedida,IViewPesquisarUnidadeMedida,ControllerPesquisarUnidadeMedida;

type
  TfrmPesquisarUnidadeMedida = class(TForm, IPesquisarUnidadeMedida)  // Implementa a interface
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    edtPesquisar: TEdit;
    dbgClientes: TDBGrid;
    dtsCliente: TDataSource;
    rgpOpcoes: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dbgClientesDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FController: TUnidadeMedidaController;  // Referência para a Controller
    procedure AtualizarGrid(ADataSet: TDataSet);  // Implementação do método da interface
  public
    { Public declarations }
  end;

var
  frmPesquisarUnidadeMedida: TfrmPesquisarUnidadeMedida;

implementation

{$R *.dfm}

procedure TfrmPesquisarUnidadeMedida.FormCreate(Sender: TObject);
begin
  FController := TUnidadeMedidaController.Create(Self);  // Passa a referência da View (como interface) para a Controller
end;

procedure TfrmPesquisarUnidadeMedida.FormDestroy(Sender: TObject);
begin
  FController.Free;  // Libera a memória da Controller
end;

procedure TfrmPesquisarUnidadeMedida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      close;
  end;
end;

procedure TfrmPesquisarUnidadeMedida.btnNovoClick(Sender: TObject);
var
  lTelaCliente : TfrmUnidadeMedida;
begin
  lTelaCliente := TfrmUnidadeMedida.Create(nil);
  try
    lTelaCliente.ShowModal;
  finally
    FreeAndNil(lTelaCliente)
  end;
end;

procedure TfrmPesquisarUnidadeMedida.btnPesquisarClick(Sender: TObject);
var
  Filtro: string;
  PorCodigo, PorNome,PorSigla: Boolean;
begin
  Filtro := edtPesquisar.Text;
  PorCodigo := False;
  PorNome := False;
  PorSigla := False;

  case rgpOpcoes.ItemIndex of
    0: PorCodigo := True;
    1: PorNome := True;
    2: PorSigla := True;
  end;

  // Chama a Controller para buscar os dados
  FController.Pesquisar(Filtro, PorCodigo, PorNome,PorSigla);
end;

procedure TfrmPesquisarUnidadeMedida.dbgClientesDblClick(Sender: TObject);
var
  ClienteID: Integer;
  frmCliente: TfrmUnidadeMedida;
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
    frmCliente := TfrmUnidadeMedida.Create(nil);
    try
      frmCliente.pnlDados.Enabled := True;
      // Passa o ID do cliente para o formulário
      frmCliente.CarregarPorID(ClienteID); // Carrega os dados com o ID do cliente

      frmCliente.ShowModal; // Exibe o formulário modal
    finally
      frmCliente.Free;  // Libera o formulário após o uso
    end;
  end;
end;

procedure TfrmPesquisarUnidadeMedida.AtualizarGrid(ADataSet: TDataSet);
begin
  // Atualiza o DataSource com o novo dataset
  dtsCliente.DataSet := ADataSet;

  // Atualiza a grid com os dados corretos
  dbgClientes.Columns[0].FieldName := 'id';
  dbgClientes.Columns[0].Title.Caption := 'ID';
  dbgClientes.Columns[1].FieldName := 'Descrição';
  dbgClientes.Columns[1].Title.Caption := 'Descrição';
  dbgClientes.Columns[2].FieldName := 'PorSigla';
  dbgClientes.Columns[2].Title.Caption := 'Sigla';
end;

end.

