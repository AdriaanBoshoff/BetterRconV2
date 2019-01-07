unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Menus, FMX.TabControl, sgcWebSocket_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  MultiDetailAppearanceU, FMX.Layouts, FMX.Edit, FMX.ScrollBox, FMX.Memo, System.Math.Vectors,
  FMX.Controls3D, FMX.Layers3D, uframeConnection, FMX.Objects, FMX.ListBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FMX.EditBox, FMX.SpinBox,
  FMX.ComboTrackBar;

type
  TfrmMain = class(TForm)
    statMain: TStatusBar;
    mnbrMain: TMenuBar;
    tbcMain: TTabControl;
    tbtmConsole: TTabItem;
    tbtmPlayers: TTabItem;
    tbtmBans: TTabItem;
    wsClientRcon: TsgcWebSocketClient;
    mniDisconnect: TMenuItem;
    lvConsole: TListView;
    stylbkKobi: TStyleBook;
    lvPlayers: TListView;
    lvBans: TListView;
    layoutConsoleMessages: TLayout;
    edtSendConsoleCommand: TEdit;
    btnClearSendRconCommand: TClearEditButton;
    btnSendRconCommand: TEditButton;
    mmoConsoleFillMessage: TMemo;
    mniRefreshPlayerList: TMenuItem;
    pmPlayerlist: TPopupMenu;
    mniAdmin: TMenuItem;
    mniKick: TMenuItem;
    mniRefreshBans: TMenuItem;
    tbcConsole: TTabControl;
    tbtmAll: TTabItem;
    tbtmChat: TTabItem;
    splitter1: TSplitter;
    frmConnection: TFrame1;
    mniRefresh: TMenuItem;
    mmoRconChat: TMemo;
    splitter3: TSplitter;
    edtSendRconChat: TEdit;
    lvRconChat: TListView;
    btnSendChat: TEditButton;
    btnClearSendChat: TClearEditButton;
    mniStyle: TMenuItem;
    mniKobi: TMenuItem;
    mniMaterialOxfordBlue: TMenuItem;
    stylbkMaterialOxfordBlue: TStyleBook;
    stylbkMaterialBlackPearl: TStyleBook;
    mniMaterialBlackPearl: TMenuItem;
    mniClearCerulean: TMenuItem;
    stylbkClearCerulean: TStyleBook;
    tbtmChatMonitor: TTabItem;
    mmoChatMonitorFull: TMemo;
    splitter4: TSplitter;
    pnlChatMonitorOptions: TPanel;
    splitter5: TSplitter;
    lvChatMonitor: TListView;
    layout2: TLayout;
    lblEnableChatMonitor: TLabel;
    switchEnableChatMonitor: TSwitch;
    grpChatMonitorWords: TGroupBox;
    edtAddListeningWord: TEdit;
    btnAddListeningWord: TEditButton;
    lvListeningWords: TListView;
    grpChatMonitorOptions: TGroupBox;
    chkChatMonitorCaseSensitive: TCheckBox;
    pmChatMonitorWords: TPopupMenu;
    mniChatMonitorRemoveWord: TMenuItem;
    mniBanPlayer: TMenuItem;
    pmBans: TPopupMenu;
    mniUnban: TMenuItem;
    mniPlayerlistSelectedPlayer: TMenuItem;
    mniBansSelectedPlayer: TMenuItem;
    tmrPlayerCounter: TTimer;
    tmrServerInfo: TTimer;
    layoutStat1: TLayout;
    layoutStat2: TLayout;
    layoutStat3: TLayout;
    lblServerHostname: TLabel;
    lblPlayersAndEntities: TLabel;
    lblTimeAndMap: TLabel;
    lblFpsAndUptime: TLabel;
    lblNetworking: TLabel;
    lblVersion: TLabel;
    splitter6: TSplitter;
    tbtmSettings: TTabItem;
    lstSettings: TListBox;
    lstheadRcon: TListBoxGroupHeader;
    lstRconLiveServerCounter: TListBoxItem;
    lblLiveServerCounterSettings: TLabel;
    layout3: TLayout;
    lblEnableLiveServerInfo: TLabel;
    switchEnableServerCounter: TSwitch;
    layout4: TLayout;
    lblServerCounterDelay: TLabel;
    trackbarServerCounterTimer: TTrackBar;
    lstPlayerCounter: TListBoxItem;
    lblPlayerCounterSettings: TLabel;
    layout5: TLayout;
    lblPlayerCounterInterval: TLabel;
    trackbarPlayerCounterInterval: TTrackBar;
    lstPerformanceHelper: TListBoxItem;
    lblPerformanceHelper: TLabel;
    lbl1: TLabel;
    layout6: TLayout;
    lblEnablePerformanceHelper: TLabel;
    switchEnablePerformanceHelper: TSwitch;
    layout7: TLayout;
    lbl2: TLabel;
    spinbxFPSLowest: TSpinBox;
    layout8: TLayout;
    lbl3: TLabel;
    spinbxFPSWhenNotEmpty: TSpinBox;
    mniGiveItem: TMenuItem;
    tbcPlayers: TTabControl;
    tbtm1: TTabItem;
    tbtmPlayersDatabase: TTabItem;
    tbtmItemsManager: TTabItem;
    lvDBPlayers: TListView;
    tbtmChatLog: TTabItem;
    lvDBChatLog: TListView;
    mniDonatePaypal: TMenuItem;
    lvRustItems: TListView;
    pnlItems: TPanel;
    lbl4: TLabel;
    lvItemsToGive: TListView;
    btnAddItemToGive: TButton;
    lbl5: TLabel;
    cbbPlayersItems: TComboBox;
    lbl6: TLabel;
    cbbtrackbarItemsAmount: TComboTrackBar;
    btnGiveItems: TButton;
    mmoChatLogFull: TMemo;
    splitter7: TSplitter;
    procedure FormDestroy(Sender: TObject);
    procedure wsClientRconMessage(Connection: TsgcWSConnection; const Text: string);
    procedure btnSendRconCommandClick(Sender: TObject);
    procedure mniRefreshPlayerListClick(Sender: TObject);
    procedure mniKickClick(Sender: TObject);
    procedure mniRefreshBansClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniDisconnectClick(Sender: TObject);
    procedure wsClientRconConnect(Connection: TsgcWSConnection);
    procedure btnSendChatClick(Sender: TObject);
    procedure edtSendConsoleCommandKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtSendRconChatKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure wsClientRconError(Connection: TsgcWSConnection; const Error: string);
    procedure wsClientRconDisconnect(Connection: TsgcWSConnection; Code: Integer);
    procedure wsClientRconException(Connection: TsgcWSConnection; E: Exception);
    procedure mniKobiClick(Sender: TObject);
    procedure mniMaterialOxfordBlueClick(Sender: TObject);
    procedure mniMaterialBlackPearlClick(Sender: TObject);
    procedure mniClearCeruleanClick(Sender: TObject);
    procedure btnAddListeningWordClick(Sender: TObject);
    procedure switchEnableChatMonitorSwitch(Sender: TObject);
    procedure chkChatMonitorCaseSensitiveChange(Sender: TObject);
    procedure lvChatMonitorChange(Sender: TObject);
    procedure mniChatMonitorRemoveWordClick(Sender: TObject);
    procedure mniBanPlayerClick(Sender: TObject);
    procedure mniUnbanClick(Sender: TObject);
    procedure pmPlayerlistPopup(Sender: TObject);
    procedure pmBansPopup(Sender: TObject);
    procedure tmrPlayerCounterTimer(Sender: TObject);
    procedure tmrServerInfoTimer(Sender: TObject);
    procedure lvConsoleChange(Sender: TObject);
    procedure lvRconChatChange(Sender: TObject);
    procedure switchEnableServerCounterSwitch(Sender: TObject);
    procedure trackbarServerCounterTimerChange(Sender: TObject);
    procedure trackbarPlayerCounterIntervalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddItemToGiveClick(Sender: TObject);
    procedure btnGiveItemsClick(Sender: TObject);
  private
    { Private declarations }
    procedure ApplicationOnIdle(Sender: TObject; var Done: Boolean);
    procedure UncheckAllStyles;
    procedure LoadActiveStyle;
    procedure LoadChatMonitorSettings;
    procedure LoadListeningWords;
    procedure SaveListeningWords;
    procedure LoadSettingsTab;
    procedure LoadPlayersDB;
    procedure LoadChatLogDB;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

