unit uDMFireDac;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
  TdmFireDac = class(TDataModule)
    fdconnectionPlayers: TFDConnection;
    sqldriverlinkDB: TFDPhysSQLiteDriverLink;
    fdqueryPlayers: TFDQuery;
    fdconnectionChatLog: TFDConnection;
    fdqueryChatLog: TFDQuery;
    fdgxwtcrsrCursor: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFireDac: TdmFireDac;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmFireDac.DataModuleCreate(Sender: TObject);
begin
  // Create PlayersDB
  fdconnectionPlayers.Params.Database := '.\players.db';
  fdconnectionPlayers.Params.DriverID := 'SQLite';
  fdconnectionPlayers.Connected := True;

  fdqueryPlayers.Active := False;
  fdqueryPlayers.SQL.Text := 'CREATE TABLE IF NOT EXISTS tblPlayers (SteamID STRING UNIQUE, DisplayName STRING, Address STRING);';
  fdqueryPlayers.ExecSQL;
  fdconnectionPlayers.Close;
   // Create chatlog DB
  fdconnectionChatLog.Params.Database := '.\chatlog.db';
  fdconnectionChatLog.Params.DriverID := 'SQLite';
  fdconnectionChatLog.Connected := True;

  fdqueryChatLog.Active := False;
  fdqueryChatLog.SQL.Text := 'CREATE TABLE IF NOT EXISTS tblChat (Server STRING, SteamID STRING, DisplayName STRING, DateTime STRING, Message STRING);';
  fdqueryChatLog.ExecSQL;
  fdconnectionChatLog.Close;
  // Add Server column to chat log table
  fdqueryChatLog.Active := False;
  try
    fdqueryChatLog.SQL.Text := 'ALTER TABLE tblChat ADD COLUMN Server STRING';
    fdqueryChatLog.ExecSQL;
  except
    on E: Exception do
    //TESTS;




  end;
  fdconnectionChatLog.Close;
end;

end.

