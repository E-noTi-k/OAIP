unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TSpalshF = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SpalshF: TSpalshF;

implementation

{$R *.dfm}

uses unit7;



procedure TSpalshF.Timer1Timer(Sender: TObject);
begin
Timer1.Enabled:=False;
end;

end.