function SendRconCommand(const aCommand: string; const aIdentifier: string = '0'): Boolean;

implementation

uses
  djson, uPlayerManager, uProfileManager, uConsts, uIniWrapper, StrUtils,
  uServerInfo, uDatabaseManager, udmFireDac, DateUtils, uItemsManager;

{$R *.fmx}

function ExtractText(const aText, aTagLeft, aTagRight: string): string;
var
  s: TStringList;
  iLeft, iRight: Integer;
begin
  s := TStringList.Create;
  try
    s.Text := aText;

    iLeft := Pos(aTagLeft, s.Text) + Length(aTagLeft);
    iRight := Pos(aTagRight, s.Text);

    Result := Copy(s.Text, iLeft, iRight - iLeft);
  finally
    FreeAndNil(s);
  end;
end;

function SecsToTimeStr(const Secs: Integer; const LeadingZero: Boolean = False): string;
begin
  if Secs >= SecsPerHour then
  begin
    if LeadingZero then
      Result := FormatDateTime('hh:nn:ss', Secs / SecsPerDay)
    else
      Result := FormatDateTime('h:n:ss', Secs / SecsPerDay)
  end
  else
  begin
    if LeadingZero then
      Result := FormatDateTime('nn:ss', Secs / SecsPerDay)
    else
      Result := FormatDateTime('n:ss', Secs / SecsPerDay)
  end;
