unit UDMDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, System.IOUtils, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDMDados = class(TDataModule)
    FDConnection: TFDConnection;
    QDados: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDados: TDMDados;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDMDados.DataModuleCreate(Sender: TObject);
begin
  //Aqui especifico o local que ser� salvo o banco de dados
  //Caminho padr�o definido pelo sistema.
  FDConnection.Params.Values['Database'] := System.IOUtils.TPath.GetDocumentsPath +
                                          '/' + 'BDDados.SQL';
end;

procedure TDMDados.FDConnectionAfterConnect(Sender: TObject);
begin
  Var SQL : String;

  //Crio a tabela de Cliente
  SQL := 'CREATE TABLE IF NOT EXISTS CLIENTE (' +
         '  ID_CLIENTE INTEGER,' +
         '  NOME TEXT,' +
         '  EMAIL TEXT, ' +
         '  CPF TEXT,' +
         '  PRIMARY KEY (ID_CLIENTE))';

  //Executo o que est� na vari�vel SQL
  FDConnection.ExecSQL(SQL);
end;

end.
