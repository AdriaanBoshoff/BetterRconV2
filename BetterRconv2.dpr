program BetterRconv2;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  uPlayerManager in 'uPlayerManager.pas',
  uConsts in 'uConsts.pas',
  uframeConnection in 'uframeConnection.pas' {Frame1: TFrame},
  uProfileManager in 'uProfileManager.pas',
  uIniWrapper in 'uIniWrapper.pas',
  uServerInfo in 'uServerInfo.pas',
  uDatabaseManager in 'uDatabaseManager.pas',
  uDMFireDac in 'uDMFireDac.pas' {dmFireDac: TDataModule},
  uItemsManager in 'uItemsManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmFireDac, dmFireDac);
  Application.Run;
end.