end;

function SendRconCommand(const aCommand: string; const aIdentifier: string = '0'): Boolean;
begin
  if frmMain.wsClientRcon.Active then
  begin
    frmMain.wsClientRcon.WriteData('{' + '"Message": "' + aCommand + '",' + '"Identifier": ' + aIdentifier + ',' + '"Stacktrace": ""' + '}');
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

procedure TfrmMain.ApplicationOnIdle(Sender: TObject; var Done: Boolean);
begin
  if wsClientRcon.Active = True then
  begin
    frmConnection.Visible := False;
  end
  else
  begin
    frmConnection.Visible := True;
  end;
end;

procedure TfrmMain.btnAddItemToGiveClick(Sender: TObject);
var
  LItem: TListViewItem;
  I: Integer;
begin
  lvItemsToGive.BeginUpdate;
  try
    LItem := lvItemsToGive.Items.Add;
    LItem.Text := lvRustItems.Items[lvRustItems.ItemIndex].Data[TMultiDetailAppearanceNames.Detail1].ToString;
    LItem.Detail := 'Amount: ' + cbbtrackbarItemsAmount.Value.ToString;
  finally
    lvItemsToGive.EndUpdate;
  end;
end;

procedure TfrmMain.btnAddListeningWordClick(Sender: TObject);
var
  LItem: TListViewItem;
  s: TStringList;
  I: Integer;
begin
  if not edtAddListeningWord.Text.Trim.IsEmpty then
  begin
    LItem := lvListeningWords.Items.Add;
    LItem.Text := edtAddListeningWord.Text.Trim;
    edtAddListeningWord.Text := '';

    SaveListeningWords;
  end
  else
    ShowMessage('Field seems to be empty.');
end;

procedure TfrmMain.btnGiveItemsClick(Sender: TObject);
var
  I: Integer;
  sPlayer: string;
begin
  sPlayer := cbbPlayersItems.Selected.Text;
  for I := 0 to lvItemsToGive.Items.Count - 1 do
  begin
    SendRconCommand('inventory.giveto \"' + sPlayer + '\" ' + lvItemsToGive.Items[I].Text + ' ' + Trim(Copy(lvItemsToGive.Items[I].Detail, Pos(':', lvItemsToGive.Items[I].Detail) + 1)));
  end;

  lvItemsToGive.Items.Clear;
end;

procedure TfrmMain.btnSendChatClick(Sender: TObject);
begin
  if not edtSendRconChat.Text.IsEmpty then
  begin
    SendRconCommand('say ' + edtSendRconChat.Text);
    edtSendRconChat.Text.Empty;
  end;
end;

procedure TfrmMain.btnSendRconCommandClick(Sender: TObject);
begin
  if not edtSendConsoleCommand.Text.IsEmpty then
  begin
    SendRconCommand(edtSendConsoleCommand.Text.Trim);
    edtSendConsoleCommand.Text.Empty;
  end;
end;

procedure TfrmMain.LoadChatLogDB;
var
  LItem: TListViewItem;
  stemp: string;
begin
  lvDBChatLog.Items.Clear;
  with dmFireDac do
  begin
    fdqueryChatLog.SQL.Text := 'SELECT * FROM tblChat';
    fdqueryChatLog.Active := True;

    fdqueryChatLog.First;
    while not fdqueryChatLog.Eof do
    begin
      LItem := lvDBChatLog.Items.Add;
      LItem.Text := fdqueryChatLog['DisplayName'];
      stemp := fdqueryChatLog['SteamID'];
      LItem.Data[TMultiDetailAppearanceNames.Detail1] := stemp;
      stemp := fdqueryChatLog['DateTime'];
      LItem.Data[TMultiDetailAppearanceNames.Detail2] := DateTimeToStr(UnixToDateTime(stemp.ToInteger));
      stemp := fdqueryChatLog['Message'];
      LItem.Data[TMultiDetailAppearanceNames.Detail3] := stemp;

      fdqueryChatLog.Next;
    end;

    fdqueryChatLog.Active := False;
  end;
end;

procedure TfrmMain.LoadChatMonitorSettings;
begin
  switchEnableChatMonitor.IsChecked := LoadSettingString('Chat Monitor', 'enabled', '0').ToBoolean;
  chkChatMonitorCaseSensitive.IsChecked := LoadSettingString('Chat Monitor', 'case-sensitive', '0').ToBoolean;
end;

procedure TfrmMain.LoadListeningWords;
var
  LItem: TListViewItem;
  sword: string;
  s: TStringList;
begin
  s := TStringList.Create;
  try
    lvListeningWords.Items.Clear;

    s.LoadFromFile('.\listening.data');

    for sword in s do
    begin
      LItem := lvListeningWords.Items.Add;
      LItem.Text := sword;
    end;

  finally
    s.Free;
  end;
