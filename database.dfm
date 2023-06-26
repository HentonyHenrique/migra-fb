object moduloDB: TmoduloDB
  OldCreateOrder = False
  Height = 494
  Width = 765
  object firebirdConnection: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\MigraNet\HOST_ger.FDB'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 400
  end
  object mysqlConnection: TFDConnection
    Params.Strings = (
      'Database=gerbd'
      'User_Name=netsoft'
      'DriverID=MySQL')
    UpdateOptions.AssignedValues = [uvCheckRequired]
    Connected = True
    Left = 698
    Top = 408
  end
  object firebirdProdutos: TFDTable
    Active = True
    IndexFieldNames = 'ID_PRODUTO'
    Connection = firebirdConnection
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    TableName = 'PRODUTOS'
    Left = 40
    Top = 352
  end
  object firebirdFornecedores: TFDTable
    Active = True
    IndexFieldNames = 'ID_FORNECEDOR'
    Connection = firebirdConnection
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    TableName = 'FORNECEDOR'
    Left = 40
    Top = 296
  end
  object firebirdClientes: TFDTable
    Active = True
    IndexFieldNames = 'ID_CLIENTE'
    Connection = firebirdConnection
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    TableName = 'CLIENTES'
    Left = 40
    Top = 240
  end
  object mysqlProdutos: TFDTable
    Active = True
    IndexFieldNames = 'row_id'
    Connection = mysqlConnection
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    TableName = 'gerbd.produtos'
    Left = 696
    Top = 352
  end
  object mysqlFornecedores: TFDTable
    Active = True
    IndexFieldNames = 'row_id'
    Connection = mysqlConnection
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    TableName = 'gerbd.fornecedor'
    Left = 696
    Top = 304
  end
  object mysqlClientes: TFDTable
    Active = True
    IndexFieldNames = 'row_id'
    Connection = mysqlConnection
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    TableName = 'gerbd.cliente'
    Left = 696
    Top = 256
  end
end
