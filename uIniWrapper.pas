unit uIniWrapper;

interface

procedure SaveSettingString(const aSection, aKey, aValue: string);

function LoadSettingString(const aSection, aKey, aValue: string): string;

implementation

uses
  IniFiles, uConsts;

procedure SaveSettingString(const aSection, aKey, aValue: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(INI_FILE);
  try
    ini.WriteString(aSection, aKey, aValue);
  finally
    ini.Free;
  end;
end;

function LoadSettingString(const aSection, aKey, aValue: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(INI_FILE);
  try
    Result := ini.ReadString(aSection, aKey, aValue);
  finally
    ini.Free;
  end;
end;

end.