end;

procedure TfrmMain.LoadPlayersDB;
var
  LItem: TListViewItem;
  stemp: string;
begin
  lvDBPlayers.Items.Clear;
  with dmFireDac do
  begin
    fdqueryPlayers.SQL.Text := 'SELECT * FROM tblPlayers';
    fdqueryPlayers.Active := True;
    fdqueryPlayers.First;
    while not fdqueryPlayers.Eof do
    begin
      //ShowMessage(fdqueryPlayers['DisplayName']);
      LItem := lvDBPlayers.Items.Add;
      LItem.Text := fdqueryPlayers['DisplayName'];
      stemp := fdqueryPlayers['SteamID'];
      LItem.Data[TMultiDetailAppearanceNames.Detail1] := stemp;
      stemp := fdqueryPlayers['Address'];
      LItem.Data[TMultiDetailAppearanceNames.Detail2] := stemp;
      LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Player in DB';

      fdqueryPlayers.Next;
    end;
    fdqueryPlayers.Active := False;
  end;

  tbtmPlayersDatabase.Text := 'Database [' + lvDBPlayers.Items.Count.ToString + ']';
end;

procedure TfrmMain.LoadSettingsTab;
begin
  switchEnableServerCounter.IsChecked := LoadSettingString('ServerCounter', 'enabled', '-1').ToBoolean;
  trackbarServerCounterTimer.Value := LoadSettingString('ServerCounter', 'interval', '1').ToInteger;
  trackbarPlayerCounterInterval.Value := LoadSettingString('PlayerCounter', 'interval', '30').ToInteger;
end;

procedure TfrmMain.chkChatMonitorCaseSensitiveChange(Sender: TObject);
begin
  SaveSettingString('Chat Monitor', 'case-sensitive', chkChatMonitorCaseSensitive.IsChecked.ToString);
end;

procedure TfrmMain.edtSendConsoleCommandKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
  begin
    if not edtSendConsoleCommand.Text.IsEmpty then
    begin
      SendRconCommand(edtSendConsoleCommand.Text.Trim);
      edtSendConsoleCommand.Text := '';
    end;
  end;
end;

procedure TfrmMain.edtSendRconChatKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
  begin
    if not edtSendRconChat.Text.IsEmpty then
    begin
      SendRconCommand('say ' + edtSendRconChat.Text);
      edtSendRconChat.Text := '';
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  Application.Title := 'Better Rcon';
  Application.OnIdle := ApplicationOnIdle;
  lblVersion.Text := lblVersion.Text + ' ' + APP_VERSION;
  SetLength(Profiles, 0);
  if FileExists(PROFILES_FILE) then
  begin
    ProfileManager.LoadProfiles;

    for I := 0 to Length(Profiles) - 1 do
      frmConnection.cbbProfile.Items.Add(Profiles[I].ProfileID);
  end;

  if FileExists('.\listening.data') then
    LoadListeningWords;

  LoadActiveStyle;
  LoadChatMonitorSettings;
  LoadSettingsTab;

  mmoConsoleFillMessage.WordWrap := True;
  mmoRconChat.WordWrap := True;
  mmoChatMonitorFull.WordWrap := True;

  with TDownloadItems.Create do
  begin
    FreeOnTerminate := True;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  if wsClientRcon.Active then
    wsClientRcon.Connection.Disconnect;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  LoadChatLogDB;
end;

procedure TfrmMain.LoadActiveStyle;
var
  style: string;
begin
  style := LoadSettingString('Style', 'active', 'kobi');

  if style = 'kobi' then
    frmMain.StyleBook := stylbkKobi
  else if style = 'materialoxfordblue' then
    frmMain.StyleBook := stylbkMaterialOxfordBlue
  else if style = 'materialblackpearl' then
    frmMain.StyleBook := stylbkMaterialBlackPearl
  else if style = 'clearcerulean' then
    frmMain.StyleBook := stylbkClearCerulean;
end;

procedure TfrmMain.lvChatMonitorChange(Sender: TObject);
begin
  mmoChatMonitorFull.Text := lvChatMonitor.Items[lvChatMonitor.ItemIndex].Data[TMultiDetailAppearanceNames.Detail3].ToString.Trim;
end;

procedure TfrmMain.lvConsoleChange(Sender: TObject);
begin
  if lvConsole.ItemIndex <> -1 then
    mmoConsoleFillMessage.Text := lvConsole.Items[lvConsole.ItemIndex].Text;
end;

procedure TfrmMain.lvRconChatChange(Sender: TObject);
begin
  if lvRconChat.ItemIndex <> -1 then
    mmoRconChat.Text := lvRconChat.Items[lvRconChat.ItemIndex].Text;
end;

procedure TfrmMain.mniRefreshPlayerListClick(Sender: TObject);
begin
  SendRconCommand('playerlist', '10');
