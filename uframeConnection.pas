unit uframeConnection;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox, FMX.Edit,
  FMX.Menus;

type
  TFrame1 = class(TFrame)
    rctnglBG: TRectangle;
    pnlConnection: TPanel;
    layoutButons: TLayout;
    btnConnect: TButton;
    btnQuit: TButton;
    lblProfile: TLabel;
    cbbProfile: TComboBox;
    grpAddProfile: TGroupBox;
    edtProfileID: TEdit;
    edtRconIPandPort: TEdit;
    edtRconPassword: TEdit;
    layoutButtons: TLayout;
    btnAddProfile: TButton;
    expndrAddProfile: TExpander;
    pmProfiles: TPopupMenu;
    mniDeleteProfile: TMenuItem;
    procedure btnQuitClick(Sender: TObject);
    procedure expndrAddProfileExpandedChanged(Sender: TObject);
    procedure btnAddProfileClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure mniDeleteProfileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uProfileManager, ufrmMain, HTTPApp;

{$R *.fmx}

procedure TFrame1.btnAddProfileClick(Sender: TObject);
var
  I: Integer;
begin
  ProfileManager.AddProfile(edtProfileID.Text, edtRconIPandPort.Text, edtRconPassword.Text);

  cbbProfile.Clear;
  for I := 0 to Length(Profiles) - 1 do
    cbbProfile.Items.Add(Profiles[I].ProfileID);

  cbbProfile.ItemIndex := cbbProfile.Items.IndexOf(edtProfileID.Text);

  edtProfileID.Text := '';
  edtRconIPandPort.Text := '';
  edtRconPassword.Text := '';

  expndrAddProfile.IsExpanded := False;
end;

procedure TFrame1.btnConnectClick(Sender: TObject);
var
  ID: Integer;
  IP, Port: string;
begin
  if cbbProfile.ItemIndex <> -1 then
  begin
    ID := ProfileManager.IndexOfProfile(cbbProfile.Selected.Text);

    IP := Copy(Profiles[ID].IPandPort, 1, Pos(':', Profiles[ID].IPandPort) - 1);
    Port := Copy(Profiles[ID].IPandPort, Pos(':', Profiles[ID].IPandPort) + 1);

    frmMain.wsClientRcon.Host := IP;
    frmMain.wsClientRcon.Port := Port.ToInteger;
    frmMain.wsClientRcon.Options.Parameters := '/' + HTTPEncode(Profiles[ID].Password);

    frmMain.wsClientRcon.Active := True;
  end
  else
    ShowMessage('Please select a Profile');
end;

procedure TFrame1.btnQuitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrame1.expndrAddProfileExpandedChanged(Sender: TObject);
begin
  if expndrAddProfile.IsExpanded then
  begin
    pnlConnection.Height := 276;
    expndrAddProfile.Height := 172;
  end
  else
  begin
    pnlConnection.Height := 133;
    expndrAddProfile.Height := 29;
  end;
end;

procedure TFrame1.mniDeleteProfileClick(Sender: TObject);
var
  I: Integer;
begin
  ProfileManager.DeleteProfile(ProfileManager.IndexOfProfile(cbbProfile.Selected.Text));

  cbbProfile.Clear;

  for I := 0 to Length(Profiles) - 1 do
    cbbProfile.Items.Add(Profiles[I].ProfileID);

  ProfileManager.SaveProfiles;
end;

end.

