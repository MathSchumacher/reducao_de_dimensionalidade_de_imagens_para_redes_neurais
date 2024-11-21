unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Direct2D, StdCtrls;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OnPaint(var msg : TMessage); message WM_PAINT;
    procedure OnResize(var msg: TMessage); message WM_SIZE;
  end;

var
  Form1: TForm1;
  factory : ID2D1Factory;
  renderer : ID2D1HwndRenderTarget;
  brush1 : ID2D1SolidColorBrush;
implementation

{$R *.dfm}

procedure TForm1.OnResize(var msg : TMessage);
var d2dsize : D2D_SIZE_U;
begin
        d2dsize.width := msg.LParam and $FFFF;
        d2dsize.height := msg.LParam shr 16;
        if renderer = nil then
                exit;

        renderer.Resize(@d2dsize);
        RedrawWindow(Form1.Handle,nil,0,RDW_INVALIDATE Or RDW_UPDATENOW);

end;


procedure TForm1.OnPaint(var msg : TMessage);
var
   ellipse : D2D1_ELLIPSE;
   hdefer : Cardinal;
   color : D2D_COLOR_F;
begin
        ValidateRect(Form1.Handle,nil);

        //#dc143c RGB
        color.r := $dc / $FF;
        color.g := $14 / $FF;
        color.b := $3C / $FF;
        color.a := 1;

        brush1.SetColor(@color);
        renderer.BeginDraw();

        renderer.Clear();

        ellipse.point.x := Form1.Width / 2;
        ellipse.point.y := Form1.Height / 2;
        ellipse.radiusX := 200;
        ellipse.radiusY := 200;

        renderer.FillEllipse(@ellipse,brush1);

        renderer.EndDraw();

        msg.Result := 0;
end;


procedure TForm1.FormCreate(Sender: TObject);
var
        dbglvl : D2D1_DEBUG_LEVEL;
        renderProp : D2D1_RENDER_TARGET_PROPERTIES;
        hwndProp : D2D1_HWND_RENDER_TARGET_PROPERTIES;
        color : D2D_COLOR_F;
        result : HRESULT;
begin
        result := D2D1CreateFactory(D2D1_FACTORY_TYPE_SINGLE_THREADED,@IID_ID2D1Factory, @dbglvl,@factory);

        if result <> 0 then
              Exit;

        renderProp.pixelFormat.format := DXGI_FORMAT_R8G8B8A8_UNORM;
        renderProp.pixelFormat.alphaMode := D2D1_ALPHA_MODE_PREMULTIPLIED;
        renderProp.rtype := D2D1_RENDER_TARGET_TYPE_DEFAULT;
        renderProp.usage := D2D1_RENDER_TARGET_USAGE_NONE;
        renderProp.minLevel := D2D1_FEATURE_LEVEL_DEFAULT;
        renderProp.dpiX := 96;
        renderProp.dpiY := 96;

        hwndProp.hwnd := Form1.Handle;
        hwndProp.pixelSize.width := Form1.Width;
        hwndProp.pixelSize.height := Form1.Height;
        hwndProp.presentOptions := D2D1_PRESENT_OPTIONS_IMMEDIATELY;

        result := factory.CreateHwndRenderTarget(@renderProp,@hwndProp,@renderer);
        if result <> 0 Then
                Exit;


        color.r := 1;
        color.g := 0;
        color.b := 0;
        color.a := 1;

        renderer.CreateSolidColorBrush(@color,nil,@brush1);
end;

end.


