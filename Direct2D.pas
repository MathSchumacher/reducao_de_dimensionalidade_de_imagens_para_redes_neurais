unit Direct2D;



interface
uses
        Messages,Windows, DirectWrite;
const
        IID_ID2D1Factory : TGUID = (
            D1: $6152247;
            D2: $6F50;
            D3: $465A;
            D4: ($92,$45,$11,$8B,$FD,$3B,$60,$07)
        );

type
        //Foward declarations (needed for some types)
        ID2D1RenderTarget = interface;
        ID2D1Brush = interface;
        ID2D1Geometry = interface;



        //Integer type alias
        D2D1_TAG = Int64;

        //Enum types
        {$MinEnumSize 4}
        D2D1_FACTORY_TYPE = (
                D2D1_FACTORY_TYPE_SINGLE_THREADED,
                D2D1_FACTORY_TYPE_MULTI_THREADED
        );
        D2D1_DEBUG_LEVEL = (
                D2D1_DEBUG_LEVEL_NONE,
                D2D1_DEBUG_LEVEL_ERROR,
                D2D1_DEBUG_LEVEL_WARNING,
                D2D1_DEBUG_LEVEL_INFORMATION
        );

        D2D1_RENDER_TARGET_TYPE = (
                D2D1_RENDER_TARGET_TYPE_DEFAULT     = 0,
                D2D1_RENDER_TARGET_TYPE_SOFTWARE    = 1,
                D2D1_RENDER_TARGET_TYPE_HARDWARE    = 2
        );

        DXGI_FORMAT = (
                DXGI_FORMAT_UNKNOWN = $0,
                DXGI_FORMAT_R32G32B32A32_TYPELESS = $1,
                DXGI_FORMAT_R32G32B32A32_FLOAT = $2,
                DXGI_FORMAT_R32G32B32A32_UINT = $3,
                DXGI_FORMAT_R32G32B32A32_SINT = $4,
                DXGI_FORMAT_R32G32B32_TYPELESS = $5,
                DXGI_FORMAT_R32G32B32_FLOAT = $6,
                DXGI_FORMAT_R32G32B32_UINT = $7,
                DXGI_FORMAT_R32G32B32_SINT = $8,
                DXGI_FORMAT_R16G16B16A16_TYPELESS = $9,
                DXGI_FORMAT_R16G16B16A16_FLOAT = $a,
                DXGI_FORMAT_R16G16B16A16_UNORM = $b,
                DXGI_FORMAT_R16G16B16A16_UINT = $c,
                DXGI_FORMAT_R16G16B16A16_SNORM = $d,
                DXGI_FORMAT_R16G16B16A16_SINT = $e,
                DXGI_FORMAT_R32G32_TYPELESS = $f,
                DXGI_FORMAT_R32G32_FLOAT = $10,
                DXGI_FORMAT_R32G32_UINT = $11,
                DXGI_FORMAT_R32G32_SINT = $12,
                DXGI_FORMAT_R32G8X24_TYPELESS = $13,
                DXGI_FORMAT_D32_FLOAT_S8X24_UINT = $14,
                DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS = $15,
                DXGI_FORMAT_X32_TYPELESS_G8X24_UINT = $16,
                DXGI_FORMAT_R10G10B10A2_TYPELESS = $17,
                DXGI_FORMAT_R10G10B10A2_UNORM = $18,
                DXGI_FORMAT_R10G10B10A2_UINT = $19,
                DXGI_FORMAT_R11G11B10_FLOAT = $1a,
                DXGI_FORMAT_R8G8B8A8_TYPELESS = $1b,
                DXGI_FORMAT_R8G8B8A8_UNORM = $1c,
                DXGI_FORMAT_R8G8B8A8_UNORM_SRGB = $1d,
                DXGI_FORMAT_R8G8B8A8_UINT = $1e,
                DXGI_FORMAT_R8G8B8A8_SNORM = $1f,
                DXGI_FORMAT_R8G8B8A8_SINT = $20,
                DXGI_FORMAT_R16G16_TYPELESS = $21,
                DXGI_FORMAT_R16G16_FLOAT = $22,
                DXGI_FORMAT_R16G16_UNORM = $23,
                DXGI_FORMAT_R16G16_UINT = $24,
                DXGI_FORMAT_R16G16_SNORM = $25,
                DXGI_FORMAT_R16G16_SINT = $26,
                DXGI_FORMAT_R32_TYPELESS = $27,
                DXGI_FORMAT_D32_FLOAT = $28,
                DXGI_FORMAT_R32_FLOAT = $29,
                DXGI_FORMAT_R32_UINT = $2a,
                DXGI_FORMAT_R32_SINT = $2b,
                DXGI_FORMAT_R24G8_TYPELESS = $2c,
                DXGI_FORMAT_D24_UNORM_S8_UINT = $2d,
                DXGI_FORMAT_R24_UNORM_X8_TYPELESS = $2e,
                DXGI_FORMAT_X24_TYPELESS_G8_UINT = $2f,
                DXGI_FORMAT_R8G8_TYPELESS = $30,
                DXGI_FORMAT_R8G8_UNORM = $31,
                DXGI_FORMAT_R8G8_UINT = $32,
                DXGI_FORMAT_R8G8_SNORM = $33,
                DXGI_FORMAT_R8G8_SINT = $34,
                DXGI_FORMAT_R16_TYPELESS = $35,
                DXGI_FORMAT_R16_FLOAT = $36,
                DXGI_FORMAT_D16_UNORM = $37,
                DXGI_FORMAT_R16_UNORM = $38,
                DXGI_FORMAT_R16_UINT = $39,
                DXGI_FORMAT_R16_SNORM = $3a,
                DXGI_FORMAT_R16_SINT = $3b,
                DXGI_FORMAT_R8_TYPELESS = $3c,
                DXGI_FORMAT_R8_UNORM = $3d,
                DXGI_FORMAT_R8_UINT = $3e,
                DXGI_FORMAT_R8_SNORM = $3f,
                DXGI_FORMAT_R8_SINT = $40,
                DXGI_FORMAT_A8_UNORM = $41,
                DXGI_FORMAT_R1_UNORM = $42,
                DXGI_FORMAT_R9G9B9E5_SHAREDEXP = $43,
                DXGI_FORMAT_R8G8_B8G8_UNORM = $44,
                DXGI_FORMAT_G8R8_G8B8_UNORM = $45,
                DXGI_FORMAT_BC1_TYPELESS = $46,
                DXGI_FORMAT_BC1_UNORM = $47,
                DXGI_FORMAT_BC1_UNORM_SRGB = $48,
                DXGI_FORMAT_BC2_TYPELESS = $49,
                DXGI_FORMAT_BC2_UNORM = $4a,
                DXGI_FORMAT_BC2_UNORM_SRGB = $4b,
                DXGI_FORMAT_BC3_TYPELESS = $4c,
                DXGI_FORMAT_BC3_UNORM = $4d,
                DXGI_FORMAT_BC3_UNORM_SRGB = $4e,
                DXGI_FORMAT_BC4_TYPELESS = $4f,
                DXGI_FORMAT_BC4_UNORM = $50,
                DXGI_FORMAT_BC4_SNORM = $51,
                DXGI_FORMAT_BC5_TYPELESS = $52,
                DXGI_FORMAT_BC5_UNORM = $53,
                DXGI_FORMAT_BC5_SNORM = $54,
                DXGI_FORMAT_B5G6R5_UNORM = $55,
                DXGI_FORMAT_B5G5R5A1_UNORM = $56,
                DXGI_FORMAT_B8G8R8A8_UNORM = $57,
                DXGI_FORMAT_B8G8R8X8_UNORM = $58,
                DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM = $59,
                DXGI_FORMAT_B8G8R8A8_TYPELESS = $5a,
                DXGI_FORMAT_B8G8R8A8_UNORM_SRGB = $5b,
                DXGI_FORMAT_B8G8R8X8_TYPELESS = $5c,
                DXGI_FORMAT_B8G8R8X8_UNORM_SRGB = $5d,
                DXGI_FORMAT_BC6H_TYPELESS = $5e,
                DXGI_FORMAT_BC6H_UF16 = $5f,
                DXGI_FORMAT_BC6H_SF16 = $60,
                DXGI_FORMAT_BC7_TYPELESS = $61,
                DXGI_FORMAT_BC7_UNORM = $62,
                DXGI_FORMAT_BC7_UNORM_SRGB = $63,
                DXGI_FORMAT_AYUV = $64,
                DXGI_FORMAT_Y410 = $65,
                DXGI_FORMAT_Y416 = $66,
                DXGI_FORMAT_NV12 = $67,
                DXGI_FORMAT_P010 = $68,
                DXGI_FORMAT_P016 = $69,
                DXGI_FORMAT_420_OPAQUE = $6a,
                DXGI_FORMAT_YUY2 = $6b,
                DXGI_FORMAT_Y210 = $6c,
                DXGI_FORMAT_Y216 = $6d,
                DXGI_FORMAT_NV11 = $6e,
                DXGI_FORMAT_AI44 = $6f,
                DXGI_FORMAT_IA44 = $70,
                DXGI_FORMAT_P8 = $71,
                DXGI_FORMAT_A8P8 = $72,
                DXGI_FORMAT_B4G4R4A4_UNORM = $73,
                DXGI_FORMAT_P208 = $82,
                DXGI_FORMAT_V208 = $83,
                DXGI_FORMAT_V408 = $84
        );

        D2D1_ALPHA_MODE = (
                D2D1_ALPHA_MODE_UNKNOWN = 0,
                D2D1_ALPHA_MODE_PREMULTIPLIED = 1,
                D2D1_ALPHA_MODE_STRAIGHT = 2,
                D2D1_ALPHA_MODE_IGNORE = 3
        );

        D2D1_RENDER_TARGET_USAGE = (
                D2D1_RENDER_TARGET_USAGE_NONE,
                D2D1_RENDER_TARGET_USAGE_FORCE_BITMAP_REMOTING,
                D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE
        );

        D2D1_PRESENT_OPTIONS = (
                D2D1_PRESENT_OPTIONS_NONE,
                D2D1_PRESENT_OPTIONS_RETAIN_CONTENTS,
                D2D1_PRESENT_OPTIONS_IMMEDIATELY
        );

        D2D1_FEATURE_LEVEL = (
                D2D1_FEATURE_LEVEL_DEFAULT     = 0,
                D2D1_FEATURE_LEVEL_9           = $9100,
                D2D1_FEATURE_LEVEL_10          = $a100
        );

        D2D1_ANTIALIAS_MODE = (
                D2D1_ANTIALIAS_MODE_PER_PRIMITIVE   = 0,
                D2D1_ANTIALIAS_MODE_ALIASED         = 1
        );

        D2D1_TEXT_ANTIALIAS_MODE = (
                D2D1_TEXT_ANTIALIAS_MODE_DEFAULT     = 0,
                D2D1_TEXT_ANTIALIAS_MODE_CLEARTYPE   = 1,
                D2D1_TEXT_ANTIALIAS_MODE_GRAYSCALE   = 2,
                D2D1_TEXT_ANTIALIAS_MODE_ALIASED     = 3
        );

        D2D1_WINDOW_STATE = (
                D2D1_WINDOW_STATE_NONE        = 0,
                D2D1_WINDOW_STATE_OCCLUDED    = 1
        );

        D2D1_CAP_STYLE = (
                D2D1_CAP_STYLE_FLAT        = 0,
                D2D1_CAP_STYLE_SQUARE      = 1,
                D2D1_CAP_STYLE_ROUND       = 2,
                D2D1_CAP_STYLE_TRIANGLE    = 3
        );

        D2D1_LINE_JOIN = (
                D2D1_LINE_JOIN_MITER            = 0,
                D2D1_LINE_JOIN_BEVEL            = 1,
                D2D1_LINE_JOIN_ROUND            = 2,
                D2D1_LINE_JOIN_MITER_OR_BEVEL   = 3
        );

        D2D1_DASH_STYLE = (
                D2D1_DASH_STYLE_SOLID          = 0,
                D2D1_DASH_STYLE_DASH           = 1,
                D2D1_DASH_STYLE_DOT            = 2,
                D2D1_DASH_STYLE_DASH_DOT       = 3,
                D2D1_DASH_STYLE_DASH_DOT_DOT   = 4,
                D2D1_DASH_STYLE_CUSTOM         = 5
        );

        D2D1_GEOMETRY_RELATION = (
                D2D1_GEOMETRY_RELATION_UNKNOWN        = 0,
                D2D1_GEOMETRY_RELATION_DISJOINT       = 1,
                D2D1_GEOMETRY_RELATION_IS_CONTAINED   = 2,
                D2D1_GEOMETRY_RELATION_CONTAINS       = 3,
                D2D1_GEOMETRY_RELATION_OVERLAP        = 4
        );

        D2D1_GEOMETRY_SIMPLIFICATION_OPTION = (
                D2D1_GEOMETRY_SIMPLIFICATION_OPTION_CUBICS_AND_LINES   = 0,
                D2D1_GEOMETRY_SIMPLIFICATION_OPTION_LINES              = 1
        );

        D2D1_FILL_MODE = (
                D2D1_FILL_MODE_ALTERNATE   = 0,
                D2D1_FILL_MODE_WINDING     = 1
        );

        D2D1_PATH_SEGMENT = (
                D2D1_PATH_SEGMENT_NONE                    = 0,
                D2D1_PATH_SEGMENT_FORCE_UNSTROKED         = 1,
                D2D1_PATH_SEGMENT_FORCE_ROUND_LINE_JOIN   = 2
        );

        D2D1_FIGURE_BEGIN = (
                D2D1_FIGURE_BEGIN_FILLED      = 0,
                D2D1_FIGURE_BEGIN_HOLLOW      = 1
        );

        D2D1_FIGURE_END = (
                D2D1_FIGURE_END_OPEN        = 0,
                D2D1_FIGURE_END_CLOSED      = 1
        );
        D2D1_COMBINE_MODE = (
                D2D1_COMBINE_MODE_UNION       = 0,
                D2D1_COMBINE_MODE_INTERSECT   = 1,
                D2D1_COMBINE_MODE_XOR         = 2,
                D2D1_COMBINE_MODE_EXCLUDE     = 3
        );

        D2D1_OPACITY_MASK_CONTENT = (
                D2D1_OPACITY_MASK_CONTENT_GRAPHICS              = 0,
                D2D1_OPACITY_MASK_CONTENT_TEXT_NATURAL          = 1,
                D2D1_OPACITY_MASK_CONTENT_TEXT_GDI_COMPATIBLE   = 2
        );

        D2D1_SWEEP_DIRECTION = (
                D2D1_SWEEP_DIRECTION_COUNTER_CLOCKWISE   = 0,
                D2D1_SWEEP_DIRECTION_CLOCKWISE           = 1
        );

        D2D1_ARC_SIZE = (
                D2D1_ARC_SIZE_SMALL       = 0,
                D2D1_ARC_SIZE_LARGE       = 1
        );

        D2D1_DC_INITIALIZE_MODE = (
                D2D1_DC_INITIALIZE_MODE_COPY        = 0,
                D2D1_DC_INITIALIZE_MODE_CLEAR       = 1
        );

        D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS = (
                D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_NONE             = 0,
                D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_GDI_COMPATIBLE   = 1
        );

        D2D1_GAMMA = (
                D2D1_GAMMA_2_2         = 0,
                D2D1_GAMMA_1_0         = 1
        );

        D2D1_EXTEND_MODE = (
                D2D1_EXTEND_MODE_CLAMP       = 0,
                D2D1_EXTEND_MODE_WRAP        = 1,
                D2D1_EXTEND_MODE_MIRROR      = 2
        );

        D2D1_BITMAP_INTERPOLATION_MODE = (
                D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR   = 0,
                D2D1_BITMAP_INTERPOLATION_MODE_LINEAR             = 1
        );

        D2D1_DRAW_TEXT_OPTIONS = (
                D2D1_DRAW_TEXT_OPTIONS_NO_SNAP                       = $1,
                D2D1_DRAW_TEXT_OPTIONS_CLIP                          = $2,
                D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT             = $4,
                D2D1_DRAW_TEXT_OPTIONS_DISABLE_COLOR_BITMAP_SNAPPING = $8,
                D2D1_DRAW_TEXT_OPTIONS_NONE                          = 0
        );

        D2D1_LAYER_OPTIONS = (
                D2D1_LAYER_OPTIONS_NONE                       = $0,
                D2D1_LAYER_OPTIONS_INITIALIZE_FOR_CLEARTYPE   = $1
        );
        {$MinEnumSize 1}

        //Struct/Record types
        D2D_POINT_2F = record
                x : Single;
                y : Single;
        end;

        D2D_POINT_2U = record
                x : Cardinal;
                y : Cardinal;
        end;


        D2D_COLOR_F = record
                r : Single;
                g : Single;
                b : Single;
                a : Single;
        end;

        D2D1_STROKE_STYLE_PROPERTIES = record
                startCap :  D2D1_CAP_STYLE;
                endCap : D2D1_CAP_STYLE;
                dashCap : D2D1_CAP_STYLE;
                lineJoin : D2D1_LINE_JOIN;
                miterLimit : Single;
                dashStyle : D2D1_DASH_STYLE;
                dashOffset : Single;
        end;

        D2D1_BEZIER_SEGMENT = record
                point1 : D2D_POINT_2F;
                point2 : D2D_POINT_2F;
                point3 : D2D_POINT_2F;
        end;

        D2D1_QUADRATIC_BEZIER_SEGMENT = record
                point1 :  D2D_POINT_2F;
                point2 :  D2D_POINT_2F;
        end;

        D2D1_TRIANGLE = record
                point1 : D2D_POINT_2F;
                point2 : D2D_POINT_2F;
                point3 : D2D_POINT_2F;
        end;

        D2D_SIZE_U = record
                width : Cardinal;
                height : Cardinal;
        end;

        D2D_SIZE_F = record
                width : Single;
                height : Single;
        end;

        D2D_RECT_F = record
            left : Single;
            top : Single;
            right : Single;
            bottom : Single;
        end;

        D2D1_ARC_SEGMENT = record
                point : D2D_POINT_2F;
                size :  D2D_SIZE_F;
                rotationAngle : Single;
                sweepDirection : D2D1_SWEEP_DIRECTION;
                arcSize : D2D1_ARC_SIZE;
        end;

        D2D_RECT_U = record
                left : Cardinal;
                top : Cardinal;
                right : Cardinal;
                bottom : Cardinal;
        end;

        D2D1_ROUNDED_RECT = record
            rect : D2D_RECT_F;
            radiusX : Single;
            radiusY : Single;
        end;

        D2D1_ELLIPSE = record
                point : D2D_POINT_2F;
                radiusX : Single;
                radiusY : Single;
        end;


        D2D_MATRIX_3X2_F = record
                m11 : Single;
                m12 : Single;
                m21 : Single;
                m22 : Single;
                dx  : Single;
                dy  : Single;
        end;


        D2D1_PIXEL_FORMAT = record
            format : DXGI_FORMAT;
            alphaMode : D2D1_ALPHA_MODE;
        end;

        D2D1_RENDER_TARGET_PROPERTIES = record
                rtype : D2D1_RENDER_TARGET_TYPE;
                pixelFormat : D2D1_PIXEL_FORMAT;
                dpiX : Single;
                dpiY : Single;
                usage : D2D1_RENDER_TARGET_USAGE;
                minLevel : D2D1_FEATURE_LEVEL;
        end;

        D2D1_HWND_RENDER_TARGET_PROPERTIES = record
                hwnd : HWND;
                pixelSize : D2D_SIZE_U;
                presentOptions : D2D1_PRESENT_OPTIONS;
        end;

        D2D1_BRUSH_PROPERTIES = record
                opacity : Single;
                transform : D2D_MATRIX_3X2_F
        end;


        D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES = record
                center : D2D_POINT_2F;
                gradientOriginOffset : D2D_POINT_2F;
                radiusX : Single;
                radiusY : Single;
        end;

        D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES = record
                startPoint : D2D_POINT_2F;
                endPoint : D2D_POINT_2F
        end;


        D2D1_GRADIENT_STOP  = record
                position : Single;
                color : D2D_COLOR_F;
        end;


        D2D1_LAYER_PARAMETERS = record
                contentBounds : D2D_RECT_F;
                geometricMask : ID2D1Geometry;
                maskAntialiasMode : D2D1_ANTIALIAS_MODE;
                maskTransform : D2D_MATRIX_3X2_F;
                opacity : Single;
                opacityBrush : ID2D1Brush;
                layerOptions : D2D1_LAYER_OPTIONS;
        end;

        D2D1_DRAWING_STATE_DESCRIPTION = record
                antialiasMode : D2D1_ANTIALIAS_MODE;
                textAntialiasMode : D2D1_TEXT_ANTIALIAS_MODE;
                tag1 : D2D1_TAG;
                tag2 : D2D1_TAG;
                transform : D2D_MATRIX_3X2_F;
        end;


        D2D1_BITMAP_PROPERTIES = record
                pixelFormat : D2D1_PIXEL_FORMAT ;
                dpiX : Single;
                dpiY : Single;
        end;

        D2D1_BITMAP_BRUSH_PROPERTIES = record
                extendModeX : D2D1_EXTEND_MODE;
                extendModeY : D2D1_EXTEND_MODE;
                interpolationMode : D2D1_BITMAP_INTERPOLATION_MODE;
        end;

        //Pointer types
        PPointer = ^Pointer;
        PD2D1_TAG = ^D2D1_TAG;
        PHDC = ^HDC;


        // --> Enum pointers
        PD2D1_DEBUG_LEVEL = ^D2D1_DEBUG_LEVEL;
        PD2D1_RENDER_TARGET_PROPERTIES = ^D2D1_RENDER_TARGET_PROPERTIES;
        PD2D1_GEOMETRY_RELATION = ^D2D1_GEOMETRY_RELATION;
        PD2D1_GEOMETRY_SIMPLIFICATION_OPTION = ^D2D1_GEOMETRY_SIMPLIFICATION_OPTION;


        // --> Struct/record pointers
        PD2D1_HWND_RENDER_TARGET_PROPERTIES = ^D2D1_HWND_RENDER_TARGET_PROPERTIES;
        PD2D_SIZE_U = ^D2D_SIZE_U;
        PD2D_SIZE_F = ^D2D_SIZE_F;
        PD2D_MATRIX_3X2_F = ^D2D_MATRIX_3X2_F;
        PD2D_RECT_F = ^D2D_RECT_F;
        PD2D1_ROUNDED_RECT = ^D2D1_ROUNDED_RECT;
        PD2D1_ELLIPSE = ^D2D1_ELLIPSE;
        PD2D_POINT_2F = ^D2D_POINT_2F;
        PD2D_POINT_2U = ^D2D_POINT_2U;
        PD2D1_BEZIER_SEGMENT = ^D2D1_BEZIER_SEGMENT;
        PD2D1_QUADRATIC_BEZIER_SEGMENT = ^D2D1_QUADRATIC_BEZIER_SEGMENT;
        PD2D1_ARC_SEGMENT = ^D2D1_ARC_SEGMENT;
        PD2D1_TRIANGLE = ^D2D1_TRIANGLE;
        PD2D_RECT_U = ^D2D_RECT_U;
        PD2D_COLOR_F = ^D2D_COLOR_F;
        PD2D1_BRUSH_PROPERTIES = ^D2D1_BRUSH_PROPERTIES;
        PD2D1_STROKE_STYLE_PROPERTIES = ^D2D1_STROKE_STYLE_PROPERTIES;
        PD2D1_PIXEL_FORMAT = ^D2D1_PIXEL_FORMAT;
        PD2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES = ^D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES;
        PD2D1_GRADIENT_STOP = ^D2D1_GRADIENT_STOP;
        PD2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES = ^D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES;
        PD2D1_LAYER_PARAMETERS = ^D2D1_LAYER_PARAMETERS;
        PD2D1_DRAWING_STATE_DESCRIPTION = ^D2D1_DRAWING_STATE_DESCRIPTION;
        PD2D1_BITMAP_PROPERTIES = ^D2D1_BITMAP_PROPERTIES;
        PD2D1_BITMAP_BRUSH_PROPERTIES = ^D2D1_BITMAP_BRUSH_PROPERTIES;


        // --> COM Object pointers (pointer to pointer)
        PID2D1Factory = ^ID2D1Factory;
        PID2D1RenderTarget = ^ID2D1RenderTarget;
        PID2D1DCRenderTarget = ^ID2D1DCRenderTarget;
        PID2D1HwndRenderTarget = ^ID2D1HwndRenderTarget;
        PID2D1TessellationSink = ^ID2D1TessellationSink;
        PID2D1SolidColorBrush = ^ID2D1SolidColorBrush;
        PID2D1RectangleGeometry = ^ID2D1RectangleGeometry;
        PID2D1RoundedRectangleGeometry = ^ID2D1RoundedRectangleGeometry;
        PID2D1EllipseGeometry = ^ID2D1EllipseGeometry;
        PID2D1Geometry = ^ID2D1Geometry;
        PID2D1GeometryGroup = ^ID2D1GeometryGroup;
        PID2D1GeometrySink = ^ID2D1GeometrySink;
        PID2D1TransformedGeometry = ^ID2D1TransformedGeometry;
        PID2D1PathGeometry = ^ID2D1PathGeometry;
        PID2D1StrokeStyle = ^ID2D1StrokeStyle;
        PID2D1Layer = ^ID2D1Layer;
        PID2D1Mesh = ^ID2D1Mesh;
        PID2D1Bitmap = ^ID2D1Bitmap;
        PID2D1BitmapRenderTarget = ^ID2D1BitmapRenderTarget;
        PID2D1RadialGradientBrush = ^ID2D1RadialGradientBrush;
        PID2D1GradientStopCollection = ^ID2D1GradientStopCollection;
        PID2D1LinearGradientBrush = ^ID2D1LinearGradientBrush;
        PID2D1BitmapBrush = ^ID2D1BitmapBrush;


        //COM Object declarations



        ID2D1Resource = interface(IUnknown)
        ['{2CD90691-12E2-11DC-9FED-001143A055F9}']
                procedure GetFactory(factory : PID2D1Factory); stdcall;
        end;

        ID2D1Layer = interface(ID2D1Resource)
        ['{2CD9069B-12E2-11DC-9FED-001143A055F9}']
                function GetSize() : D2D_SIZE_F; stdcall;
        end;

        ID2D1Image = interface(ID2D1Resource)
        ['{65019F75-8DA2-497C-B32C-DFA34E48EDE6}']
        end;


        ID2D1DrawingStateBlock  = interface(ID2D1Resource)
        ['{28506E39-EBF6-46A1-BB47-FD85565AB957}']
                procedure GetDescription(
                        desc : PD2D1_DRAWING_STATE_DESCRIPTION
                ); stdcall;
                procedure SetDescription(
                        desc : PD2D1_DRAWING_STATE_DESCRIPTION
                ); stdcall;
                procedure SetTextRenderingParams(
                       // text_rendering_params : IDWriteRenderingParams
                ); stdcall;
                procedure GetTextRenderingParams(
                    //    text_rendering_params : PIDWriteRenderingParams
                ); stdcall;
        end;


        ID2D1GradientStopCollection = interface(ID2D1Resource)
        ['{2cd906a7-12e2-11dc-9fed-001143a055f9}']
                function GetGradientStopCount() : Cardinal; stdcall;
                procedure GetGradientStops(
                        stops : PD2D1_GRADIENT_STOP;
                        count : Cardinal
                ); stdcall;
                function GetColorInterpolationGamma() : D2D1_GAMMA; stdcall;
                function GetExtendMode() : D2D1_EXTEND_MODE; stdcall;
        end;



        ID2D1Bitmap = interface(ID2D1Image)
        ['{A2296057-EA42-4099-983B-539FB6505426}']
                function GetSize() : D2D_SIZE_F; stdcall;
                function GetPixelSize() : D2D_SIZE_U; stdcall;
                function GetPixelFormat() : D2D1_PIXEL_FORMAT; stdcall;
                procedure GetDpi(dpiX : PSingle; dpiY : PSingle); stdcall;
                function CopyFromBitmap(
                        destPoint : PD2D_POINT_2U;
                        bitmap : ID2D1Bitmap;
                        srcRect : PD2D_RECT_U
                ): HRESULT; stdcall;
                function CopyFromRenderTarget(
                        destPoint : PD2D_POINT_2U;
                        renderTarget : ID2D1RenderTarget;
                        srcRect : PD2D_RECT_U
                ): HRESULT; stdcall;
                function CopyFromMemory(
                        dstRect : PD2D_RECT_U;
                        srcData : Pointer;
                        pitch : Cardinal
                ): HRESULT; stdcall;
        end;




        ID2D1TessellationSink = interface(IUnknown)
        ['{2cd906c1-12e2-11dc-9fed-001143a055f9}']
                procedure AddTriangles(
                        triangles : PD2D1_TRIANGLE;
                        count : Cardinal
                ); stdcall;
                function Close() : HRESULT; stdcall;
        end;

        ID2D1SimplifiedGeometrySink = interface(IUnknown)
        ['{2CD9069E-12E2-11DC-9FED-001143A055F9}']
                procedure SetFillMode(fillMode : D2D1_FILL_MODE); stdcall;
                procedure SetSegmentFlags(vertexFlags : D2D1_PATH_SEGMENT); stdcall;
                procedure BeginFigure(
                        startPoint : D2D_POINT_2F;
                        figureBegin : D2D1_FIGURE_BEGIN
                ); stdcall;
                procedure AddLines(
                        points : PD2D_POINT_2F;
                        count : Cardinal
                ); stdcall;
                procedure AddBeziers(
                        beziers : PD2D1_BEZIER_SEGMENT;
                        count : Cardinal
                ); stdcall;
                procedure EndFigure(figureEnd : D2D1_FIGURE_END); stdcall;
                function Close(): HRESULT; stdcall;
        end;

        ID2D1Mesh = interface(ID2D1Resource)
        ['{2CD906C2-12E2-11DC-9FED-001143A055F9}']
                function Open(tessellationSink : PID2D1TessellationSink) : HRESULT; stdcall;
        end;

        ID2D1StrokeStyle = interface(ID2D1Resource)
        ['{2CD9069D-12E2-11DC-9FED-001143A055F9}']
                function GetStartCap(): D2D1_CAP_STYLE; stdcall;
                function GetEndCap() : D2D1_CAP_STYLE; stdcall;
                function GetDashCap() : D2D1_CAP_STYLE; stdcall;
                function GetMiterLimit() : Single; stdcall;
                function GetLineJoin() : D2D1_LINE_JOIN; stdcall;
                function GetDashOffset() : Single; stdcall;
                function GetDashStyle() : D2D1_DASH_STYLE; stdcall;
                function GetDashesCount() : Cardinal; stdcall;
                procedure GetDashes(dashes : PSingle; count : Cardinal); stdcall;
        end;
        ID2D1Geometry = interface(ID2D1Resource)
        ['{2CD906A1-12E2-11DC-9FED-001143A055F9}']
                function GetBounds(
                        worldTransform : PD2D_MATRIX_3X2_F;
                        bounds : PD2D_RECT_F
                ): HRESULT; stdcall;
                function GetWidenedBounds(
                        strokeWidth : Single;
                        strokeStyle : ID2D1StrokeStyle;
                        worldTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        bounds : PD2D_RECT_F
                ): HRESULT; stdcall;
                function StrokeContainsPoint(
                        point : D2D_POINT_2F;
                        strokeWidth : Single;
                        storkeStyle : ID2D1StrokeStyle;
                        worldTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        contains : PBOOL
                ): HRESULT; stdcall;
                function FillContainsPoint(
                        point : D2D_POINT_2F;
                        worldTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        contains : PBOOL
                ): HRESULT; stdcall;
                function CompareWithGeometry(
                        inputGeometry : ID2D1Geometry;
                        inputGeometryTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        relation : PD2D1_GEOMETRY_RELATION
                ): HRESULT; stdcall;
                function Simplify(
                        simplificationOption : D2D1_GEOMETRY_SIMPLIFICATION_OPTION;
                        worldTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        geometrySink : ID2D1SimplifiedGeometrySink
                ): HRESULT; stdcall;
                function Tessellate(
                        worldTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        tessellationSink : ID2D1TessellationSink
                ): HRESULT; stdcall;
                function CombineWithGeometry(
                        inputGeometry : ID2D1Geometry;
                        combineMode : D2D1_COMBINE_MODE;
                        inputGeometryTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        geometrySink : ID2D1SimplifiedGeometrySink
                ): HRESULT; stdcall;
                function Outline(
                        worldTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        geometrySink : ID2D1SimplifiedGeometrySink
                ): HRESULT; stdcall;
                function ComputeArea(
                        worldTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        area : PSingle
                ): HRESULT; stdcall;
                function ComputeLength(
                        worldTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        length : PSingle
                ): HRESULT; stdcall;
                function ComputePointAtLength(
                        length : Single;
                        worldTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        point : PD2D_POINT_2F;
                        unitTangentVector : PD2D_POINT_2F
                ): HRESULT; stdcall;
                function Widen(
                        strokeWidth : Single;
                        strokeStyle : ID2D1StrokeStyle;
                        worldTransform : PD2D_MATRIX_3X2_F;
                        flatteningTolerance : Single;
                        geometrySink : ID2D1SimplifiedGeometrySink
                ): HRESULT; stdcall;

        end;

        ID2D1RectangleGeometry = interface(ID2D1Geometry)
        ['{2CD906A2-12E2-11DC-9FED-001143A055F9}']
                procedure GetRect(rect : PD2D_RECT_F); stdcall;
        end;

        ID2D1RoundedRectangleGeometry = interface(ID2D1Geometry)
        ['{2CD906A3-12E2-11DC-9FED-001143A055F9}']
                procedure GetRoundedRect(rect : PD2D1_ROUNDED_RECT); stdcall;
        end;

        ID2D1EllipseGeometry = interface(ID2D1Geometry)
        ['{2CD906A4-12E2-11DC-9FED-001143A055F9}']
                procedure GetEllipse(ellipse : PD2D1_ELLIPSE); stdcall;
        end;

        ID2D1GeometryGroup = interface(ID2D1Geometry)
        ['{2CD906A6-12E2-11DC-9FED-001143A055F9}']
                function GetFillMode(): D2D1_FILL_MODE; stdcall;
                function GetSourceGeometryCount(): Cardinal; stdcall;
                procedure GetSourceGeometries(
                        geometries : PID2D1Geometry;
                        count : Cardinal
                ); stdcall;

        end;

        ID2D1TransformedGeometry = interface(ID2D1Geometry)
        ['{2CD906BB-12E2-11DC-9FED-001143A055F9}']
                procedure GetSourceGeometry(
                        geometry : PID2D1Geometry
                ); stdcall;
                procedure GetTransform(
                        transform : PD2D_MATRIX_3X2_F
                ); stdcall;
        end;

        ID2D1GeometrySink = interface(ID2D1SimplifiedGeometrySink)
        ['{2CD9069F-12E2-11DC-9FED-001143A055F9}']
                procedure AddLine(point : D2D_POINT_2F); stdcall;
                procedure AddBezier(bezier : PD2D1_BEZIER_SEGMENT); stdcall;
                procedure AddQuadraticBezier(
                        bezier : PD2D1_QUADRATIC_BEZIER_SEGMENT
                ); stdcall;
                procedure AddQuadraticBeziers(
                        beziers : PD2D1_QUADRATIC_BEZIER_SEGMENT;
                        count : Cardinal
                ); stdcall;
                procedure AddArc(arc : PD2D1_ARC_SEGMENT); stdcall;
        end;

        ID2D1PathGeometry = interface(ID2D1Geometry)
        ['{2CD906A5-12E2-11DC-9FED-001143A055F9}']
                function Open(
                        sink : PID2D1GeometrySink
                ) : HRESULT; stdcall;
                function Stream(
                        sink : ID2D1GeometrySink
                ) : HRESULT; stdcall;
                function GetSegmentCount(
                        count : PCardinal
                ) : HRESULT; stdcall;
                function GetFigureCount(
                        count : PCardinal
                ) : HRESULT; stdcall;
        end;

        ID2D1Brush = interface(ID2D1Resource)
        ['{2CD906A8-12E2-11DC-9FED-001143A055F9}']
                procedure SetOpacity(opacity : Single); stdcall;
                procedure SetTransform(transform : PD2D_MATRIX_3X2_F); stdcall;
                function  GetOpacity() : Single; stdcall;
                procedure GetTransform(transform : PD2D_MATRIX_3X2_F); stdcall;
        end;

        ID2D1BitmapBrush = interface(ID2D1Brush)
        ['{2CD906AA-12E2-11DC-9FED-001143A055F9}']
                procedure SetExtendModeX(
                        mode : D2D1_EXTEND_MODE
                ); stdcall;
                procedure SetExtendModeY(
                        mode : D2D1_EXTEND_MODE
                ); stdcall;
                procedure SetInterpolationMode(
                        mode : D2D1_BITMAP_INTERPOLATION_MODE
                ); stdcall;
                procedure SetBitmap(
                        bitmap : ID2D1Bitmap
                );
                function GetExtendModeX() : D2D1_EXTEND_MODE; stdcall;
                function GetExtendModeY() : D2D1_EXTEND_MODE; stdcall;
                function GetInterpolationMode() : D2D1_BITMAP_INTERPOLATION_MODE; stdcall;
                procedure GetBitmap(bitmap : PID2D1Bitmap); stdcall;
        end;


        ID2D1LinearGradientBrush = interface(ID2D1Brush)
        ['{2CD906AB-12E2-11DC-9FED-001143A055F9}']
                procedure SetStartPoint(startPoint : D2D_POINT_2F); stdcall;
                procedure SetEndPoint(endPoint : D2D_POINT_2F); stdcall;
                function GetStartPoint() : D2D_POINT_2F; stdcall;
                function GetEndPoint() : D2D_POINT_2F; stdcall;
                procedure GetGradientStopCollection(
                        gradient : PID2D1GradientStopCollection
                ); stdcall;
        end;

        ID2D1RadialGradientBrush  = interface(ID2D1Brush)
        ['{2CD906AC-12E2-11DC-9FED-001143A055F9}']
                procedure SetCenter(center : D2D_POINT_2F); stdcall;
                procedure SetGradientOriginOffset(
                        offset : D2D_POINT_2F
                ); stdcall;
                procedure SetRadiusX(radius : Single); stdcall;
                procedure SetRadiusY(radius : Single); stdcall;
                function GetCenter() : D2D_POINT_2F; stdcall;
                function GetGradientOriginOffset() : D2D_POINT_2F; stdcall;
                function GetRadiusX() : Single; stdcall;
                function GetRadiusY() : Single; stdcall;
                procedure GetGradientStopCollection(
                        gradient : PID2D1GradientStopCollection
                ); stdcall;
        end;

        ID2D1SolidColorBrush = interface(ID2D1Brush)
        ['{2CD906A9-12E2-11DC-9FED-001143A055F9}']
                procedure SetColor(color : PD2D_COLOR_F); stdcall;
        end;

        ID2D1RenderTarget = interface(ID2D1Resource)
        ['{2CD90694-12E2-11DC-9FED-001143A055F9}']
                function CreateBitmap(
                        size : D2D_SIZE_U;
                        srcData : Pointer;
                        pitch : Cardinal;
                        bitmapProperties : PD2D1_BITMAP_PROPERTIES;
                        bitmap : PID2D1Bitmap
                ): HRESULT; stdcall;
                function CreateBitmapFromWicBitmap(
                       // wicBitmapSource : IWICBitmapSource;
                        bitmapProperties : PD2D1_BITMAP_PROPERTIES;
                        bitmap : PID2D1Bitmap
                ) : HRESULT; stdcall;
                function CreateSharedBitmap(
                        riid : PGUID;
                        data : Pointer;
                        bitmapProperties : PD2D1_BITMAP_PROPERTIES;
                        bitmap : PID2D1Bitmap
                ) : HRESULT; stdcall;
                function CreateBitmapBrush(
                        bitmap : ID2D1Bitmap;
                        bitmapBrushProperties : PD2D1_BITMAP_BRUSH_PROPERTIES;
                        brushProperties : PD2D1_BRUSH_PROPERTIES;
                        bitmapBrush : PID2D1BitmapBrush
                ) : HRESULT; stdcall;
                function CreateSolidColorBrush(
                        color : PD2D_COLOR_F;
                        brushProperties : PD2D1_BRUSH_PROPERTIES;
                        solidBrush : PID2D1SolidColorBrush
                ) : HRESULT; stdcall;
                function CreateGradientStopCollection(
                        gradientStops : PD2D1_GRADIENT_STOP;
                        gradientStopsCount : Cardinal;
                        colorInterpolationGamma : D2D1_GAMMA;
                        extendMode : D2D1_EXTEND_MODE;
                        gradientStopCollection : PID2D1GradientStopCollection
                ) : HRESULT; stdcall;
                function CreateLinearGradientBrush(
                        linearGradientBrushProperties : PD2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES;
                        brushProperties : PD2D1_BRUSH_PROPERTIES;
                        gradientStopCollection : ID2D1GradientStopCollection;
                        linearGradientBrush : PID2D1LinearGradientBrush
                ) : HRESULT; stdcall;
                function CreateRadialGradientBrush(
                        radialGradientBrushProperties : PD2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES;
                        brushProperties : PD2D1_BRUSH_PROPERTIES;
                        gradientStopCollection : ID2D1GradientStopCollection;
                        radialGradientBrush : PID2D1RadialGradientBrush
                ) : HRESULT; stdcall;
                function CreateCompatibleRenderTarget(
                        desiredSize : PD2D_SIZE_F;
                        desiredPixelSize : PD2D_SIZE_U;
                        desiredFormat : PD2D1_PIXEL_FORMAT;
                        options : D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS;
                        bitmapRenderTarget : PID2D1BitmapRenderTarget
                ) : HRESULT; stdcall;
                function CreateLayer(
                        size : PD2D_SIZE_F;
                        layer : PID2D1Layer
                ) : HRESULT; stdcall;
                function CreateMesh(
                        mesh : PID2D1Mesh
                ) : HRESULT; stdcall;
                procedure DrawLine(
                        p1 : D2D_POINT_2F; p2 : D2D_POINT_2F;
                        brush : ID2D1Brush; strokeWidth : Single = 1;
                        strokeStyle : ID2D1StrokeStyle = nil
                ); stdcall;
                procedure DrawRectangle(
                        rect : PD2D_RECT_F;
                        brush : ID2D1Brush;
                        strokeWidth : Single = 1;
                        strokeStyle : ID2D1StrokeStyle = nil
                ); stdcall;
                procedure FillRectangle(
                        rect : PD2D_RECT_F;
                        brush : ID2D1Brush
                ); stdcall;
                procedure DrawRoundedRectangle(
                        roundedRect : PD2D1_ROUNDED_RECT;
                        brush : ID2D1Brush;
                        strokeWidth : Single = 1;
                        strokeStyle : ID2D1StrokeStyle = nil
                ); stdcall;
                procedure FillRoundedRectangle(
                        roundedRect : PD2D1_ROUNDED_RECT;
                        brush : ID2D1Brush
                ); stdcall;
                procedure DrawEllipse(
                        ellipse : PD2D1_ELLIPSE;
                        brush : ID2D1Brush;
                        strokeWidth : Single = 1;
                        strokeStyle : ID2D1StrokeStyle = nil
                ); stdcall;
                procedure FillEllipse(
                        ellipse : PD2D1_ELLIPSE;
                        brush : ID2D1Brush
                ); stdcall;
                procedure DrawGeometry(
                        geometry : ID2D1Geometry;
                        brush : ID2D1Brush;
                        strokeWidth : Single = 1;
                        strokeStyle : ID2D1StrokeStyle = nil
                ); stdcall;
                procedure FillGeometry(
                        geometry : ID2D1Geometry;
                        brush : ID2D1Brush
                ); stdcall;
                procedure FillMesh(
                        mesh : ID2D1Mesh;
                        brush : ID2D1Brush
                ); stdcall;
                procedure FillOpacityMask(
                        opacityMask : ID2D1Bitmap;
                        brush : ID2D1Brush;
                        content : D2D1_OPACITY_MASK_CONTENT;
                        destinationRectangle : PD2D_RECT_F = nil;
                        sourceRectangle : PD2D_RECT_F = nil
                ); stdcall;
                procedure DrawBitmap(
                        bitmap : ID2D1Bitmap;
                        destinationRectangle : PD2D_RECT_F;
                        opacity : Single;
                        interpolationMode : D2D1_BITMAP_INTERPOLATION_MODE;
                        sourceRectangle : PD2D_RECT_F
                ); stdcall;
                procedure DrawText(
                        str : LPCWSTR;
                        stringLength : Cardinal;
                        textFormat : IDWriteTextFormat;
                        layoutRect : PD2D_RECT_F;
                        defaultForegroundBrush : ID2D1Brush;
                        options : D2D1_DRAW_TEXT_OPTIONS;
                        measuringMode : DWRITE_MEASURING_MODE
                ); stdcall;
                procedure DrawTextLayout(
                        origin : D2D_POINT_2F;
                        textLayout : IDWriteTextLayout;
                        defaultForegroundBrush : ID2D1Brush;
                        options : D2D1_DRAW_TEXT_OPTIONS
                ); stdcall;
                procedure DrawGlyphRun(
                        baselineOrigin : D2D_POINT_2F;
                        glyphRun : PDWRITE_GLYPH_RUN;
                        foregroundBrush : ID2D1Brush
                        measuringMode : DWRITE_MEASURING_MODE
                ); stdcall;
                procedure SetTransform(
                        transform : PD2D_MATRIX_3X2_F
                ); stdcall;
                procedure GetTransform(
                        transform : PD2D_MATRIX_3X2_F
                ); stdcall;
                procedure SetAntialiasMode(mode : D2D1_ANTIALIAS_MODE = D2D1_ANTIALIAS_MODE_PER_PRIMITIVE); stdcall;
                function GetAntialiasMode() : D2D1_ANTIALIAS_MODE; stdcall;
                procedure SetTextAntialiasMode(
                        textAntialiasMode : D2D1_TEXT_ANTIALIAS_MODE
                ); stdcall;
                function GetTextAntialiasMode() : D2D1_TEXT_ANTIALIAS_MODE; stdcall;
                procedure SetTextRenderingParams(
                        textRenderingParams : IDWriteRenderingParams
                ); stdcall;
                procedure GetTextRenderingParams(
                        textRenderingParams : PIDWriteRenderingParams
                ); stdcall;
                procedure SetTags(
                        tag1 : PD2D1_TAG;
                        tag2 : PD2D1_TAG
                ); stdcall;
                procedure GetTags(
                        tag1 : PD2D1_TAG;
                        tag2 : PD2D1_TAG
                ); stdcall;
                procedure PushLayer(
                        layerParameters : PD2D1_LAYER_PARAMETERS;
                        layer : ID2D1Layer
                ); stdcall;
                procedure PopLayer(); stdcall;
                function Flush(
                        tag1 : PD2D1_TAG = nil;
                        tag2 : PD2D1_TAG = nil
                ) : HRESULT; stdcall;
                procedure SaveDrawingState(
                        drawingStateBlock : ID2D1DrawingStateBlock
                ); stdcall;
                procedure RestoreDrawingState(
                        drawingStateBlock : ID2D1DrawingStateBlock
                ); stdcall;
                procedure PushAxisAlignedClip(
                        clipRect : PD2D_RECT_F;
                        antialiasMode : D2D1_ANTIALIAS_MODE
                ); stdcall;
                procedure PopAxisAlignedClip(); stdcall;
                procedure Clear(clearColor : PD2D_COLOR_F = nil); stdcall;
                procedure BeginDraw(); stdcall;
                function EndDraw(tag1 : PD2D1_TAG = nil; tag2 : PD2D1_TAG = nil): HRESULT; stdcall;
                function GetPixelFormat() : D2D1_PIXEL_FORMAT; stdcall;
                procedure SetDpi(dpiX : Single; dpiY : Single); stdcall;
                procedure GetDpi(dpiX : PSingle; dpiY : PSingle); stdcall;
                function GetSize() : D2D_SIZE_F; stdcall;
                function GetPixelSize() : D2D_SIZE_U; stdcall;
                function GetMaximumBitmapSize() : Cardinal; stdcall;
                function IsSupported(
                        renderTargetProperties : PD2D1_RENDER_TARGET_PROPERTIES
                ) : LongBool; stdcall;

        end;


        ID2D1BitmapRenderTarget = interface(ID2D1RenderTarget)
        ['{2CD90695-12E2-11DC-9FED-001143A055F9}']
                function GetBitmap(bitmap : PID2D1Bitmap) : HRESULT; stdcall;
        end;

        ID2D1DCRenderTarget = interface(ID2D1RenderTarget)
        ['{1C51BC64-DE61-46FD-9899-63A5D8F03950}']
                function BindDC(
                        dc : HDC;
                        rect : PRECT
                ) : HRESULT; stdcall;
        end;

        ID2D1HwndRenderTarget = interface(ID2D1RenderTarget)
        ['{2CD90698-12E2-11DC-9FED-001143A055F9}']
                function CheckWindowState() : D2D1_WINDOW_STATE; stdcall;
                function Resize(pixelSize : PD2D_SIZE_U) : HRESULT; stdcall;
                function GetHwnd() : HWND; stdcall;
        end;

        ID2D1GdiInteropRenderTarget = interface(IUnknown)
        ['{E0DB51C3-6F77-4BAE-B3D5-E47509B35838}']
                function GetDC(
                        mode : D2D1_DC_INITIALIZE_MODE;
                        dc : PHDC
                ) : HRESULT; stdcall;
                function ReleaseDC(
                        update : PRECT
                ) : HRESULT;stdcall;
        end;

        ID2D1Factory = interface (IUnknown)
        ['{2CD90691-12E2-11DC-9FED-001143A055F9}']
                function ReloadSystemMetrics() : HRESULT; stdcall;
                procedure GetDesktopDpi(dpiX : PSingle; dpiY : PSingle); stdcall;
                function CreateRectangleGeometry(
                        rectangle : PD2D_RECT_F;
                        geometry : PID2D1RectangleGeometry
                ) : HRESULT; stdcall;
                function CreateRoundedRectangleGeometry(
                        roundedRectangle : PD2D1_ROUNDED_RECT;
                        geometry : PID2D1RoundedRectangleGeometry
                ) : HRESULT; stdcall;
                function CreateEllipseGeometry(
                        ellipse : PD2D1_ELLIPSE;
                        geometry :  PID2D1EllipseGeometry
                ) : HRESULT; stdcall;
                function CreateGeometryGroup(
                        fillMode : D2D1_FILL_MODE;
                        geometries : PID2D1Geometry;
                        geometriesCount : Cardinal;
                        geometryGroup : PID2D1GeometryGroup
                ) : HRESULT; stdcall;
                function CreateTransformedGeometry(
                        sourceGeometry : ID2D1Geometry;
                        transform : PD2D_MATRIX_3X2_F;
                        transformedGeometry : PID2D1TransformedGeometry
                ) : HRESULT; stdcall;
                function CreatePathGeometry(
                        pathGeometry : PID2D1PathGeometry
                ) : HRESULT; stdcall;
                function CreateStrokeStyle(
                        strokeStyleProperties : PD2D1_STROKE_STYLE_PROPERTIES;
                        dashes : PSingle;
                        dashesCount : Cardinal;
                        strokeStyle : PID2D1StrokeStyle
                ) : HRESULT; stdcall;
                function CreateDrawingStateBlock(
                        drawingStateDescription : PD2D1_DRAWING_STATE_DESCRIPTION
                        textRenderingParams : IDWriteRenderingParams;
                        drawingStateBlock : PID2D1DrawingStateBlock
                ) : HRESULT; stdcall;
                function CreateWicBitmapRenderTarget(
                        // target : IWICBitmap
                        renderTargetProperties : PD2D1_RENDER_TARGET_PROPERTIES;
                        renderTarget : PID2D1RenderTarget
                ) : HRESULT; stdcall;
                function CreateHwndRenderTarget(
                        renderTargetProperties : PD2D1_RENDER_TARGET_PROPERTIES;
                        hwndRenderTargetProperties : PD2D1_HWND_RENDER_TARGET_PROPERTIES;
                        hwndRenderTarget : PID2D1HwndRenderTarget
                ) : HRESULT; stdcall;
                function CreateDxgiSurfaceRenderTarget(
                        //dxgiSurface : IDXGISurface;
                        renderTargetProperties : PD2D1_RENDER_TARGET_PROPERTIES;
                        renderTarget : PID2D1RenderTarget
                ) : HRESULT; stdcall;
                function CreateDCRenderTarget(
                        renderTargetProperties : PD2D1_RENDER_TARGET_PROPERTIES;
                        dcRenderTarget : PID2D1DCRenderTarget
                ) : HRESULT; stdcall;
        end;


        //DLL function calls
        function D2D1CreateFactory(
                ftype : D2D1_FACTORY_TYPE; riid : PGUID; dbglvl : PD2D1_DEBUG_LEVEL; factory : PID2D1Factory
        ) : HRESULT; stdcall; external 'd2d1.dll';

implementation


end.
