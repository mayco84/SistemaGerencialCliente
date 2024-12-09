unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Buttons,ViewCliente,ViewPesquisarCliente;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    btnCadastro: TSpeedButton;
    popCadastros: TPopupMenu;
    Clientes1: TMenuItem;
    procedure btnCadastroClick(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
  private
    procedure menuPersonalizado(Botao: TSpeedButton; Pop: TPopupMenu);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCadastroClick(Sender: TObject);
begin
    menuPersonalizado(btnCadastro,popCadastros);
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
var
  lTelaCliente : TfrmPesquisarClientes;
begin
  lTelaCliente := TfrmPesquisarClientes.Create(nil);
  try
    lTelaCliente.ShowModal;
  finally
    FreeAndNil(lTelaCliente)
  end;
end;

procedure TfrmPrincipal.menuPersonalizado(Botao: TSpeedButton; Pop: TPopupMenu);
var
  vPonto: TPoint;
begin
  vPonto := Botao.ClientToScreen(Point(0, Botao.Height));
  Pop.Popup(vPonto.X+100, vPonto.Y-15);
end;

end.
