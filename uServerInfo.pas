unit uServerInfo;

interface

type
  TServerInfo = record
    Hostname: string;
    MaxPlayers: Integer;
    Players: Integer;
    Queued: Integer;
    Joining: Integer;
    EntityCount: Integer;
    GameTime: string;
    UpTime: LongInt;
    Map: string;
    FrameRate: Integer;
    Memory: Integer;
    Collections: Integer;
    NetworkIn: Integer;
    NetworkOut: Integer;
    Restarting: Boolean;
    SaveCreatedTime: string;
  end;

var
  ServerInfo: TServerInfo;

implementation

end.