end;

procedure TfrmMain.mniUnbanClick(Sender: TObject);
var
  id: string;
begin
  if lvBans.ItemIndex <> -1 then
  begin
    id := lvBans.Items[lvBans.ItemIndex].Data[TMultiDetailAppearanceNames.Detail1].ToString;
    id := Copy(id, Pos(':', id) + 1);
    SendRconCommand('unban ' + id);
  end;
end;

procedure TfrmMain.pmBansPopup(Sender: TObject);
var
  splayer: string;
  sid: string;
begin
  if lvBans.ItemIndex <> -1 then
  begin
    splayer := lvBans.Items[lvBans.ItemIndex].Text;
    sid := lvBans.Items[lvBans.ItemIndex].Data[TMultiDetailAppearanceNames.Detail1].ToString;
    sid := Copy(sid, Pos(':', sid) + 1);
    mniBansSelectedPlayer.Text := splayer + '  (' + sid + ')';
  end
  else
    mniBansSelectedPlayer.Text := 'No Player Selected!';
end;

procedure TfrmMain.pmPlayerlistPopup(Sender: TObject);
begin
  if lvPlayers.ItemIndex <> -1 then
    mniPlayerlistSelectedPlayer.Text := lvPlayers.Items[lvPlayers.ItemIndex].Text
  else
    mniPlayerlistSelectedPlayer.Text := 'No Player Selected!';
end;

procedure TfrmMain.SaveListeningWords;
var
  s: TStringList;
  I: Integer;
begin
  s := TStringList.Create;
  try
    s.Clear;

    for I := 0 to lvListeningWords.Items.Count - 1 do
      s.Add(lvListeningWords.Items[I].Text);

    s.SaveToFile('.\listening.data');
  finally
    s.Free;
  end;
end;

procedure TfrmMain.switchEnableChatMonitorSwitch(Sender: TObject);
begin
  SaveSettingString('Chat Monitor', 'enabled', switchEnableChatMonitor.IsChecked.ToString);
end;

procedure TfrmMain.switchEnableServerCounterSwitch(Sender: TObject);
begin
  SaveSettingString('ServerCounter', 'enabled', switchEnableServerCounter.IsChecked.ToString);
  tmrServerInfo.Enabled := switchEnableServerCounter.IsChecked;
end;

procedure TfrmMain.tmrPlayerCounterTimer(Sender: TObject);
begin
  if wsClientRcon.Active then
  begin
    SendRconCommand('playerlist', '10');
    SendRconCommand('bans', '11');
  end;
end;

procedure TfrmMain.tmrServerInfoTimer(Sender: TObject);
begin
  if wsClientRcon.Active then
    SendRconCommand('serverinfo', '12');
end;

procedure TfrmMain.trackbarPlayerCounterIntervalChange(Sender: TObject);
begin
  tmrPlayerCounter.Interval := Round(trackbarPlayerCounterInterval.Value * 1000);
  lblPlayerCounterInterval.Text := 'Update Every ' + Round(tmrPlayerCounter.Interval / 1000).ToString + ' second(s):';

  SaveSettingString('PlayerCounter', 'interval', Round(tmrPlayerCounter.Interval / 1000).ToString);
end;

procedure TfrmMain.trackbarServerCounterTimerChange(Sender: TObject);
begin
  tmrServerInfo.Interval := Round(trackbarServerCounterTimer.Value * 1000);
  lblServerCounterDelay.Text := 'Update Every ' + Round(tmrServerInfo.Interval / 1000).ToString + ' second(s):';

  SaveSettingString('ServerCounter', 'interval', Round(tmrServerInfo.Interval / 1000).ToString);
end;

procedure TfrmMain.UncheckAllStyles;
begin
  mniKobi.IsChecked := False;
  mniMaterialOxfordBlue.IsChecked := False;
  mniMaterialBlackPearl.IsChecked := False;
  mniClearCerulean.IsChecked := False;
end;

procedure TfrmMain.mniRefreshBansClick(Sender: TObject);
begin
  SendRconCommand('bans', '11');
end;

procedure TfrmMain.mniBanPlayerClick(Sender: TObject);
begin
  if lvPlayers.ItemIndex <> -1 then
  begin
    SendRconCommand('ban \"' + Players[PlayerManager.IndexOfSteamID(ExtractText(lvPlayers.Items[lvPlayers.Selected.Index].Text, '(', ')'))].SteamID + '\"');
  end;
end;

procedure TfrmMain.mniChatMonitorRemoveWordClick(Sender: TObject);
begin
  if lvListeningWords.ItemIndex <> -1 then
  begin
    lvListeningWords.Items.Delete(lvListeningWords.Selected.Index);
    SaveListeningWords;
  end;
end;

