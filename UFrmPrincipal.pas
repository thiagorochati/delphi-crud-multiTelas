unit UFrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.Objects;

type
  TFrmPrincipal = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Button1: TButton;
    TabItem3: TTabItem;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    V: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses UFrmCliente;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCliente, FrmCliente);
  FrmCliente.Show;
end;

end.
