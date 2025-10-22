program MultiTelas;

uses
  System.StartUpCopy,
  FMX.Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {FrmPrincipal},
  UFrmCliente in 'UFrmCliente.pas' {FrmCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmCliente, FrmCliente);
  Application.Run;
end.
