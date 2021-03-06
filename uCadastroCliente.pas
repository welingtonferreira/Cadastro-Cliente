unit uCadastroCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Objects, FMX.Ani, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, System.JSON, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.ExtCtrls, Soap.EncdDecd, Vcl.Imaging.jpeg, Winapi.ShellAPI, fmx.Platform.Win, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  MMSystem, FMX.Media, vcl.Controls, IPPeerClient, FMX.Colors, FMX.DateTimeCtrls, FMX.ListBox, FMX.Effects, uFormat, FireDAC.Phys.SQLiteWrapper, Datasnap.DBClient;

type
  TfrmCadastroCliente = class(TForm)
    Layout2: TLayout;
    imgSair: TImage;
    Layout3: TLayout;
    RoundRect1: TRoundRect;
    img_lupa: TImage;
    edtBuscarCliente: TEdit;
    restClient: TRESTClient;
    restRequest: TRESTRequest;
    restResponse: TRESTResponse;
    lvListaClientes: TListView;
    img_close: TImage;
    Text1: TText;
    rect_NovoCadastro: TRectangle;
    rect_NovoCadastroPopUp: TRectangle;
    ShadowEffect1: TShadowEffect;
    Label1: TLabel;
    cbTipoPessoa: TComboBox;
    Label2: TLabel;
    swAtivo: TSwitch;
    Label3: TLabel;
    lblCPFCNPJ: TLabel;
    lblRGIE: TLabel;
    Label4: TLabel;
    Layout4: TLayout;
    rect_cancelar: TRectangle;
    Image1: TImage;
    Label5: TLabel;
    rect_salvar: TRectangle;
    Image2: TImage;
    Label6: TLabel;
    AnimePopUp: TFloatAnimation;
    edtCPFCNPJ: TEdit;
    StyleBook1: TStyleBook;
    edtNomeCliente: TEdit;
    edtRGIE: TEdit;
    edtDataCadastro: TDateEdit;
    lvDetalheTelefone: TListView;
    edtTelefone: TEdit;
    Label7: TLabel;
    img_novoTelefone: TImage;
    imgExcluirItemCadastro: TImage;
    Label8: TLabel;
    edtLogradouro: TEdit;
    img_NovoEndereco: TImage;
    Label9: TLabel;
    edtCEP: TEdit;
    Label10: TLabel;
    edtNumero: TEdit;
    Label11: TLabel;
    edtBairro: TEdit;
    Label12: TLabel;
    edtCidade: TEdit;
    Label13: TLabel;
    edtEstado: TEdit;
    Label14: TLabel;
    edtPais: TEdit;
    img_CEP: TImage;
    lvDetalheEndereco: TListView;
    imgPadraoEditar: TImage;
    imgPadraoExcluir: TImage;
    rect_Novo: TRectangle;
    Image3: TImage;
    Label15: TLabel;
    procedure imgSairClick(Sender: TObject);
    procedure imgSairMouseEnter(Sender: TObject);
    procedure imgSairMouseLeave(Sender: TObject);
    procedure edtBuscarClienteKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtNotaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure img_closeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rect_salvarClick(Sender: TObject);
    procedure cbTipoPessoaChange(Sender: TObject);
    procedure edtCPFCNPJTyping(Sender: TObject);
    procedure edtRGIETyping(Sender: TObject);
    procedure edtTelefoneTyping(Sender: TObject);
    procedure edtTelefoneExit(Sender: TObject);
    procedure img_novoTelefoneClick(Sender: TObject);
    procedure lvDetalheTelefoneItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure edtCEPTyping(Sender: TObject);
    procedure img_CEPClick(Sender: TObject);
    procedure img_NovoEnderecoClick(Sender: TObject);
    procedure lvDetalheEnderecoItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure edtNomeClienteTyping(Sender: TObject);
    procedure rect_cancelarClick(Sender: TObject);
    procedure lvListaClientesItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure rect_NovoClick(Sender: TObject);
  private
    function SomenteNumero(str: String): String;
    procedure AddTelefone(const pCodCliente: Integer; const pTelefone: String; const pIcon: TStream);
    procedure DelItem(const lvDeletar: TListView; const pIndex, pCodCliente: Integer; pOrigem: String);
    procedure ConsultarCEP(const pCEP: String);
    procedure AddEndereco(const pCodCliente: Integer; const pCEP, pLogradouro, pNumero, pBairro, pCidade, pEstado, pPais: String;
      const pIcon: TStream);
    function ValidaCamposObrigatorios(pForm: TForm): Boolean;
    procedure LimparDadosCadastroPopUp;
    procedure ListarClientesListView(const pFiltrar: String; const pImgEditar, pImgExcluir: TStream);
    function ValidaCPFCNPJ(const pValue: String): Boolean;
    function BuscarCodCliente(const pValue: String): Integer;
    procedure PreencherRegistros(const pValue: Integer);
    procedure DeletarRegistros(const pValue: Integer);
    { Private declarations }
  public
    FOrigem: Integer;
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

const
  urlPadrao = 'viacep.com.br/ws/';

