unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MMSYSTEM;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.Button1Click(Sender: TObject);
begin
Form2.Hide;
Form1.Show;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
Label1.Caption := Form1.Edit1.Text; // tekst wiadomości
PlaySound('tada.waw',0, SND_ASYNC);// звуковой сигнал
end;

end.
