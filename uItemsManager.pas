unit uItemsManager;

interface

uses
  System.Types, System.Classes;

type
  TDownloadItems = class(TThread)
  protected
    procedure Execute; override;
  end;

implementation

uses
  djson, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, MultiDetailAppearanceU, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ufrmMain, SysUtils;

{ TDownloadItems }

procedure TDownloadItems.Execute;
var
  jdata, jcategories: TdJSON;
  http: TIdHTTP;
  LItem: TListViewItem;
  sCategories: TStringList;
  I: Integer;
  arrCategories: array of string;
begin
  SetLength(arrCategories, 0);
  http := TIdHTTP.Create(nil);
  try
    jdata := TdJSON.Parse(http.Get('http://qs.quantumsoftware.co.za/rust/items.json'));
    try
      sCategories := TStringList.Create;
      try
        sCategories.Sorted := True;
        sCategories.Duplicates := dupIgnore;

        for jcategories in jdata do
        begin
          sCategories.Add(jcategories['category'].AsString);
        end;

        SetLength(arrCategories, sCategories.Count);

        for I := 0 to sCategories.Count - 1 do
          arrCategories[I] := sCategories[I]

      finally
        sCategories.Free;
      end;

      Synchronize(
        procedure
        var
          acategory: string;
          jItems: TdJSON;
        begin
          frmMain.lvRustItems.BeginUpdate;
          for acategory in arrCategories do
          begin
            with frmMain.lvRustItems.Items.Add do
            begin
              Text := acategory;
              Purpose := TListItemPurpose.Header;
            end;
            for jItems in jdata do
            begin
              if jItems['category'].AsString = acategory then
              begin
                LItem := frmMain.lvRustItems.Items.Add;
                LItem.Text := jItems['displayName'].AsString;
                LItem.Data[TMultiDetailAppearanceNames.Detail1] := jItems['name'].AsString;
                LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'Rarity: ' + jItems['rarity'].AsString;
                LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Stackable: ' + jItems['stackable'].AsString;
              end;
            end;
          end;
          frmMain.lvRustItems.EndUpdate;
        end);
    finally
      jdata.Free;
    end;
  finally
    http.Free;
  end;
end;

end.