implementation

{$R *.fmx}

uses uDM_Modulo;

procedure TfrmCadastroCliente.edtBuscarClienteKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
var
  vIconEditar, vIconExcluir: TStream;
  i: Integer;
begin
  try
    if (key = 13) then
    begin
      lvListaClientes.Visible := True;
      lvListaClientes.Items.Clear;

      vIconEditar := TMemoryStream.Create;
      vIconExcluir := TMemoryStream.Create;

      imgPadraoEditar.Bitmap.SaveToStream(vIconEditar);
      imgPadraoExcluir.Bitmap.SaveToStream(vIconExcluir);

      vIconEditar.Position := 0;
      vIconExcluir.Position := 0;

      ListarClientesListView(edtBuscarCliente.Text, vIconEditar, vIconExcluir);

      vIconEditar.DisposeOf;
      vIconExcluir.DisposeOf;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.edtBuscarMusicaKeyDown' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.ListarClientesListView(const pFiltrar: String; const pImgEditar, pImgExcluir: TStream);
var
  vBmpEditar, vBmpExcluir: TBitmap;
  vImgEditar, vImgExcluir: TListItemImage;
  vRetorno: Integer;
  vFormatar: String;
begin
  try
    with dm_Modulo.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select cdg_cliente, dcr_nome, nmr_cpfcnpj, nmr_rgie, flg_tipo, flg_ativo');
      SQL.Add('  from cadcli');

      if (pFiltrar <> EmptyStr) then
      begin
        if (TryStrToInt(SomenteNumero(pFiltrar), vRetorno)) then
        begin
          {SQL.Add(' where dcr_nome like :dcr_nome');
                    ParamByName('dcr_nome').AsString := '%' + pFiltrar + '%'}
        end;

        if (vRetorno = 0) then
        begin
          SQL.Add(' where dcr_nome like :dcr_nome');
          ParamByName('dcr_nome').AsString := '%' + pFiltrar + '%'
        end
        else
        begin
          //cpf ou cnpj
          Formatar(edtBuscarCliente, TFormato.CNPJorCPF);
          SQL.Add(' where nmr_cpfcnpj = :nmr_cpfcnpj');
          ParamByName('nmr_cpfcnpj').AsString := pFiltrar;
        end;
      end;
      Open;

      First;
      while (not Eof) do
      begin
        with lvListaClientes.Items.Add do
        begin
          Height := 40;
          Tag := dm_Modulo.qryGeral.FieldByName('cdg_cliente').AsInteger;

          TListItemText(Objects.FindDrawable('txtNomeCliente')).Text := dm_Modulo.qryGeral.FieldByName('dcr_nome').AsString;
          TListItemText(Objects.FindDrawable('txtCPFCNPJ')).Text := dm_Modulo.qryGeral.FieldByName('nmr_cpfcnpj').AsString;
          TListItemText(Objects.FindDrawable('txtRGIE')).Text := dm_Modulo.qryGeral.FieldByName('nmr_rgie').AsString;

          if (dm_Modulo.qryGeral.FieldByName('flg_tipo').AsInteger = 0) then
          begin
            TListItemText(Objects.FindDrawable('txtTipoPessoa')).Text := 'F';
          end
          else
          begin
            TListItemText(Objects.FindDrawable('txtTipoPessoa')).Text := 'J';
          end;

          if (dm_Modulo.qryGeral.FieldByName('flg_ativo').AsBoolean) then
          begin
            TListItemText(Objects.FindDrawable('txtAtivo')).TextColor := TAlphaColors.Green;
            TListItemText(Objects.FindDrawable('txtAtivo')).Text := 'ATIVO';
          end
          else
          begin
            TListItemText(Objects.FindDrawable('txtAtivo')).TextColor := TAlphaColors.Red;
            TListItemText(Objects.FindDrawable('txtAtivo')).Text := 'DESATIVADO';
          end;

          Next;

          vImgEditar := TListItemImage(Objects.FindDrawable('imgEditar'));
          vImgExcluir := TListItemImage(Objects.FindDrawable('imgExcluir'));
          if ((pImgEditar <> nil) and (pImgExcluir <> nil)) then
          begin
            vBmpEditar := TBitmap.Create;
            vBmpExcluir := TBitmap.Create;

            vBmpEditar.LoadFromStream(pImgEditar);
            vBmpExcluir.LoadFromStream(pImgExcluir);

            vImgEditar.OwnsBitmap := True;
            vImgExcluir.OwnsBitmap := True;

            vImgEditar.Bitmap := vBmpEditar;
            vImgExcluir.Bitmap := vBmpExcluir;
          end;
        end;
      end;

    end;

  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.ListarClientesListView' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.edtCEPTyping(Sender: TObject);
