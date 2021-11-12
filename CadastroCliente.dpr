program CadastroCliente;

uses
  System.StartUpCopy,
  FMX.Forms,
  uCadastroCliente in 'uCadastroCliente.pas' {frmCadastroCliente},
  uDM_Modulo in 'uDM_Modulo.pas' {dm_Modulo: TDataModule},
  uFormat in 'uFormat.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.CreateForm(Tdm_Modulo, dm_Modulo);
  Application.Run;
end.
