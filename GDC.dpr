program GDC;

uses
  Vcl.Forms,
  Principal in 'src\Principal.pas' {frmPrincipal},
  uDM in 'src\DM\uDM.pas' {DM: TDataModule},
  ViewCliente in 'src\Cliente\Cadastro\ViewCliente.pas' {frmCliente},
  VIACEP in 'src\ViaCEP\VIACEP.pas',
  ControllerCliente in 'src\Cliente\Cadastro\ControllerCliente.pas',
  ModelCliente in 'src\Cliente\Cadastro\ModelCliente.pas',
  ViewPesquisarCliente in 'src\Cliente\Pesquisar\ViewPesquisarCliente.pas' {frmPesquisarClientes},
  ModelPesquisarCliente in 'src\Cliente\Pesquisar\ModelPesquisarCliente.pas',
  ControllerPesquisarCliente in 'src\Cliente\Pesquisar\ControllerPesquisarCliente.pas',
  IViewPesquisarCliente in 'src\Cliente\Pesquisar\IViewPesquisarCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