procedure TfrmMain.mniClearCeruleanClick(Sender: TObject);
begin
  UncheckAllStyles;
  mniClearCerulean.IsChecked := True;

  frmMain.StyleBook := stylbkClearCerulean;

  SaveSettingString('Style', 'active', 'clearcerulean');

  ShowMessage('It''s recommended to restart the application to avoid issues.');
end;

procedure TfrmMain.mniDisconnectClick(Sender: TObject);
begin
  if wsClientRcon.Active then
    wsClientRcon.Connection.Disconnect;
end;

procedure TfrmMain.mniKickClick(Sender: TObject);
begin
  if lvPlayers.ItemIndex <> -1 then
  begin
    SendRconCommand('kick \"' + Players[PlayerManager.IndexOfSteamID(ExtractText(lvPlayers.Items[lvPlayers.Selected.Index].Text, '(', ')'))].SteamID + '\"');
  end;
end;

procedure TfrmMain.mniKobiClick(Sender: TObject);
begin
  UncheckAllStyles;
  mniKobi.IsChecked := True;

  frmMain.StyleBook := stylbkKobi;

  SaveSettingString('Style', 'active', 'kobi');

  ShowMessage('It''s recommended to restart the application to avoid issues.');
end;

procedure TfrmMain.mniMaterialBlackPearlClick(Sender: TObject);
begin
  UncheckAllStyles;
  mniMaterialBlackPearl.IsChecked := True;

  frmMain.StyleBook := stylbkMaterialBlackPearl;

  SaveSettingString('Style', 'active', 'materialblackpearl');

  ShowMessage('It''s recommended to restart the application to avoid issues.');
end;

procedure TfrmMain.mniMaterialOxfordBlueClick(Sender: TObject);
begin
  UncheckAllStyles;
  mniMaterialOxfordBlue.IsChecked := True;

  frmMain.StyleBook := stylbkMaterialOxfordBlue;

  SaveSettingString('Style', 'active', 'materialoxfordblue');

  ShowMessage('It''s recommended to restart the application to avoid issues.');
end;

procedure TfrmMain.wsClientRconConnect(Connection: TsgcWSConnection);
begin
  SendRconCommand('playerlist', '10');
  SendRconCommand('bans', '11');
  SendRconCommand('serverinfo', '12');
end;

procedure TfrmMain.wsClientRconDisconnect(Connection: TsgcWSConnection; Code: Integer);
begin
  lvConsole.Items.Clear;
  lvPlayers.Items.Clear;
  lvBans.Items.Clear;
  lvRconChat.Items.Clear;
  mmoConsoleFillMessage.Lines.Clear;
  mmoRconChat.Lines.Clear;
  tbtmPlayers.Text := 'Players';
  tbtmBans.Text := 'Bans';
end;

procedure TfrmMain.wsClientRconError(Connection: TsgcWSConnection; const Error: string);
begin
  if Error = 'Error Decoding Header: Switching Protocols [HTTP/1.1 501 Not Implemented]' then
    ShowMessage('Invalid Password')
  else
    ShowMessage('Unknown Error:' + sLineBreak + sLineBreak + Error);
end;

procedure TfrmMain.wsClientRconException(Connection: TsgcWSConnection; E: Exception);
begin
  if E.Message = 'Socket Error # 11001' + sLineBreak + 'Host not found.' then
    ShowMessage('ERROR: Connection to ' + wsClientRcon.Host + ':' + wsClientRcon.Port.ToString + ' failed!' + sLineBreak + sLineBreak + 'Please check your rcon IP and Port.');
end;

procedure TfrmMain.wsClientRconMessage(Connection: TsgcWSConnection; const Text: string);
var
  jdata, jchat, jplayers, jplayer, jserverinfo: TdJSON;
  LItem: TListViewItem;
  I: Integer;
  fps: string;
  bfounddb: Boolean;
  steamid: string;
  fs: TFormatSettings;
