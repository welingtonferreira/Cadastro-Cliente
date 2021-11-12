object dm_Modulo: Tdm_Modulo
  OldCreateOrder = False
  Height = 238
  Width = 337
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\Almon Talentos Humanos\CadastroCliente\Banco de Dado' +
        's\WFSoftway.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    UpdateOptions.AssignedValues = [uvEUpdate, uvRefreshMode, uvAutoCommitUpdates]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.AutoCommitUpdates = True
    Connected = True
    LoginPrompt = False
    Transaction = fdTransaction
    Left = 40
    Top = 88
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 72
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 200
    Top = 24
  end
  object qryCadCli: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    Transaction = fdTransaction
    SQL.Strings = (
      'SELECT cdg_cliente,'
      '       dcr_nome,'
      '       flg_tipo,'
      '       nmr_cpfcnpj,'
      '       nmr_rgie,'
      '       dat_cadastro,'
      '       flg_ativo'
      '  FROM CadCli;')
    Left = 200
    Top = 176
    object qryCadClicdg_cliente: TIntegerField
      FieldName = 'cdg_cliente'
      Origin = 'cdg_cliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadClidcr_nome: TWideStringField
      FieldName = 'dcr_nome'
      Origin = 'dcr_nome'
      Required = True
      Size = 32767
    end
    object qryCadCliflg_tipo: TStringField
      FieldName = 'flg_tipo'
      Origin = 'flg_tipo'
      Required = True
      FixedChar = True
      Size = 32767
    end
    object qryCadClinmr_cpfcnpj: TStringField
      FieldName = 'nmr_cpfcnpj'
      Origin = 'nmr_cpfcnpj'
      Required = True
      Size = 32767
    end
    object qryCadClinmr_rgie: TStringField
      FieldName = 'nmr_rgie'
      Origin = 'nmr_rgie'
      Size = 32767
    end
    object qryCadClidat_cadastro: TDateField
      FieldName = 'dat_cadastro'
      Origin = 'dat_cadastro'
    end
    object qryCadCliflg_ativo: TStringField
      FieldName = 'flg_ativo'
      Origin = 'flg_ativo'
      FixedChar = True
      Size = 32767
    end
  end
  object fdTransaction: TFDTransaction
    Connection = FDConnection1
    Left = 152
    Top = 88
  end
  object qryTelefones: TFDQuery
    Connection = FDConnection1
    Transaction = fdTransaction
    SQL.Strings = (
      'SELECT cdg_cliente,'
      '       nmr_telefone'
      '  FROM CadCliTelefone;'
      '')
    Left = 152
    Top = 152
    object qryTelefonescdg_cliente: TIntegerField
      FieldName = 'cdg_cliente'
      Origin = 'cdg_cliente'
      Required = True
    end
    object qryTelefonesnmr_telefone: TStringField
      FieldName = 'nmr_telefone'
      Origin = 'nmr_telefone'
      Size = 32767
    end
  end
  object qryEnderecos: TFDQuery
    Connection = FDConnection1
    Transaction = fdTransaction
    SQL.Strings = (
      'SELECT cdg_cliente,'
      '       dcr_logradouro,'
      '       dcr_numero,'
      '       dcr_cep,'
      '       dcr_bairro,'
      '       dcr_cidade,'
      '       dcr_uf,'
      '       dcr_pais'
      '  FROM CadCliEnderecos;'
      '')
    Left = 96
    Top = 176
    object qryEnderecoscdg_cliente: TIntegerField
      FieldName = 'cdg_cliente'
      Origin = 'cdg_cliente'
    end
    object qryEnderecosdcr_logradouro: TStringField
      FieldName = 'dcr_logradouro'
      Origin = 'dcr_logradouro'
      Size = 32767
    end
    object qryEnderecosdcr_numero: TStringField
      FieldName = 'dcr_numero'
      Origin = 'dcr_numero'
      Size = 32767
    end
    object qryEnderecosdcr_cep: TStringField
      FieldName = 'dcr_cep'
      Origin = 'dcr_cep'
      Size = 32767
    end
    object qryEnderecosdcr_bairro: TStringField
      FieldName = 'dcr_bairro'
      Origin = 'dcr_bairro'
      Size = 32767
    end
    object qryEnderecosdcr_cidade: TStringField
      FieldName = 'dcr_cidade'
      Origin = 'dcr_cidade'
      Size = 32767
    end
    object qryEnderecosdcr_uf: TStringField
      FieldName = 'dcr_uf'
      Origin = 'dcr_uf'
      FixedChar = True
      Size = 2
    end
    object qryEnderecosdcr_pais: TStringField
      FieldName = 'dcr_pais'
      Origin = 'dcr_pais'
      Size = 32767
    end
  end
  object qryGeral: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    Transaction = fdTransaction
    Left = 288
    Top = 72
  end
  object cdsEnderecos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 265
    Top = 174
    object cdsEnderecosdcr_logradouro: TStringField
      FieldName = 'dcr_logradouro'
    end
    object cdsEnderecosdcr_numero: TStringField
      FieldName = 'dcr_numero'
    end
    object cdsEnderecosdcr_cep: TStringField
      FieldName = 'dcr_cep'
    end
    object cdsEnderecosdcr_bairro: TStringField
      FieldName = 'dcr_bairro'
    end
    object cdsEnderecosdcr_cidade: TStringField
      FieldName = 'dcr_cidade'
    end
    object cdsEnderecosdcr_uf: TStringField
      FieldName = 'dcr_uf'
    end
    object cdsEnderecosdcr_pais: TStringField
      FieldName = 'dcr_pais'
    end
  end
  object cdsTelefone: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 241
    Top = 118
    object cdsTelefonenmr_telefone: TStringField
      FieldName = 'nmr_telefone'
    end
  end
end
