unit uDM_Modulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.SQLite, Datasnap.DBClient;

type
  Tdm_Modulo = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryCadCli: TFDQuery;
    fdTransaction: TFDTransaction;
    qryTelefones: TFDQuery;
    qryEnderecos: TFDQuery;
    qryGeral: TFDQuery;
    qryCadClicdg_cliente: TIntegerField;
    qryCadClidcr_nome: TWideStringField;
    qryCadCliflg_tipo: TStringField;
    qryCadClinmr_cpfcnpj: TStringField;
    qryCadClinmr_rgie: TStringField;
    qryCadClidat_cadastro: TDateField;
    qryCadCliflg_ativo: TStringField;
    qryTelefonescdg_cliente: TIntegerField;
    qryTelefonesnmr_telefone: TStringField;
    qryEnderecoscdg_cliente: TIntegerField;
    qryEnderecosdcr_logradouro: TStringField;
    qryEnderecosdcr_numero: TStringField;
    qryEnderecosdcr_cep: TStringField;
    qryEnderecosdcr_bairro: TStringField;
    qryEnderecosdcr_cidade: TStringField;
    qryEnderecosdcr_uf: TStringField;
    qryEnderecosdcr_pais: TStringField;
    cdsEnderecos: TClientDataSet;
    cdsEnderecosdcr_logradouro: TStringField;
    cdsEnderecosdcr_numero: TStringField;
    cdsEnderecosdcr_cep: TStringField;
    cdsEnderecosdcr_bairro: TStringField;
    cdsEnderecosdcr_cidade: TStringField;
    cdsEnderecosdcr_uf: TStringField;
    cdsEnderecosdcr_pais: TStringField;
    cdsTelefone: TClientDataSet;
    cdsTelefonenmr_telefone: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Modulo: Tdm_Modulo;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