begin
  fs.DecimalSeparator := '.';
  lvConsole.BeginUpdate;
  if not Text.IsEmpty then
  begin
    jdata := TdJSON.Parse(Text);
    try
{$REGION 'Playerlist'}
      if jdata['Identifier'].AsInteger = 10 then
      begin
        lvPlayers.BeginUpdate;
        lvPlayers.Items.Clear;
        lvPlayers.EndUpdate;

        jplayers := TdJSON.Parse(jdata['Message'].AsString);
        try
          I := 0;

          for jplayer in jplayers do
          begin
            Inc(I);
          end;

          SetLength(Players, I);
          I := 0;
          cbbPlayersItems.Items.Clear;
          for jplayer in jplayers do
          begin
            Players[I].steamid := jplayer['SteamID'].AsString;
            Players[I].OwnerSteamID := jplayer['OwnerSteamID'].AsString;
            Players[I].DisplayName := jplayer['DisplayName'].AsString;
            Players[I].Ping := jplayer['Ping'].AsInteger;
            Players[I].Address := jplayer['Address'].AsString;
            Players[I].ConnectedSeconds := jplayer['ConnectedSeconds'].AsInteger;
            Players[I].VoiationLevel := jplayer['VoiationLevel'].AsString;
            Players[I].CurrentLevel := jplayer['CurrentLevel'].AsString;
            Players[I].UnspentXP := jplayer['UnspentXp'].AsString;
            Players[I].Health := jplayer['Health'].AsString;

            LItem := lvPlayers.Items.Add;
            LItem.Text := Players[I].DisplayName + '  (' + Players[I].steamid + ')';
            LItem.Data[TMultiDetailAppearanceNames.Detail1] := 'IP: ' + Players[I].Address;
            LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'Ping: ' + Players[I].Ping.ToString + 'ms';
            LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Connected for ' + SecsToTimeStr(Players[I].ConnectedSeconds, True);

            steamid := Players[I].steamid.Trim;
            if steamid.Trim = '0' then
              steamid := Players[I].OwnerSteamID.Trim;

            if steamid.Trim = '0' then
              steamid := 'UNKNOWN';

            dbManager.InserPlayerIfNotExists(steamid, Players[I].DisplayName, Players[I].Address);
            cbbPlayersItems.Items.Add(jplayer['DisplayName'].AsString);

            Inc(I);
          end;
        finally
          jplayers.Free;
        end;
        tbtmPlayers.Text := 'Players [' + PlayerManager.GetPlayerCount.ToString + ']';

        LoadPlayersDB;
      end
{$ENDREGION}
{$REGION 'Bans'}
      else if jdata['Identifier'].AsInteger = 11 then
      begin
        lvBans.BeginUpdate;
        lvBans.Items.Clear;
        lvBans.EndUpdate;

        jplayers := TdJSON.Parse(jdata['Message'].AsString);
        try
          for jplayer in jplayers do
          begin
            LItem := lvBans.Items.Add;
            LItem.Text := jplayer['username'].AsString;
            LItem.Data[TMultiDetailAppearanceNames.Detail1] := 'SteamID: ' + jplayer['steamid'].AsString;
            LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'Group: ' + jplayer['group'].AsString;
            LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Notes: ' + jplayer['notes'].AsString;
          end;
        finally
          jplayers.Free;
        end;

        tbtmBans.Text := 'Bans: [' + lvBans.Items.Count.ToString + ']';
      end
{$ENDREGION}
{$REGION 'Server Info'}
      else if jdata['Identifier'].AsInteger = 12 then
      begin
        jserverinfo := TdJSON.Parse(jdata['Message'].AsString);
        try
          ServerInfo.Hostname := jserverinfo['Hostname'].AsString;
          ServerInfo.MaxPlayers := jserverinfo['MaxPlayers'].AsInteger;
          ServerInfo.Players := jserverinfo['Players'].AsInteger;
          ServerInfo.Queued := jserverinfo['Queued'].AsInteger;
          ServerInfo.Joining := jserverinfo['Joining'].AsInteger;
          ServerInfo.EntityCount := jserverinfo['EntityCount'].AsInteger;
          ServerInfo.GameTime := jserverinfo['GameTime'].AsString;
          ServerInfo.UpTime := jserverinfo['Uptime'].AsInteger;
          ServerInfo.Map := jserverinfo['Map'].AsString;
          //fps := StringReplace(jserverinfo['Framerate'].AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]);
          ServerInfo.FrameRate := Round(StrToFloat(jserverinfo['Framerate'].AsString, fs));
          ServerInfo.Memory := jserverinfo['Memory'].AsInteger;
          ServerInfo.Collections := jserverinfo['Collections'].AsInteger;
          ServerInfo.NetworkIn := jserverinfo['NetworkIn'].AsInteger;
          ServerInfo.NetworkOut := jserverinfo['NetworkOut'].AsInteger;
          ServerInfo.Restarting := jserverinfo['Restarting'].AsBoolean;
          ServerInfo.SaveCreatedTime := jserverinfo['SaveCreatedTime'].AsString;

          Application.Title := ServerInfo.Hostname;

          lblServerHostname.Text := ServerInfo.Hostname;
          lblPlayersAndEntities.Text := 'Players: ' + ServerInfo.Players.ToString + '/' + ServerInfo.MaxPlayers.ToString + ' (' + ServerInfo.Queued.ToString + ' Queued) (' + ServerInfo.Joining.ToString + ' Joining), ' + ServerInfo.EntityCount.ToString + ' Entities';
          lblTimeAndMap.Text := 'GameTime: ' + ServerInfo.GameTime + ',  ' + ServerInfo.Map;
          lblFpsAndUptime.Text := ServerInfo.FrameRate.ToString + ' fps, ' + SecsToTimeStr(ServerInfo.UpTime, True) + ' uptime';
          lblNetworking.Text := IntToStr(Round(ServerInfo.NetworkIn / 1024)) + 'kb/s in, ' + IntToStr(Round(ServerInfo.NetworkOut / 1024)) + 'kb/s out';
          lblVersion.Text := 'Version: ' + APP_VERSION;

          if switchEnablePerformanceHelper.IsChecked then
          begin
            if ServerInfo.Players = 0 then
              SendRconCommand('fps.limit ' + spinbxFPSLowest.Value.ToString, '1')
            else
              SendRconCommand('fps.limit ' + spinbxFPSWhenNotEmpty.Value.ToString, '1');
          end;

        finally
          jserverinfo.Free;
        end;
      end
{$ENDREGION}
{$REGION 'Other'}
      else
      begin
{$REGION 'Other than Chat'}
        if (jdata['Type'].AsString <> 'Chat') and (jdata['Identifier'].AsInteger <> 1) then
        begin
          if not jdata['Message'].AsString.Trim.IsEmpty then
          begin
            LItem := lvConsole.Items.Add;
            LItem.Text := '[' + DateTimeToStr(Now) + '] ' + jdata['Message'].AsString;

            lvConsole.ItemIndex := LItem.Index;

            if (AnsiContainsStr(jdata['Message'].AsString, 'joined')) or (AnsiContainsStr(jdata['Message'].AsString, 'disconnecting:')) or (AnsiContainsStr(jdata['Message'].AsString, 'Kicked:')) then
            begin
              SendRconCommand('playerlist', '10');
              SendRconCommand('bans', '11');
              SendRconCommand('serverinfo', '12');
            end;
            if (AnsiContainsStr(jdata['Message'].AsString, 'Unbanned')) or (AnsiContainsStr(jdata['Message'].AsString, 'Kickbanned')) then
            begin
              SendRconCommand('bans', '11');
              SendRconCommand('playerlist', '10');
              SendRconCommand('serverinfo', '12');
            end;
          end;
          tbtmAll.Text := 'All [' + lvConsole.Items.Count.ToString + ']';
        end;
{$ENDREGION}
{$REGION 'Chat'}
        if jdata['Type'].AsString = 'Chat' then
        begin
          jchat := TdJSON.Parse(jdata['Message'].AsString);
          try
            LItem := lvRconChat.Items.Add;
            LItem.Text := '[' + DateTimeToStr(Now) + '] ' + jchat['Username'].AsString + ': ' + jchat['Message'].AsString;

            lvRconChat.ItemIndex := LItem.Index;

            dbManager.LogChat(jchat['UserId'].AsString, jchat['Username'].AsString, jchat['Time'].AsString.Trim, jchat['Message'].AsString);

            LItem := lvDBChatLog.Items.Add;
            LItem.Text := jchat['Username'].AsString;
            LItem.Data[TMultiDetailAppearanceNames.Detail1] := jchat['UserId'].AsString;
            LItem.Data[TMultiDetailAppearanceNames.Detail2] := DateTimeToStr(UnixToDateTime(jchat['Time'].AsString.ToInt64));
            LItem.Data[TMultiDetailAppearanceNames.Detail3] := jchat['Message'].AsString;

