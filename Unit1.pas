unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,ShellApi, Vcl.StdCtrls,DateUtils,
  Vcl.MPlayer, System.Notification;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    LabelHour: TLabel;
    UpDown1: TUpDown;
    EditH: TEdit;
    EditM: TEdit;
    UpDown2: TUpDown;
    Timer1: TTimer;
    Label3: TLabel;
    LabelMinute: TLabel;
    MediaPlayer1: TMediaPlayer;

    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure  CreateTrayIcon(n: integer; Tip: String);
    procedure DeleteTrayIcon(n: integer);
    procedure SetSound;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses Unit2;
Var
Hour, Min: word;
AlHour, AlMin: word;
  MediaPlayer : TMediaPlayer;
const
WM_MYTRAYNOTIFY = WM_USER +123;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
AlHour := StrToInt(EditH.Text);
AlMin := StrToInt(EditM.Text);

Timer1.Tag := 1;
CreateTrayIcon(1,'Budzik ' + EditH.Text + ':'+ EditM.Text);
Form1.Hide;
Timer1.Interval := 3000;

end;

procedure TForm1.CreateTrayIcon(n: integer; Tip: String);
var
nidata: TNotifyIconData;
begin
 FillChar(nidata, SizeOf(nidata), 0); //Zerowanie struktury

  with nidata do
  begin
    cbSize := TNotifyIconData.SizeOf; // Ustawienie rozmiaru
    Wnd := Self.Handle;
    uID := n; // Numer ikonki
    uFlags := NIF_ICON or NIF_MESSAGE or NIF_TIP;
    uCallbackMessage := WM_MYTRAYNOTIFY;
    hIcon := Application.Icon.Handle;

    // Kopiowanie tekstu do szTip
    StrPLCopy(szTip, Tip, Length(szTip) - 1);
  end;

  // Dodanie ikony do obszaru powiadomień
  Shell_NotifyIcon(NIM_ADD, @nidata);
end;

procedure TForm1.DeleteTrayIcon(n: integer);
var
nidata: TNotifyIconData;
begin
with nidata do
begin
  cbSize :=  TNotifyIconData.SizeOf; ;
  Wnd := Self.Handle;
  uId := n;
end;
  Shell_NotifyIcon(NIM_DELETE,@nidata);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DeleteTrayIcon(1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Hour := HourOf(Now);
  Min := MinuteOf(Now);
  LabelHour.Caption := IntToStr(Hour);
  LabelMinute.Caption := IntToStr(Min);
  if Min <10
  then LabelMinute.Caption := '0' + IntToStr(Min)
else
  LabelMinute.Caption :=  IntToStr(Min);
  SetSound;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Hour := HourOf(Now);
  Min := MinuteOf(Now);
  LabelHour.Caption := IntToStr(Hour);
  LabelMinute.Caption := IntToStr(Min);
  if Min <10
  then LabelMinute.Caption := '0' + IntToStr(Min)
else
  LabelMinute.Caption :=  IntToStr(Min);
  SetSound;
end;


procedure TForm1.SetSound;
var
pWinDir: Pchar;
sWinDir: String[80];
begin
  MediaPlayer := TMediaPlayer.Create(Form1);
  MediaPlayer.ParentWindow := Form1.Handle;
  MediaPlayer.Visible := False;
  GetMem(pWinDir,80);
  GetWindowsDirectory(pWindir,80);
  sWinDir := pWindir;
  //otwórz waw
  if ParamStr(1) = ''then
  MediaPlayer.FileName := 'Sound.wav'
  else
    MediaPlayer.FileName := sWinDir + '\media\' + ParamStr(1);
  try
    MediaPlayer.Open;
  except
    on EMCIDeviceError do;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
cHour, cMin: word;
begin
  //Aktualny czas
  cHour := HourOf(Now);
  cMin := MinuteOf(Now);
  if Timer1.Tag = 0
  then
  begin
  if cHour <> Hour then
  begin
    Hour := cHour;
    Label1.Caption := IntToStr(Hour);
  end;

  if cMin <> Min then
  begin
    Min := cMin;
    if min <10
  then LabelHour.Caption := '0' + IntToStr(Min)
  else
    LabelHour.Caption := IntToStr(Min);
  end;

  if Label3.Visible then
  Label3.Visible := False
  else
    Label3.Visible := True;
  end
  else
    if (cHour = AlHour) and (cMin = AlMin) then
  begin
  Form2.Show;
  Timer1.Tag := 0;
  Timer1.Interval := 1000;
  end;
end;


procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
if UpDown1.Position <10 then
   EditH.Text := '0' + IntToStr(UpDown1.Position)
   else
   EditH.Text := IntToStr(UpDown1.Position)
end;

procedure TForm1.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
if UpDown2.Position <10 then
   EditM.Text := '0' + IntToStr(UpDown2.Position)
   else
   EditM.Text := IntToStr(UpDown2.Position)
end;

end.
