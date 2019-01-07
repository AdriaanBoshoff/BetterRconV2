unit uProfileManager;

interface

type
  TProfileManager = record
    ProfileID: string;
    IPandPort: string;
    Password: string;
  end;

  TProfileArray = array of TProfileManager;

  TProfiles = class
  public
    procedure LoadProfiles;
    procedure SaveProfiles;
    procedure AddProfile(const aProfileID, aIPandPort, aPassword: string);
    procedure DeleteProfile(const aIndex: Cardinal);
    function IndexOfProfile(const aProfileID: string): Integer;
  end;

var
  Profiles: array of TProfileManager;
  ProfileManager: TProfiles;

implementation

uses
  djson, System.SysUtils, System.Classes, System.JSON.Types, System.JSON.Writers,
  uConsts;

{ TProfiles }

procedure TProfiles.AddProfile(const aProfileID, aIPandPort, aPassword: string);
begin
  SetLength(Profiles, Length(Profiles) + 1);
  Profiles[High(Profiles)].ProfileID := aProfileID;
  Profiles[High(Profiles)].IPandPort := aIPandPort;
  Profiles[High(Profiles)].Password := aPassword;

  SaveProfiles;
end;

procedure TProfiles.DeleteProfile(const aIndex: Cardinal);
var
  ALength: Cardinal;
  i: Cardinal;
begin
  ALength := Length(Profiles);
  Assert(ALength > 0);
  Assert(aIndex < ALength);
  for i := aIndex + 1 to ALength - 1 do
    Profiles[i - 1] := Profiles[i];
  SetLength(Profiles, ALength - 1);
end;

function TProfiles.IndexOfProfile(const aProfileID: string): Integer;
var
  I: Integer;
begin
  Result := -1;

  for I := 0 to Length(Profiles) do
  begin
    if Profiles[I].ProfileID = aProfileID then
    begin
      Result := I;
      Break
    end;
  end;
end;

procedure TProfiles.LoadProfiles;
var
  jdata, jprofiles: TdJSON;
  s: TStringList;
begin
  s := TStringList.Create;
  try
    s.LoadFromFile(PROFILES_FILE);

    jdata := TdJSON.Parse(s.Text);
    try
      for jprofiles in jdata do
      begin
        ProfileManager.AddProfile(jprofiles['id'].AsString, jprofiles['address'].AsString, jprofiles['password'].AsString);
      end;
    finally
      jdata.Free;
    end;
  finally
    s.Free;
  end;
end;

procedure TProfiles.SaveProfiles;
var
  Writer: TJsonTextWriter;
  StringWriter: TStringWriter;
  I: Integer;
  s: TStringList;
begin
  StringWriter := TStringWriter.Create();
  Writer := TJsonTextWriter.Create(StringWriter);
  Writer.Formatting := TJsonFormatting.Indented;
  try
    s := TStringList.Create;
    try
      Writer.WriteStartArray;

      for I := 0 to Length(Profiles) - 1 do
      begin
        Writer.WriteStartObject;
        Writer.WritePropertyName('id');
        Writer.WriteValue(Profiles[I].ProfileID);
        Writer.WritePropertyName('address');
        Writer.WriteValue(Profiles[I].IPandPort);
        Writer.WritePropertyName('password');
        Writer.WriteValue(Profiles[I].Password);
        Writer.WriteEndObject;
      end;

      Writer.WriteEndArray;

      s.Text := StringWriter.ToString;

      s.SaveToFile(PROFILES_FILE);
    finally
      s.Free;
    end;
  finally
    StringWriter.Free;
    Writer.Free;
  end;
end;

end.

