unit spiral;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox, main;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    TrackBar1: TTrackBar;
    ComboBox2: TComboBox;
    PaintBox1: TPaintBox;
    TrackBar2: TTrackBar;
    Label4: TLabel;
    ScrollBox1: TScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  var loop: Integer=3; threshold:Integer=10; gap:Single=10;
  var centerPoint:TPointF;

implementation

{$R *.fmx}

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
TrackBar2.Value:=1;
loop:=ComboBox1.Selected.Text.ToInteger();
PaintBox1.Repaint();
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
threshold:=ComboBox2.Selected.Text.ToInteger();
PaintBox1.Repaint();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
centerPoint:= TPointF.Create(PaintBox1.Width/2, PaintBox1.Height/2);
threshold:=ComboBox2.Selected.Text.ToInteger();
gap:=TrackBar1.Value;
ComboBox1.ItemIndex:=2;
loop:= ComboBox1.Selected.Text.ToInteger();
end;

procedure TForm1.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);

begin
DrawSpiral(loop, threshold, gap, centerPoint, Canvas);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
gap:=TrackBar1.value;
PaintBox1.Repaint();
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
var zoom:=TrackBar2.value;
PaintBox1.Scale.X:=zoom;
PaintBox1.Scale.Y:=zoom;
end;

end.
