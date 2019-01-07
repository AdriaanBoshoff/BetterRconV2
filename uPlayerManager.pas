unit uPlayerManager;

interface

type
  TPlayerManager = record
    SteamID: string;
    OwnerSteamID: string;
    DisplayName: string;
    Ping: Integer;
    Address: string;
    ConnectedSeconds: Integer;
    VoiationLevel: string;
    CurrentLevel: string;
    UnspentXP: string;
    Health: string;
  end;

  TPlayers = class
  public
    function GetPlayerCount: Integer;
    function IndexOfSteamID(const aSteamID: string): Integer;
    function IndexOfDisplayName(const aDisplayName: string): Integer;
  end;

var
  Players: array of TPlayerManager;
  PlayerManager: TPlayers;

implementation

uses
  ufrmMain, System.SysUtils;

{ TPlayers }

function TPlayers.GetPlayerCount: Integer;
begin
  Result := Length(Players);
end;

function TPlayers.IndexOfDisplayName(const aDisplayName: string): Integer;
var
  I: Integer;
begin
  Result := -1;

  for I := 0 to Length(Players) -1 do
  begin
    if Players[I].DisplayName.Trim = aDisplayName.Trim then
    begin
      Result := I;
      Break
    end;
  end;
end;

function TPlayers.IndexOfSteamID(const aSteamID: string): Integer;
var
  I: Integer;
begin
  Result := -1;

  for I := 0 to Length(Players) -1 do
  begin
    if Players[I].SteamID.Trim = aSteamID.Trim then
    begin
      Result := I;
      Break
    end;
  end;
end;

end.