{$REGION 'Chat Monitor'}
            if switchEnableChatMonitor.IsChecked then
            begin
              for I := 0 to lvListeningWords.Items.Count - 1 do
              begin
                if chkChatMonitorCaseSensitive.IsChecked then
                begin
                  if AnsiContainsStr(jchat['Message'].AsString, lvListeningWords.Items[I].Text) then
                  begin
                    LItem := lvChatMonitor.Items.Add;
                    LItem.Text := jchat['Username'].AsString;
                    LItem.Data[TMultiDetailAppearanceNames.Detail1] := 'SteamID: ' + jchat['UserId'].AsString;
                    LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'Time: ' + DateTimeToStr(Now);
                    LItem.Data[TMultiDetailAppearanceNames.Detail3] := jchat['Message'].AsString;
                  end;
                end
                else
                begin
                  if AnsiContainsStr(UpperCase(jchat['Message'].AsString), UpperCase(lvListeningWords.Items[I].Text)) then
                  begin
                    LItem := lvChatMonitor.Items.Add;
                    LItem.Text := jchat['Username'].AsString;
                    LItem.Data[TMultiDetailAppearanceNames.Detail1] := 'SteamID: ' + jchat['UserId'].AsString;
                    LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'Time: ' + DateTimeToStr(Now);
                    LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Flagged Message: ' + jchat['Message'].AsString;
                  end;
                end;
              end;
            end;
{$ENDREGION}
          finally
            jchat.Free;
          end;
          tbtmChat.Text := 'Chat [' + lvRconChat.Items.Count.ToString + ']';
          tbtmChatMonitor.Text := 'Chat Monitor [' + lvChatMonitor.Items.Count.ToString + ']';
        end;
{$ENDREGION}
      end;
{$ENDREGION}
    finally
      jdata.Free;
    end;
  end;
  lvConsole.EndUpdate;
end;

end.

