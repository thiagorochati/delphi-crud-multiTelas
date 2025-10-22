unit UFrmCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Actions, FMX.ActnList;

type
  TFrmCliente = class(TForm)
    TabControl1: TTabControl;
    TabConsulta: TTabItem;
    TabCadastro: TTabItem;
    Rectangle1: TRectangle;
    Image1: TImage;
    Rectangle2: TRectangle;
    Image2: TImage;
    Rectangle3: TRectangle;
    Label1: TLabel;
    EditNome: TEdit;
    Rectangle4: TRectangle;
    Label2: TLabel;
    EditCPF: TEdit;
    Rectangle5: TRectangle;
    Label3: TLabel;
    EditEmail: TEdit;
    Rectangle6: TRectangle;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Rectangle7: TRectangle;
    Label7: TLabel;
    ActionList1: TActionList;
    MudaAba: TChangeTabAction;
    procedure Image1Click(Sender: TObject);
    procedure Rectangle7Click(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.fmx}

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  //Hora de abrir a tela
  TabControl1.ActiveTab := TabConsulta;
  TabControl1.TabPosition := TTabPosition.None;
end;

procedure TFrmCliente.Image1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCliente.Image2Click(Sender: TObject);
begin
  MudaAba.Tab := TabConsulta;
  MudaAba.ExecuteTarget(Self);
end;

procedure TFrmCliente.Rectangle6Click(Sender: TObject);
begin
  MudaAba.Tab := TabConsulta;
  MudaAba.ExecuteTarget(Self);
end;

procedure TFrmCliente.Rectangle7Click(Sender: TObject);
begin
  MudaAba.Tab := TabCadastro;
  MudaAba.ExecuteTarget(Self);
end;

end.
