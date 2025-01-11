unit ViewPesquisarProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, ViewProdutos,IViewPesquisarProdutos,ControllerPesquisarProdutos;

type
  TfrmPesquisarProdutos = class(TForm, IPesquisarProdutos)  // Implementa a interface
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    edtPesquisar: TEdit;
    dbgProdutos: TDBGrid;
    dtsProdutos: TDataSource;
    rgpOpcoes: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FController: TProdutosController;  // Referência para a Controller
    procedure AtualizarGrid(ADataSet: TDataSet);  // Implementação do método da interface
  public
    { Public declarations }
  end;

var
  frmPesquisarProdutos: TfrmPesquisarProdutos;

implementation

{$R *.dfm}

procedure TfrmPesquisarProdutos.FormCreate(Sender: TObject);
begin
  FController := TProdutosController.Create(Self);  // Passa a referência da View (como interface) para a Controller
end;

procedure TfrmPesquisarProdutos.FormDestroy(Sender: TObject);
begin
  FController.Free;  // Libera a memória da Controller
end;

procedure TfrmPesquisarProdutos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      close;
  end;
end;

procedure TfrmPesquisarProdutos.btnNovoClick(Sender: TObject);
var
  lTela : TfrmProdutos;
begin
  lTela := TfrmProdutos.Create(nil);
  try
    lTela.ShowModal;
  finally
    FreeAndNil(lTela)
  end;
end;

procedure TfrmPesquisarProdutos.btnPesquisarClick(Sender: TObject);
var
  Filtro: string;
  PorCodigo, PorNome: Boolean;
begin
  Filtro := edtPesquisar.Text;
  PorCodigo := False;
  PorNome := False;

  case rgpOpcoes.ItemIndex of
    0: PorCodigo := True;
    1: PorNome := True;
  end;

  // Chama a Controller para buscar os dados
  FController.Pesquisar(Filtro, PorCodigo, PorNome);
end;

procedure TfrmPesquisarProdutos.dbgProdutosDblClick(Sender: TObject);
var
  ID: Integer;
  lTela: TfrmProdutos;
begin
  if Not Assigned(dtsProdutos.DataSet) then
    Exit;

  // Certifica-se de que há um registro selecionado
  if not dtsProdutos.DataSet.IsEmpty then
  begin
    if dtsProdutos.DataSet.FieldByName('id').AsInteger <=0 then
    begin
      MessageDlg('É necessário selecionar um item para editar.',TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
      Exit;
    end;

    ID := dtsProdutos.DataSet.FieldByName('id').AsInteger;

    // Cria o formulário de cliente e carrega os dados
    lTela := TfrmProdutos.Create(nil);
    try
      lTela.pnlDados.Enabled := True;
      // Passa o ID do cliente para o formulário
      lTela.CarregarPorID(ID); // Carrega os dados com o ID do cliente

      lTela.ShowModal; // Exibe o formulário modal
    finally
      lTela.Free;  // Libera o formulário após o uso
    end;
  end;
end;

procedure TfrmPesquisarProdutos.AtualizarGrid(ADataSet: TDataSet);
begin
  // Atualiza o DataSource com o novo dataset
  dtsProdutos.DataSet := ADataSet;

  // Atualiza a grid com os dados corretos
  dbgProdutos.Columns[0].FieldName := 'id';
  dbgProdutos.Columns[0].Title.Caption := 'ID';
  dbgProdutos.Columns[1].FieldName := 'Descrição';
  dbgProdutos.Columns[1].Title.Caption := 'Descrição';

end;

end.

