unit UFrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.Objects,
  FMX.Layouts, FMX.Edit, System.Actions, FMX.ActnList, FMX.DialogService;

type
  TFrmPrincipal = class(TForm)
    TabControl1: TTabControl;
    TabLogin: TTabItem;
    TabMenu: TTabItem;
    TabItem3: TTabItem;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    V: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle7: TRectangle;
    EditLogin: TEdit;
    Layout3: TLayout;
    Rectangle8: TRectangle;
    EditSenha: TEdit;
    Rectangle9: TRectangle;
    Label4: TLabel;
    Image1: TImage;
    ActionList1: TActionList;
    MudaAba: TChangeTabAction;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Image2: TImage;
    Label6: TLabel;
    Layout4: TLayout;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Label1: TLabel;
    Image3: TImage;
    procedure Rectangle9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Rectangle12Click(Sender: TObject);
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

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  TabControl1.ActiveTab := TabLogin;
  TabControl1.TabPosition := TTabPosition.None;
end;

procedure TFrmPrincipal.Image2Click(Sender: TObject);
begin
  TDialogService.MessageDialog(
    'Deseja realmente sair?',         // AMessage: A mensagem a ser exibida
    TMsgDlgType.mtConfirmation,          // ADialogType: Tipo de diálogo (ícone de confirmação)
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], // AButtons: Botões a serem exibidos (Sim e Não)
    TMsgDlgBtn.mbNo,                     // ADefaultButton: Botão padrão focado (opcional)
    0,                                   // AHelpContext: Contexto de ajuda (opcional, use 0)
    procedure(const AResult: TModalResult) // ACloseDialogProc: Método anônimo (callback)
    begin
      // Este bloco de código será executado APÓS o usuário clicar em um botão
      if AResult = mrYes then
      begin
        // Código para quando o usuário clicar em 'Sim'
        EditLogin.Text := '';
        EditSenha.Text := '';

        MudaAba.Tab := TabLogin;
        MudaAba.ExecuteTarget(Self);
      end
    end
  );
end;

procedure TFrmPrincipal.Rectangle12Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCliente, FrmCliente);
  FrmCliente.Show;
end;

procedure TFrmPrincipal.Rectangle9Click(Sender: TObject);
begin
  MudaAba.Tab := TabMenu;
  MudaAba.ExecuteTarget(Self);
end;

end.
