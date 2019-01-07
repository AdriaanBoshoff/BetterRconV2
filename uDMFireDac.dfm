object dmFireDac: TdmFireDac
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 381
  Width = 584
  object fdconnectionPlayers: TFDConnection
    Params.Strings = (
      'Database=C:\Users\adria\Documents\BetterRcon\players.db'
      'DriverID=sQLite')
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object sqldriverlinkDB: TFDPhysSQLiteDriverLink
    Left = 288
    Top = 112
  end
  object fdqueryPlayers: TFDQuery
    Connection = fdconnectionPlayers
    Left = 40
    Top = 136
  end
  object fdconnectionChatLog: TFDConnection
    Left = 512
    Top = 16
  end
  object fdqueryChatLog: TFDQuery
    Connection = fdconnectionChatLog
    Left = 512
    Top = 80
  end
  object fdgxwtcrsrCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    ScreenCursor = gcrNone
    Left = 288
    Top = 176
  end
end
