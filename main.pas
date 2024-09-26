unit main;

interface
uses System.Types, System.UITypes,FMX.Graphics;

procedure DrawSpiral( loop: Integer; threshold:integer; gap:Single; centerPoint:TPointF; Canvas:TCanvas);
implementation

function GeneratePoint(angle:single; gap:single; centerPoint:TPointF):TPointF;
begin
     var x := gap*(1 + angle)* cos(angle);
     var y := gap*(1 + angle)* sin(angle);
     result:=TPointF.Create(x+centerPoint.X, y+centerPoint.Y);
end;

procedure DrawLine(startPoint:TPointF;endPoint:TPointF;thickness:single;color:TAlphaColor; Canvas:TCanvas);
begin
          Canvas.Stroke.Create(TBrushKind.Solid, TAlphaColor(color));
          Canvas.Stroke.Thickness:=thickness;
          Canvas.DrawLine(startPoint, endPoint, 100);
end;

procedure DrawSpiral(loop: Integer; threshold:integer; gap:Single; centerPoint:TPointF; Canvas:TCanvas);

begin
  var p:=pi();
  var a:=2; var b:=5;
  var angle:= 2*p*loop/threshold;

  for var i := 0 to threshold-2 do
    begin
        var angle1:=angle*i;
        var angle2:= angle*(i+1);
        var
          startPoint := GeneratePoint(angle1, gap, centerPoint);
        var
          endPoint := GeneratePoint(angle2,gap,centerPoint);

          DrawLine(startPoint, startPoint,3,TAlphacolor($FF800000), Canvas );
          DrawLine(endPoint, endPoint,3,TAlphacolor($FF800000), Canvas );
          DrawLine(startPoint, endPoint, 1,TAlphaColor($FF000080 ), Canvas);

        var sweepangle:=angle/10;
        for var j := 0 to 9 do
          begin
            var spiralStart :=GeneratePoint(angle1+sweepangle*j, gap,centerPoint);
            var spiralEnd := GeneratePoint(angle1+sweepangle*(j+1), gap,centerPoint);
            DrawLine(spiralStart, spiralEnd,1,TAlphaColor($FFc0c0c0 ),Canvas);
          end;
    end

end;

end.
