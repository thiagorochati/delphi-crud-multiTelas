unit UFrmCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Actions, FMX.ActnList, FMX.Layouts;

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
    VertCliente: TVertScrollBox;
    Image3: TImage;
    procedure Image1Click(Sender: TObject);
    procedure Rectangle7Click(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaCliente; //Ctrl + Shift + C
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.fmx}

uses UDMDados;

procedure TFrmCliente.AtualizaCliente;
begin
  //Responsável por atualizar os clientes cadastrados
  VertCliente.BeginUpdate;

  var i : integer;

  //Limpando todos os itens do VertScrollBox -> VertCliente
  for i := VertCliente.Content.ChildrenCount - 1 downto 0 do
    if VertCliente.Content.Children[i] is TFrame then
      TFrame(VertCliente.Content.Children[i]).DisposeOf;



end;

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
  //Validações para não deixar salvar sem preencher.
  if EditNome.Text = '' then
  begin
    ShowMessage('Preencha o nome');
    Exit;
  end;

  if EditEmail.Text = '' then
  begin
    ShowMessage('Preencha o email');
    Exit;
  end;

  if EditCPF.Text = '' then
  begin
    ShowMessage('Preencha o CPF');
    Exit;
  end;

  DMDados.QDados.Close;
  DMDados.QDados.SQL.Clear;
  DMDados.QDados.SQL.Add('INSERT INTO CLIENTE (NOME, EMAIL, CPF) ');
  DMDados.QDados.SQL.Add('VALUES (:NOME, :EMAIL, :CPF)');
  DMDados.QDados.ParamByName('NOME').Value  := EditNome.Text;
  DMDados.QDados.ParamByName('EMAIL').Value := EditEmail.Text;
  DMDados.QDados.ParamByName('CPF').Value   := EditCPF.Text;
  DMDados.QDados.ExecSQL;

  EditNome.Text  := '';
  EditEmail.Text := '';
  EditCPF.Text   := '';

  MudaAba.Tab := TabConsulta;
  MudaAba.ExecuteTarget(Self);
end;

procedure TFrmCliente.Rectangle7Click(Sender: TObject);
begin
  MudaAba.Tab := TabCadastro;
  MudaAba.ExecuteTarget(Self);
end;

end.
