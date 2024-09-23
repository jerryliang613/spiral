unit main;

interface
uses System.Types, System.UITypes,FMX.Graphics;

procedure DrawSpiral( loop: Integer; threshold:integer; gap:Single; centerPoint:TPointF; Canvas:TCanvas);
implementation
procedure DrawSpiral(loop: Integer; threshold:integer; gap:Single; centerPoint:TPointF; Canvas:TCanvas);
var
  i, j, _loop: Integer;
  x, y, x1, y1, angle, angle1: Single;

begin
  _loop := 0;
  i := 0;
  var p:=pi();
  var
  a:=10;

  while true do
  begin
    angle := 0.1 * i;
    angle1 := 0.1 * (i + 1);

    if  angle/(2*p)>loop then
    begin
        _loop := _loop + 1;
        if _loop = loop then
        begin
          break;
        end;
        end;

    x := (a + gap * angle) * cos(angle);
    y := (a + gap * angle) * sin(angle);
    x1 := (a + gap * angle1) * cos(angle1);
    y1 := (a + gap * angle1) * sin(angle1);

    var
    startPoint := TPointF.Create(x + centerPoint.X, y + centerPoint.Y);
    var
    endPoint := TPointF.Create(x1 + centerPoint.X, y1 + centerPoint.Y);

    Canvas.Stroke.Create(TBrushKind.Solid, TAlphaColor($FF800000));
    Canvas.Stroke.Thickness:=5;
    Canvas.DrawLine(startPoint, startPoint, 100);
    Canvas.DrawLine(endPoint, endPoint, 100);

    Canvas.Stroke.Create(TBrushKind.Solid, TAlphaColor($FFC0C0C0));
    Canvas.DrawLine(startPoint, endPoint, 100);
    var
      newx, newy: Single;
    var
      newPoint: TPointF;
    var
    sweepangle := 0.1/(threshold+1);
    for j := 1 to threshold do
    begin
      newx :=  (a + gap * (angle+sweepangle*j)) * cos(angle+sweepangle*j);
      newy :=  (a + gap * (angle+sweepangle*j)) * sin(angle+sweepangle*j);
      newPoint := TPointF.Create(newx + centerPoint.X, newy + centerPoint.Y);
      Canvas.Stroke.Create(TBrushKind.Solid, TAlphaColor($FF000080));
      Canvas.Stroke.Thickness:=1;
      Canvas.DrawLine(newPoint, newPoint, 50)
    end;
    i:=i+1;
  end;

end;

end.