begin
  try
    Formatar(edtCEP, TFormato.CEP);
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.edtCEPTyping' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.edtCPFCNPJTyping(Sender: TObject);
begin
  try
    edtCPFCNPJ.TextSettings.FontColor := TAlphaColors.Black;
    edtCPFCNPJ.TextPrompt := EmptyStr;
    Formatar(edtCPFCNPJ, TFormato.CNPJorCPF);
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.edtCPFCNPJTyping' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.edtNomeClienteTyping(Sender: TObject);
begin
  try
    edtNomeCliente.TextSettings.FontColor := TAlphaColors.Black;
    edtNomeCliente.TextPrompt := EmptyStr;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.edtNomeClienteTyping' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.edtNotaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  try
    if (not (KeyChar in ['0'..'9', ','])) and (ord(keychar) <> 8) and (KeyChar <> #0) then
    begin
      KeyChar := #0;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.edtNotaKeyDown' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.edtRGIETyping(Sender: TObject);
begin
  try
    edtRGIE.TextSettings.FontColor := TAlphaColors.Black;
    edtRGIE.TextPrompt := EmptyStr;

    if (cbTipoPessoa.ItemIndex = 1) then
    begin
      Formatar(edtRGIE, TFormato.InscricaoEstadual, 'SP');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.edtRGIETyping' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.edtTelefoneExit(Sender: TObject);
begin
  try
    edtTelefoneTyping(edtTelefone);
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.edtTelefoneExit' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.edtTelefoneTyping(Sender: TObject);
var
  vDigitos: String;
begin
  try
    vDigitos := FloatToStr(edtTelefone.MaxLength);
    if (StrToInt(vDigitos) = 0) then
    begin
      if (Sender is TEdit) then
      begin
        vDigitos := IntToStr(Length(SomenteNumero(TEdit(Sender).Text)));
      end;
    end;

    if (StrToInt(vDigitos) = 10) then
    begin
      Formatar(edtTelefone, TFormato.TelefoneFixo);
    end
    else
    begin
      Formatar(edtTelefone, TFormato.Celular);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.edtTelefoneTyping' + #13 + E.Message);
    end;
  end;
end;

function TfrmCadastroCliente.SomenteNumero(str: String): String;
var
  x: Integer;
begin
  try
    Result := EmptyStr;
    for x := 0 to Length(str) - 1 do
    begin
      if (str.Chars[x] In ['0'..'9']) then
      begin
        Result := Result + str.Chars[x];
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.SomenteNumero' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
begin
  try
    FOrigem := 99;
    lvListaClientes.Visible := False;
    rect_NovoCadastro.Visible := False;
    rect_NovoCadastroPopUp.Visible := False;
    dm_Modulo.cdsEnderecos.CreateDataSet;
    dm_Modulo.cdsTelefone.CreateDataSet;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.FormShow' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.imgSairClick(Sender: TObject);
begin
  try
    Close;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.imgSairClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.imgSairMouseEnter(Sender: TObject);
begin
  try
    (Sender as TImage).Width  := (Sender as TImage).Width + 20;
    (Sender as TImage).Height := (Sender as TImage).Height + 20;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.imgSairMouseEnter' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.imgSairMouseLeave(Sender: TObject);
begin
  try
    (Sender as TImage).Width  := (Sender as TImage).Width - 20;
    (Sender as TImage).Height := (Sender as TImage).Height - 20;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.imgSairMouseLeave' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.ConsultarCEP(const pCEP: String);
var
  retornoJson: TJSONValue;
begin
  try
    restRequest.Resource := SomenteNumero(pCEP) + '/json';
    restRequest.Execute;

    if (restRequest.Response.StatusCode = 200) then
    begin
      if (restRequest.Response.Content.IndexOf('erro') > 0) then
      begin
        MessageDlg('CEP n?o encontrado.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0); 
        Exit;
      end
      else
      begin
        retornoJson := TJSONObject.ParseJSONValue(restResponse.Content) as TJSONObject;
        if(retornoJson <> nil)then
        begin
          edtLogradouro.Text := retornoJson.GetValue<string>('logradouro');
          edtBairro.Text := retornoJson.GetValue<string>('bairro');
          edtCidade.Text := retornoJson.GetValue<string>('localidade');
          edtEstado.Text := retornoJson.GetValue<string>('uf');
        end;
      end;
    end
    else
    begin
      MessageDlg('Erro ao consultar CEP.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0); 
      Exit;
    end;

    edtNumero.SetFocus;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.ConsultarCEP' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.img_CEPClick(Sender: TObject);
begin
  try
    if (edtCEP.Text = EmptyStr) then
    begin
      MessageDlg('Necess?rio prencher o CEP para carregar os dados.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      Exit;
    end;

    if (SomenteNumero(edtCEP.Text).Length <> 8) then
    begin
      MessageDlg('CEP inv?lido.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      Exit;
    end;

    ConsultarCEP(edtCEP.Text);
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.img_CEPClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.img_closeClick(Sender: TObject);
begin
  try
    edtBuscarCliente.Text := EmptyStr;
    edtBuscarCliente.SetFocus;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.img_closeClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.img_NovoEnderecoClick(Sender: TObject);
var
  vIcon: TStream;
  i: Integer;
begin
  try
    if (edtCEP.Text <> EmptyStr) then
    begin
      vIcon := TMemoryStream.Create;
      imgExcluirItemCadastro.Bitmap.SaveToStream(vIcon);
      vIcon.Position := 0;

      AddEndereco(1, edtCEP.Text, edtLogradouro.Text, edtNumero.Text, edtBairro.Text, edtCidade.Text, edtEstado.Text, edtPais.Text, vIcon);

      //limpa campos dos edit, ja est? na listview
      edtCEP.Text := EmptyStr;
      edtLogradouro.Text := EmptyStr;
      edtNumero.Text := EmptyStr;
      edtBairro.Text := EmptyStr;
      edtCidade.Text := EmptyStr;
      edtEstado.Text := EmptyStr;
      edtPais.Text := EmptyStr;

      vIcon.DisposeOf;
    end;

  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.img_NovoEnderecoClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.AddEndereco(const pCodCliente: Integer; const pCEP, pLogradouro, pNumero, pBairro, pCidade,
  pEstado, pPais: String; const pIcon: TStream);
var
  vBmpIcon: TBitmap;
  vImgIcon: TListItemImage;
begin
  try
    with lvDetalheEndereco.Items.Add do
    begin
      Height := 40;
      Tag := pCodCliente;

      TListItemText(Objects.FindDrawable('txtCEP')).Text := pCEP;;
      TListItemText(Objects.FindDrawable('txtLogradouro')).Text := pLogradouro;
      TListItemText(Objects.FindDrawable('txtNumero')).Text := pNumero;
      TListItemText(Objects.FindDrawable('txtBairro')).Text := pBairro;
      TListItemText(Objects.FindDrawable('txtCidade')).Text := pCidade;
      TListItemText(Objects.FindDrawable('txtEstado')).Text := pEstado;
      TListItemText(Objects.FindDrawable('txtPais')).Text := pPais;

      with dm_Modulo.cdsEnderecos do
      begin
        Append;
        FieldByName('dcr_logradouro').AsString := pLogradouro;
        FieldByName('dcr_numero').AsString := pNumero;
        FieldByName('dcr_cep').AsString := pCEP;
        FieldByName('dcr_bairro').AsString := pBairro;
        FieldByName('dcr_cidade').AsString := pCidade;
        FieldByName('dcr_uf').AsString := pEstado;
        FieldByName('dcr_pais').AsString := pPais;
        Post;
      end;

      vImgIcon := TListItemImage(Objects.FindDrawable('imgEndereco'));
      if (pIcon <> nil) then
      begin
        vBmpIcon := TBitmap.Create;
        vBmpIcon.LoadFromStream(pIcon);
        vImgIcon.OwnsBitmap := True;
        vImgIcon.Bitmap := vBmpIcon;
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.AddEndereco' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.img_novoTelefoneClick(Sender: TObject);
var
  vIcon: TStream;
  i: Integer;
begin
  try
    if (edtTelefone.Text <> EmptyStr) then
    begin
      vIcon := TMemoryStream.Create;
      imgExcluirItemCadastro.Bitmap.SaveToStream(vIcon);
      vIcon.Position := 0;

      AddTelefone(1, edtTelefone.Text, vIcon);
      edtTelefone.Text := EmptyStr;

      vIcon.DisposeOf;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.img_novoTelefoneClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.AddTelefone(const pCodCliente: Integer; const pTelefone: String; const pIcon: TStream);
var
  vBmpIcon: TBitmap;
  vImgIcon: TListItemImage;
begin
  try
    with lvDetalheTelefone.Items.Add do
    begin
      Height := 20;
      Tag := pCodCliente;

      TListItemText(Objects.FindDrawable('txtTelefone')).Text := pTelefone;

      with dm_Modulo.cdsTelefone do
      begin
        Append;
        FieldByName('nmr_telefone').AsString := pTelefone;
        Post;
      end;

      vImgIcon := TListItemImage(Objects.FindDrawable('imgTelefone'));
      if (pIcon <> nil) then
      begin
        vBmpIcon := TBitmap.Create;
        vBmpIcon.LoadFromStream(pIcon);
        vImgIcon.OwnsBitmap := True;
        vImgIcon.Bitmap := vBmpIcon;
      end;
    end;

  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.AddTelefone' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.DelItem(const lvDeletar: TListView; const pIndex, pCodCliente: Integer; pOrigem: String);
begin
  try
    if (pOrigem = 'E') then
    begin
      dm_Modulo.cdsEnderecos.Delete;
    end
    else
    begin
      dm_Modulo.cdsTelefone.Delete;
    end;
    lvDeletar.Items.Delete(pIndex);
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.DelItem' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.lvDetalheEnderecoItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
  AItem: Integer;
begin
  try
    if TListView(Sender).Selected <> nil then
    begin
      if (TListItemImage(ItemObject).Name = 'imgEndereco') then
      begin
        AItem := lvDetalheEndereco.Selected.Tag;
        DelItem(lvDetalheEndereco, ItemIndex, AItem, 'E');
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.lvDetalheEnderecoItemClickEx' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.lvDetalheTelefoneItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
  AItem: Integer;
begin
  try
    if TListView(Sender).Selected <> nil then
    begin
      if (TListItemImage(ItemObject).Name = 'imgTelefone') then
      begin
        AItem := lvDetalheTelefone.Selected.Tag;
        DelItem(lvDetalheTelefone, ItemIndex, AItem, 'T');
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.lvDetalheTelefoneUpdateObjects' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.PreencherRegistros(const pValue: Integer);
var
  vIcon: TStream;
begin
  try
    vIcon := TMemoryStream.Create;
    imgExcluirItemCadastro.Bitmap.SaveToStream(vIcon);
    vIcon.Position := 0;
  
    {mestre}
    with dm_Modulo.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select cdg_cliente, dcr_nome, flg_tipo, nmr_cpfcnpj, nmr_rgie, dat_cadastro, flg_ativo');
      SQL.Add('  from cadcli');
      SQL.Add(' where cdg_cliente = :cdg_cliente');
      ParamByName('cdg_cliente').AsInteger := pValue;
      Open;

      edtNomeCliente.Text := dm_Modulo.qryGeral.FieldByName('dcr_nome').AsString;
      cbTipoPessoa.ItemIndex := dm_Modulo.qryGeral.FieldByName('flg_tipo').AsInteger;
      edtCPFCNPJ.Text := dm_Modulo.qryGeral.FieldByName('nmr_cpfcnpj').AsString;
      edtRGIE.Text := dm_Modulo.qryGeral.FieldByName('nmr_rgie').AsString;
      edtDataCadastro.Date := dm_Modulo.qryGeral.FieldByName('dat_cadastro').AsDateTime;
      swAtivo.IsChecked := dm_Modulo.qryGeral.FieldByName('flg_ativo').AsBoolean;
    end;

    {detalhe endere?os}
    with dm_Modulo.qryEnderecos do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select cdg_cliente, dcr_logradouro, dcr_numero, dcr_cep, dcr_bairro, dcr_cidade, dcr_uf, dcr_pais');
      SQL.Add('  from cadclienderecos');
      SQL.Add(' where cdg_cliente = :cdg_cliente');
      ParamByName('cdg_cliente').AsInteger := pValue;
      Open;

      dm_Modulo.qryEnderecos.First;
      while (not dm_Modulo.qryEnderecos.Eof) do
      begin
        AddEndereco(pValue,
                    dm_Modulo.qryEnderecos.FieldByName('dcr_cep').AsString,
                    dm_Modulo.qryEnderecos.FieldByName('dcr_logradouro').AsString,
                    dm_Modulo.qryEnderecos.FieldByName('dcr_numero').AsString,
                    dm_Modulo.qryEnderecos.FieldByName('dcr_bairro').AsString,
                    dm_Modulo.qryEnderecos.FieldByName('dcr_cidade').AsString,
                    dm_Modulo.qryEnderecos.FieldByName('dcr_uf').AsString,
                    dm_Modulo.qryEnderecos.FieldByName('dcr_pais').AsString,
                    vIcon);
      
        dm_Modulo.qryEnderecos.Next;
      end;
    end;

    {detalhe telefone}
    with dm_Modulo.qryTelefones do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select cdg_cliente, nmr_telefone');
      SQL.Add('  from cadclitelefone');
      SQL.Add(' where cdg_cliente = :cdg_cliente');
      ParamByName('cdg_cliente').AsInteger := pValue;     
      Open;

      dm_Modulo.qryTelefones.First;
      while (not dm_Modulo.qryTelefones.Eof) do
      begin 
        AddTelefone(pValue,
                    dm_Modulo.qryTelefones.FieldByName('nmr_telefone').AsString,
                    vIcon);      
      
        dm_Modulo.qryTelefones.Next;
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.PreencherRegistros' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.DeletarRegistros(const pValue: Integer);
begin
  try
    if (MessageDlg('Desejar excluir o cadastro deste cliente?', TMsgDlgType.mtConfirmation,   
                    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      dm_Modulo.fdTransaction.StartTransaction;
      try  
        with dm_Modulo.qryGeral do
        begin
          Close;
          SQL.Clear;
          SQL.Add('delete from cadclitelefone');
          SQL.Add(' where cdg_cliente = :cdg_cliente');
          ParamByName('cdg_cliente').AsInteger := pValue;
          ExecSQL;

          Close;
          SQL.Clear;
          SQL.Add('delete from cadclienderecos');
          SQL.Add(' where cdg_cliente = :cdg_cliente');
          ParamByName('cdg_cliente').AsInteger := pValue;
          ExecSQL; 

          Close;
          SQL.Clear;
          SQL.Add('delete from cadcli');
          SQL.Add(' where cdg_cliente = :cdg_cliente');
          ParamByName('cdg_cliente').AsInteger := pValue;
          ExecSQL;           
        end;
        dm_Modulo.fdTransaction.Commit;

        MessageDlg('Cadastro excluido!!!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);   
        lvListaClientes.Items.Clear;     
      except
        dm_Modulo.fdTransaction.Rollback;
        Exit;
      end;
    end;
    
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.DeletarRegistros' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.lvListaClientesItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  try
    if (TListView(Sender).Selected <> nil) then
    begin
      if (TListItemImage(ItemObject).Name = 'imgEditar') then
      begin
        PreencherRegistros(lvListaClientes.Selected.Tag);
        FOrigem := 0;

        AnimePopUp.StartValue := -rect_NovoCadastroPopUp.Height;
        AnimePopUp.StopValue := (Self.Height / 2) - (rect_NovoCadastroPopUp.Height / 2);
        rect_NovoCadastro.Visible := True;
        rect_NovoCadastroPopUp.Visible := True;

        AnimePopUp.Start;
      end;

      if (TListItemImage(ItemObject).Name = 'imgExcluir') then
      begin
        DeletarRegistros(lvListaClientes.Selected.Tag);
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.lvListaClientesItemClickEx' + #13 + E.Message);
    end
  end;
end;

function TfrmCadastroCliente.ValidaCPFCNPJ(const pValue: String): Boolean;
begin
  Result := False;
  try
    with dm_Modulo.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select count(nmr_cpfcnpj) as nmr_cpfcnpj');
      SQL.Add('  from cadcli');
      SQL.Add(' where nmr_cpfcnpj = :nmr_cpfcnpj');
      ParamByName('nmr_cpfcnpj').AsString := pValue;
      Open;

      if (dm_Modulo.qryGeral.FieldByName('nmr_cpfcnpj').AsInteger > 0) then
      begin
        Result := True;
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.ValidaCPFCNPJ' + #13 + E.Message);
    end
  end;
end;

procedure TfrmCadastroCliente.cbTipoPessoaChange(Sender: TObject);
begin
  try
    if (cbTipoPessoa.ItemIndex = 0) then
    begin
      lblRGIE.Text := 'RG';
      lblCPFCNPJ.Text := 'CPF';
    end
    else
    begin
      lblRGIE.Text := 'Inscri??o Estadual';
      lblCPFCNPJ.Text := 'CNPJ';
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.cbTipoPessoaChange' + #13 + E.Message);
    end
  end;
end;

procedure TfrmCadastroCliente.rect_cancelarClick(Sender: TObject);
begin
  try
    LimparDadosCadastroPopUp;
    rect_NovoCadastro.Visible := False;
    rect_NovoCadastroPopUp.Visible := False;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.rect_cancelarClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.rect_NovoClick(Sender: TObject);
begin
  try
    AnimePopUp.StartValue := -rect_NovoCadastroPopUp.Height;
    AnimePopUp.StopValue := (Self.Height / 2) - (rect_NovoCadastroPopUp.Height / 2);
    rect_NovoCadastro.Visible := True;
    rect_NovoCadastroPopUp.Visible := True;

    AnimePopUp.Start;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.rect_NovoClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.rect_salvarClick(Sender: TObject);
begin
  try
    if (ValidaCamposObrigatorios(Self)) then
    begin
      Exit;
    end;

    if (FOrigem <> 0) then
    begin
      if (ValidaCPFCNPJ(edtCPFCNPJ.Text)) then
      begin
        if (cbTipoPessoa.ItemIndex = 1) then
        begin
          MessageDlg('CNPJ j? cadastrado no sistema.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
          Exit;
        end
        else
        begin
          MessageDlg('CPF j? cadastrado no sistema.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
          Exit;
        end;
      end;

      {///////////////-insert}
      dm_Modulo.fdTransaction.StartTransaction;
      try
        with dm_Modulo.qryCadCli do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into cadcli');
          SQL.Add('       (dcr_nome, flg_tipo, nmr_cpfcnpj, nmr_rgie, dat_cadastro, flg_ativo)');
          SQL.Add(' values (:dcr_nome, :flg_tipo, :nmr_cpfcnpj, :nmr_rgie, :dat_cadastro, :flg_ativo)');
          ParamByName('dcr_nome').AsString := edtNomeCliente.Text;
          ParamByName('flg_tipo').AsInteger := cbTipoPessoa.ItemIndex;
          ParamByName('nmr_cpfcnpj').AsString := edtCPFCNPJ.Text;
          ParamByName('nmr_rgie').AsString := edtRGIE.Text;
          ParamByName('dat_cadastro').AsDate := edtDataCadastro.Date;
          ParamByName('flg_ativo').AsBoolean := swAtivo.IsChecked;
          ExecSQL;
        end;

        with dm_Modulo.qryTelefones do
        begin
          dm_Modulo.cdsTelefone.First;
          while (not dm_Modulo.cdsTelefone.Eof) do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into cadclitelefone');
            SQL.Add('       (cdg_cliente, nmr_telefone)');
            SQL.Add(' values (:cdg_cliente, :nmr_telefone)');
            ParamByName('cdg_cliente').AsInteger := BuscarCodCliente(edtCPFCNPJ.Text);
            ParamByName('nmr_telefone').AsString := dm_Modulo.cdsTelefone.FieldByName('nmr_telefone').AsString;
            ExecSQL;

            dm_Modulo.cdsTelefone.Next;
          end;
        end;

        with dm_Modulo.qryEnderecos do
        begin
          dm_Modulo.cdsEnderecos.First;
          while (not dm_Modulo.cdsEnderecos.Eof) do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into cadclienderecos');
            SQL.Add('       (cdg_cliente, dcr_logradouro, dcr_numero, dcr_cep, dcr_bairro, dcr_cidade, dcr_uf, dcr_pais)');
            SQL.Add(' values (:cdg_cliente, :dcr_logradouro, :dcr_numero, :dcr_cep, :dcr_bairro, :dcr_cidade, :dcr_uf, :dcr_pais)');
            ParamByName('cdg_cliente').AsInteger := BuscarCodCliente(edtCPFCNPJ.Text);
            ParamByName('dcr_logradouro').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_logradouro').AsString;
            ParamByName('dcr_numero').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_numero').AsString;
            ParamByName('dcr_cep').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_cep').AsString;
            ParamByName('dcr_bairro').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_bairro').AsString;
            ParamByName('dcr_cidade').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_cidade').AsString;
            ParamByName('dcr_uf').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_uf').AsString;
            ParamByName('dcr_pais').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_pais').AsString;
            ExecSQL;

            dm_Modulo.cdsEnderecos.Next;
          end;
        end;

        dm_Modulo.fdTransaction.Commit;
        MessageDlg('Gravado com sucesso.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
      except
        dm_Modulo.fdTransaction.Rollback;
        Exit;
      end;    
    end
    else
    begin
      {////////////////- altera??o}
      dm_Modulo.fdTransaction.StartTransaction;
      try
        with dm_Modulo.qryCadCli do
        begin
          Close;
          SQL.Clear;
          SQL.Add('update cadcli');
          SQL.Add('   set dcr_nome = :dcr_nome,'); 
          SQL.Add('       flg_tipo = :flg_tipo,');
          SQL.Add('       nmr_cpfcnpj = :nmr_cpfcnpj,'); 
          SQL.Add('       nmr_rgie = :nmr_rgie,');
          SQL.Add('       dat_cadastro = :dat_cadastro,'); 
          SQL.Add('       flg_ativo = :flg_ativo');
          SQL.Add(' where cdg_cliente = :cdg_cliente');
          ParamByName('cdg_cliente').AsInteger := BuscarCodCliente(edtCPFCNPJ.Text);
          ParamByName('dcr_nome').AsString := edtNomeCliente.Text;
          ParamByName('flg_tipo').AsInteger := cbTipoPessoa.ItemIndex;
          ParamByName('nmr_cpfcnpj').AsString := edtCPFCNPJ.Text;
          ParamByName('nmr_rgie').AsString := edtRGIE.Text;
          ParamByName('dat_cadastro').AsDate := edtDataCadastro.Date;
          ParamByName('flg_ativo').AsBoolean := swAtivo.IsChecked;
          ExecSQL;
        end;

        with dm_Modulo.qryTelefones do
        begin
          Close;
          SQL.Clear;
          SQL.Add('delete from cadclitelefone');
          SQL.Add(' where cdg_cliente = :cdg_cliente');
          ParamByName('cdg_cliente').AsInteger := BuscarCodCliente(edtCPFCNPJ.Text);
          ExecSQL;
        
          dm_Modulo.cdsTelefone.First;
          while (not dm_Modulo.cdsTelefone.Eof) do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into cadclitelefone');
            SQL.Add('       (cdg_cliente, nmr_telefone)');
            SQL.Add(' values (:cdg_cliente, :nmr_telefone)');
            ParamByName('cdg_cliente').AsInteger := BuscarCodCliente(edtCPFCNPJ.Text);
            ParamByName('nmr_telefone').AsString := dm_Modulo.cdsTelefone.FieldByName('nmr_telefone').AsString;
            ExecSQL;

            dm_Modulo.cdsTelefone.Next;
          end;
        end;

        with dm_Modulo.qryEnderecos do
        begin
          Close;
          SQL.Clear;
          SQL.Add('delete from cadclienderecos');
          SQL.Add(' where cdg_cliente = :cdg_cliente');
          ParamByName('cdg_cliente').AsInteger := BuscarCodCliente(edtCPFCNPJ.Text);
          ExecSQL;
                  
          dm_Modulo.cdsEnderecos.First;
          while (not dm_Modulo.cdsEnderecos.Eof) do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into cadclienderecos');
            SQL.Add('       (cdg_cliente, dcr_logradouro, dcr_numero, dcr_cep, dcr_bairro, dcr_cidade, dcr_uf, dcr_pais)');
            SQL.Add(' values (:cdg_cliente, :dcr_logradouro, :dcr_numero, :dcr_cep, :dcr_bairro, :dcr_cidade, :dcr_uf, :dcr_pais)');
            ParamByName('cdg_cliente').AsInteger := BuscarCodCliente(edtCPFCNPJ.Text);
            ParamByName('dcr_logradouro').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_logradouro').AsString;
            ParamByName('dcr_numero').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_numero').AsString;
            ParamByName('dcr_cep').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_cep').AsString;
            ParamByName('dcr_bairro').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_bairro').AsString;
            ParamByName('dcr_cidade').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_cidade').AsString;
            ParamByName('dcr_uf').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_uf').AsString;
            ParamByName('dcr_pais').AsString := dm_Modulo.cdsEnderecos.FieldByName('dcr_pais').AsString;
            ExecSQL;

            dm_Modulo.cdsEnderecos.Next;
          end;
        end;

        dm_Modulo.fdTransaction.Commit;
        MessageDlg('Registro alterado com sucesso.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
      except
        dm_Modulo.fdTransaction.Rollback;
        Exit;
      end;
    end;

    FOrigem := 99;
    rect_NovoCadastro.Visible := False;
    rect_NovoCadastroPopUp.Visible := False;
    LimparDadosCadastroPopUp;
    lvListaClientes.Items.Clear;    

  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.rect_salvarClick' + #13 + E.Message);
    end;
  end;
end;

function TfrmCadastroCliente.BuscarCodCliente(const pValue: String): Integer;
begin
  try
    Result := 0;
    with dm_Modulo.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select cdg_cliente');
      SQL.Add('  from cadcli');
      SQL.Add(' where nmr_cpfcnpj = :nmr_cpfcnpj');
      ParamByName('nmr_cpfcnpj').AsString := pValue;
      Open;

      Result := dm_Modulo.qryGeral.FieldByName('cdg_cliente').AsInteger;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.BuscarCodCliente' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCadastroCliente.LimparDadosCadastroPopUp;
var
  x: Integer;
begin
  dm_Modulo.cdsEnderecos.EmptyDataSet;
  dm_Modulo.cdsTelefone.EmptyDataSet;
  lvDetalheTelefone.Items.Clear;
  lvDetalheEndereco.Items.Clear;
  try
    for x := 0 to ComponentCount -1 do
    begin
      if (Components[x].GetParentComponent = rect_NovoCadastroPopUp) then
      begin
        if (Components[x] is TEdit) then
        begin
          TEdit(Components[x]).FontColor := TAlphaColors.Black;
          TEdit(Components[x]).TextPrompt := EmptyStr;
          TEdit(Components[x]).Text := EmptyStr;
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.LimparDadosCadastroPopUp' + #13 + E.Message);
    end;
  end;
end;

function TfrmCadastroCliente.ValidaCamposObrigatorios(pForm: TForm): Boolean;
var
  vContador: Integer;
  vTipoPessoa: String;
begin
  try
    Result := False;
    for vContador := 0 to pForm.ComponentCount -1 do
    begin
      if (pForm.Components[vContador].GetParentComponent = Self.rect_NovoCadastroPopUp) then
      begin
        if (pForm.Components[vContador] is TComboBox) then
        begin
          if (TComboBox(pForm.Components[vContador]).ItemIndex = 0) then
          begin
            vTipoPessoa := 'F';
          end
          else
          begin
            vTipoPessoa := 'J';
          end;
        end;

        if (pForm.Components[vContador] is TEdit) then
        begin
          if (TEdit(pForm.Components[vContador]).Text = EmptyStr) then
          begin
            if (TEdit(pForm.Components[vContador]).Name = edtNomeCliente.Name) then
            begin
              TEdit(pForm.Components[vContador]).TextSettings.FontColor := TAlphaColors.Red;
              TEdit(pForm.Components[vContador]).TextPrompt := 'Informe o nome do cliente.';
              TEdit(pForm.Components[vContador]).SetFocus;
              Result := True;
            end;

            if (TEdit(pForm.Components[vContador]).Name = edtCPFCNPJ.Name) then
            begin
              if (vTipoPessoa = 'J') then
              begin
                TEdit(pForm.Components[vContador]).TextSettings.FontColor := TAlphaColors.Red;
                TEdit(pForm.Components[vContador]).TextPrompt := 'Informe o CNPJ do cliente.';
              end
              else
              begin
                TEdit(pForm.Components[vContador]).TextSettings.FontColor := TAlphaColors.Red;
                TEdit(pForm.Components[vContador]).TextPrompt := 'Informe o CPF do cliente.';
              end;
              Result := True;
              TEdit(pForm.Components[vContador]).SetFocus;
            end;

            if (TEdit(pForm.Components[vContador]).Name = edtRGIE.Name) then
            begin
              if (vTipoPessoa = 'J') then
              begin
                TEdit(pForm.Components[vContador]).TextSettings.FontColor := TAlphaColors.Red;
                TEdit(pForm.Components[vContador]).TextPrompt := 'Informe a Inscri??o Estadual.';
              end
              else
              begin
                TEdit(pForm.Components[vContador]).TextSettings.FontColor := TAlphaColors.Red;
                TEdit(pForm.Components[vContador]).TextPrompt := 'Informe o RG do cliente.';
              end;
              Result := True;
              TEdit(pForm.Components[vContador]).SetFocus;
            end;
          end;
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmConsultaMusicas.ValidaCamposObrigatorios' + #13 + E.Message);
    end;
  end;
end;

end.
