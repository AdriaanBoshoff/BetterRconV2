unit uDatabaseManager;

interface

uses
  uDMFireDac;

type
  TDBManager = class
  public
    procedure InserPlayerIfNotExists(const aSteamID, aDisplayName, aAddress: string);
    procedure LogChat(const aSteamID, aDisplayName, aUnixTime, aText: string);
  end;

var
  dbManager: TDBManager;

implementation

{ DBManager }

procedure TDBManager.InserPlayerIfNotExists(const aSteamID, aDisplayName, aAddress: string);
begin
  with dmFireDac do
  begin
    fdconnectionPlayers.Open;
    fdqueryPlayers.Active := False;
    fdqueryPlayers.SQL.Clear;
    fdqueryPlayers.SQL.Text := 'INSERT OR REPLACE INTO tblPlayers (SteamID, DisplayName, Address) VALUES (:steamid,:displayname,:address)';
    fdqueryPlayers.ParamByName('steamid').AsString := aSteamID;
    fdqueryPlayers.ParamByName('displayname').AsString := aDisplayName;
    fdqueryPlayers.ParamByName('address').AsString := aAddress;
    fdqueryPlayers.ExecSQL;
    fdconnectionPlayers.Close;
  end;
end;

procedure TDBManager.LogChat(const aSteamID, aDisplayName, aUnixTime, aText: string);
begin
  with dmFireDac do
  begin
    fdconnectionChatLog.Open;
    fdqueryChatLog.Active := False;
    fdqueryChatLog.SQL.Clear;
    fdqueryChatLog.SQL.Text := 'INSERT INTO tblChat (SteamID, DisplayName, DateTime, Message) VALUES (:steamid,:displayname,:time,:message)';
    fdqueryChatLog.ParamByName('steamid').AsString := aSteamID;
    fdqueryChatLog.ParamByName('displayname').AsString := aDisplayName;
    fdqueryChatLog.ParamByName('time').AsString := aUnixTime;
    fdqueryChatLog.ParamByName('message').AsString := aText;
    fdqueryChatLog.ExecSQL;
    fdconnectionChatLog.Close;
  end;
end;

end.

