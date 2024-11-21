unit DirectWrite;



interface
uses
        Messages,Windows;


type
        //Foward declare
        IDWriteFactory = interface;
        IDWriteFontFace = interface;
        IDWriteInlineObject = interface;
        PDWRITE_GLYPH_OFFSET = ^DWRITE_GLYPH_OFFSET;
        PDWRITE_FONT_FEATURE = ^DWRITE_FONT_FEATURE;
        PIDWriteGeometrySink = Pointer; //ID2D1GeometrySink

        //Enum types
        {$MinEnumSize 4}
        DWRITE_FACTORY_TYPE = (
                DWRITE_FACTORY_TYPE_SHARED,
                DWRITE_FACTORY_TYPE_ISOLATED
        );

        DWRITE_FONT_FILE_TYPE = (
                DWRITE_FONT_FILE_TYPE_UNKNOWN,
                DWRITE_FONT_FILE_TYPE_CFF,
                DWRITE_FONT_FILE_TYPE_TRUETYPE,
                DWRITE_FONT_FILE_TYPE_OPENTYPE_COLLECTION,
                DWRITE_FONT_FILE_TYPE_TYPE1_PFM,
                DWRITE_FONT_FILE_TYPE_TYPE1_PFB,
                DWRITE_FONT_FILE_TYPE_VECTOR,
                DWRITE_FONT_FILE_TYPE_BITMAP,
                DWRITE_FONT_FILE_TYPE_TRUETYPE_COLLECTION = DWRITE_FONT_FILE_TYPE_OPENTYPE_COLLECTION
        );

        DWRITE_FONT_FACE_TYPE = (
           DWRITE_FONT_FACE_TYPE_CFF,
                DWRITE_FONT_FACE_TYPE_TRUETYPE,
                DWRITE_FONT_FACE_TYPE_OPENTYPE_COLLECTION,
                DWRITE_FONT_FACE_TYPE_TYPE1,
                DWRITE_FONT_FACE_TYPE_VECTOR,
                DWRITE_FONT_FACE_TYPE_BITMAP,
                DWRITE_FONT_FACE_TYPE_UNKNOWN,
                DWRITE_FONT_FACE_TYPE_RAW_CFF,
                DWRITE_FONT_FACE_TYPE_TRUETYPE_COLLECTION = DWRITE_FONT_FACE_TYPE_OPENTYPE_COLLECTION
        );

        DWRITE_FONT_WEIGHT = (
                DWRITE_FONT_WEIGHT_THIN = 100,
                DWRITE_FONT_WEIGHT_EXTRA_LIGHT = 200,
                DWRITE_FONT_WEIGHT_ULTRA_LIGHT = 200,
                DWRITE_FONT_WEIGHT_LIGHT = 300,
                DWRITE_FONT_WEIGHT_SEMI_LIGHT = 350,
                DWRITE_FONT_WEIGHT_NORMAL = 400,
                DWRITE_FONT_WEIGHT_REGULAR = 400,
                DWRITE_FONT_WEIGHT_MEDIUM = 500,
                DWRITE_FONT_WEIGHT_DEMI_BOLD = 600,
                DWRITE_FONT_WEIGHT_SEMI_BOLD = 600,
                DWRITE_FONT_WEIGHT_BOLD = 700,
                DWRITE_FONT_WEIGHT_EXTRA_BOLD = 800,
                DWRITE_FONT_WEIGHT_ULTRA_BOLD = 800,
                DWRITE_FONT_WEIGHT_BLACK = 900,
                DWRITE_FONT_WEIGHT_HEAVY = 900,
                DWRITE_FONT_WEIGHT_EXTRA_BLACK = 950,
                DWRITE_FONT_WEIGHT_ULTRA_BLACK = 950
        );

        DWRITE_FONT_STRETCH = (
                DWRITE_FONT_STRETCH_UNDEFINED = 0,
                DWRITE_FONT_STRETCH_ULTRA_CONDENSED = 1,
                DWRITE_FONT_STRETCH_EXTRA_CONDENSED = 2,
                DWRITE_FONT_STRETCH_CONDENSED = 3,
                DWRITE_FONT_STRETCH_SEMI_CONDENSED = 4,
                DWRITE_FONT_STRETCH_NORMAL = 5,
                DWRITE_FONT_STRETCH_MEDIUM = 5,
                DWRITE_FONT_STRETCH_SEMI_EXPANDED = 6,
                DWRITE_FONT_STRETCH_EXPANDED = 7,
                DWRITE_FONT_STRETCH_EXTRA_EXPANDED = 8,
                DWRITE_FONT_STRETCH_ULTRA_EXPANDED = 9
        );

        DWRITE_FONT_STYLE = (
                DWRITE_FONT_STYLE_NORMAL,
                DWRITE_FONT_STYLE_OBLIQUE,
                DWRITE_FONT_STYLE_ITALIC
        );

        DWRITE_INFORMATIONAL_STRING_ID = (
                DWRITE_INFORMATIONAL_STRING_NONE,
                DWRITE_INFORMATIONAL_STRING_COPYRIGHT_NOTICE,
                DWRITE_INFORMATIONAL_STRING_VERSION_STRINGS,
                DWRITE_INFORMATIONAL_STRING_TRADEMARK,
                DWRITE_INFORMATIONAL_STRING_MANUFACTURER,
                DWRITE_INFORMATIONAL_STRING_DESIGNER,
                DWRITE_INFORMATIONAL_STRING_DESIGNER_URL,
                DWRITE_INFORMATIONAL_STRING_DESCRIPTION,
                DWRITE_INFORMATIONAL_STRING_FONT_VENDOR_URL,
                DWRITE_INFORMATIONAL_STRING_LICENSE_DESCRIPTION,
                DWRITE_INFORMATIONAL_STRING_LICENSE_INFO_URL,
                DWRITE_INFORMATIONAL_STRING_WIN32_FAMILY_NAMES,
                DWRITE_INFORMATIONAL_STRING_WIN32_SUBFAMILY_NAMES,
                DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_FAMILY_NAMES,
                DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_SUBFAMILY_NAMES,
                DWRITE_INFORMATIONAL_STRING_SAMPLE_TEXT,
                DWRITE_INFORMATIONAL_STRING_FULL_NAME,
                DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_NAME,
                DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_CID_NAME,
                DWRITE_INFORMATIONAL_STRING_WEIGHT_STRETCH_STYLE_FAMILY_NAME,
                DWRITE_INFORMATIONAL_STRING_DESIGN_SCRIPT_LANGUAGE_TAG,
                DWRITE_INFORMATIONAL_STRING_SUPPORTED_SCRIPT_LANGUAGE_TAG,
                DWRITE_INFORMATIONAL_STRING_PREFERRED_FAMILY_NAMES = DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_FAMILY_NAMES,
                DWRITE_INFORMATIONAL_STRING_PREFERRED_SUBFAMILY_NAMES = DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_SUBFAMILY_NAMES,
                DWRITE_INFORMATIONAL_STRING_WWS_FAMILY_NAME = DWRITE_INFORMATIONAL_STRING_WEIGHT_STRETCH_STYLE_FAMILY_NAME
        );

        DWRITE_FONT_SIMULATIONS = (
                DWRITE_FONT_SIMULATIONS_NONE,
                DWRITE_FONT_SIMULATIONS_BOLD,
                DWRITE_FONT_SIMULATIONS_OBLIQUE
        );

        DWRITE_PIXEL_GEOMETRY = (
                DWRITE_PIXEL_GEOMETRY_FLAT,
                DWRITE_PIXEL_GEOMETRY_RGB,
                DWRITE_PIXEL_GEOMETRY_BGR
        );

        DWRITE_RENDERING_MODE = (
                DWRITE_RENDERING_MODE_DEFAULT,
                DWRITE_RENDERING_MODE_ALIASED,
                DWRITE_RENDERING_MODE_GDI_CLASSIC,
                DWRITE_RENDERING_MODE_GDI_NATURAL,
                DWRITE_RENDERING_MODE_NATURAL,
                DWRITE_RENDERING_MODE_NATURAL_SYMMETRIC,
                DWRITE_RENDERING_MODE_OUTLINE,
                DWRITE_RENDERING_MODE_CLEARTYPE_GDI_CLASSIC = DWRITE_RENDERING_MODE_GDI_CLASSIC,
                DWRITE_RENDERING_MODE_CLEARTYPE_GDI_NATURAL = DWRITE_RENDERING_MODE_GDI_NATURAL,
                DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL = DWRITE_RENDERING_MODE_NATURAL,
                DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL_SYMMETRIC = DWRITE_RENDERING_MODE_NATURAL_SYMMETRIC
        );

        DWRITE_TEXT_ALIGNMENT = (
                DWRITE_TEXT_ALIGNMENT_LEADING,
                DWRITE_TEXT_ALIGNMENT_TRAILING,
                DWRITE_TEXT_ALIGNMENT_CENTER,
                DWRITE_TEXT_ALIGNMENT_JUSTIFIED
        );

        DWRITE_PARAGRAPH_ALIGNMENT = (
                DWRITE_PARAGRAPH_ALIGNMENT_NEAR,
                DWRITE_PARAGRAPH_ALIGNMENT_FAR,
                DWRITE_PARAGRAPH_ALIGNMENT_CENTER
        );

        DWRITE_WORD_WRAPPING = (
                DWRITE_WORD_WRAPPING_WRAP,
                DWRITE_WORD_WRAPPING_NO_WRAP,
                DWRITE_WORD_WRAPPING_EMERGENCY_BREAK,
                DWRITE_WORD_WRAPPING_WHOLE_WORD,
                DWRITE_WORD_WRAPPING_CHARACTER
        );

        DWRITE_READING_DIRECTION = (
                DWRITE_READING_DIRECTION_LEFT_TO_RIGHT,
                DWRITE_READING_DIRECTION_RIGHT_TO_LEFT,
                DWRITE_READING_DIRECTION_TOP_TO_BOTTOM,
                DWRITE_READING_DIRECTION_BOTTOM_TO_TOP
        );

        DWRITE_FLOW_DIRECTION = (
                DWRITE_FLOW_DIRECTION_TOP_TO_BOTTOM,
                DWRITE_FLOW_DIRECTION_BOTTOM_TO_TOP,
                DWRITE_FLOW_DIRECTION_LEFT_TO_RIGHT,
                DWRITE_FLOW_DIRECTION_RIGHT_TO_LEFT
        );

        DWRITE_TRIMMING_GRANULARITY = (
                DWRITE_TRIMMING_GRANULARITY_NONE,
                DWRITE_TRIMMING_GRANULARITY_CHARACTER,
                DWRITE_TRIMMING_GRANULARITY_WORD
        );

        DWRITE_BREAK_CONDITION = (
                DWRITE_BREAK_CONDITION_NEUTRAL,
                DWRITE_BREAK_CONDITION_CAN_BREAK,
                DWRITE_BREAK_CONDITION_MAY_NOT_BREAK,
                DWRITE_BREAK_CONDITION_MUST_BREAK
        );

        DWRITE_LINE_SPACING_METHOD = (
                DWRITE_LINE_SPACING_METHOD_DEFAULT,
                DWRITE_LINE_SPACING_METHOD_UNIFORM,
                DWRITE_LINE_SPACING_METHOD_PROPORTIONAL
        );

        DWRITE_FONT_FEATURE_TAG = (
                DWRITE_FONT_FEATURE_TAG_ALTERNATIVE_FRACTIONS           = $63726661, //afrc
                DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS_FROM_CAPITALS   = $63703263, //c2pc
                DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS_FROM_CAPITALS    = $63733263, //c2sc
                DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_ALTERNATES           = $746c6163, //calt
                DWRITE_FONT_FEATURE_TAG_CASE_SENSITIVE_FORMS            = $65736163, //case
                DWRITE_FONT_FEATURE_TAG_GLYPH_COMPOSITION_DECOMPOSITION = $706d6363, //ccmp
                DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_LIGATURES            = $67696c63, //clig
                DWRITE_FONT_FEATURE_TAG_CAPITAL_SPACING                 = $70737063, //cpsp
                DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_SWASH                = $68777363, //cswh
                DWRITE_FONT_FEATURE_TAG_CURSIVE_POSITIONING             = $73727563, //curs
                DWRITE_FONT_FEATURE_TAG_DEFAULT                         = $746c6664, //dflt
                DWRITE_FONT_FEATURE_TAG_DISCRETIONARY_LIGATURES         = $67696c64, //dlig
                DWRITE_FONT_FEATURE_TAG_EXPERT_FORMS                    = $74707865, //expt
                DWRITE_FONT_FEATURE_TAG_FRACTIONS                       = $63617266, //frac
                DWRITE_FONT_FEATURE_TAG_FULL_WIDTH                      = $64697766, //fwid
                DWRITE_FONT_FEATURE_TAG_HALF_FORMS                      = $666c6168, //half
                DWRITE_FONT_FEATURE_TAG_HALANT_FORMS                    = $6e6c6168, //haln
                DWRITE_FONT_FEATURE_TAG_ALTERNATE_HALF_WIDTH            = $746c6168, //halt
                DWRITE_FONT_FEATURE_TAG_HISTORICAL_FORMS                = $74736968, //hist
                DWRITE_FONT_FEATURE_TAG_HORIZONTAL_KANA_ALTERNATES      = $616e6b68, //hkna
                DWRITE_FONT_FEATURE_TAG_HISTORICAL_LIGATURES            = $67696c68, //hlig
                DWRITE_FONT_FEATURE_TAG_HALF_WIDTH                      = $64697768, //hwid
                DWRITE_FONT_FEATURE_TAG_HOJO_KANJI_FORMS                = $6f6a6f68, //hojo
                DWRITE_FONT_FEATURE_TAG_JIS04_FORMS                     = $3430706a, //jp04
                DWRITE_FONT_FEATURE_TAG_JIS78_FORMS                     = $3837706a, //jp78
                DWRITE_FONT_FEATURE_TAG_JIS83_FORMS                     = $3338706a, //jp83
                DWRITE_FONT_FEATURE_TAG_JIS90_FORMS                     = $3039706a, //jp90
                DWRITE_FONT_FEATURE_TAG_KERNING                         = $6e72656b, //kern
                DWRITE_FONT_FEATURE_TAG_STANDARD_LIGATURES              = $6167696c, //liga
                DWRITE_FONT_FEATURE_TAG_LINING_FIGURES                  = $6d756e6c, //lnum
                DWRITE_FONT_FEATURE_TAG_LOCALIZED_FORMS                 = $6c636f6c, //locl
                DWRITE_FONT_FEATURE_TAG_MARK_POSITIONING                = $6b72616d, //mark
                DWRITE_FONT_FEATURE_TAG_MATHEMATICAL_GREEK              = $6b72676d, //mgrk
                DWRITE_FONT_FEATURE_TAG_MARK_TO_MARK_POSITIONING        = $6b6d6b6d, //mkmk
                DWRITE_FONT_FEATURE_TAG_ALTERNATE_ANNOTATION_FORMS      = $746c616e, //nalt
                DWRITE_FONT_FEATURE_TAG_NLC_KANJI_FORMS                 = $6b636c6e, //nlck
                DWRITE_FONT_FEATURE_TAG_OLD_STYLE_FIGURES               = $6d756e6f, //onum
                DWRITE_FONT_FEATURE_TAG_ORDINALS                        = $6e64726f, //ordn
                DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_ALTERNATE_WIDTH    = $746c6170, //palt
                DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS                 = $70616370, //pcap
                DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_FIGURES            = $6d756e70, //pnum
                DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_WIDTHS             = $64697770, //pwid
                DWRITE_FONT_FEATURE_TAG_QUARTER_WIDTHS                  = $64697771, //qwid
                DWRITE_FONT_FEATURE_TAG_REQUIRED_LIGATURES              = $67696c72, //rlig
                DWRITE_FONT_FEATURE_TAG_RUBY_NOTATION_FORMS             = $79627572, //ruby
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_ALTERNATES            = $746c6173, //salt
                DWRITE_FONT_FEATURE_TAG_SCIENTIFIC_INFERIORS            = $666e6973, //sinf
                DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS                  = $70636d73, //smcp
                DWRITE_FONT_FEATURE_TAG_SIMPLIFIED_FORMS                = $6c706d73, //smpl
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1                 = $31307373, //ss01
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_2                 = $32307373, //ss02
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_3                 = $33307373, //ss03
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_4                 = $34307373, //ss04
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_5                 = $35307373, //ss05
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_6                 = $36307373, //ss06
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_7                 = $37307373, //ss07
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_8                 = $38307373, //ss08
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_9                 = $39307373, //ss09
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_10                = $30317373, //ss10
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_11                = $31317373, //ss11
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_12                = $32317373, //ss12
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_13                = $33317373, //ss13
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_14                = $34317373, //ss14
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_15                = $35317373, //ss15
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_16                = $36317373, //ss16
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_17                = $37317373, //ss17
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_18                = $38317373, //ss18
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_19                = $39317373, //ss19
                DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_20                = $30327373, //ss20
                DWRITE_FONT_FEATURE_TAG_SUBSCRIPT                       = $73627573, //subs
                DWRITE_FONT_FEATURE_TAG_SUPERSCRIPT                     = $73707573, //sups
                DWRITE_FONT_FEATURE_TAG_SWASH                           = $68737773, //swsh
                DWRITE_FONT_FEATURE_TAG_TITLING                         = $6c746974, //titl
                DWRITE_FONT_FEATURE_TAG_TRADITIONAL_NAME_FORMS          = $6d616e74, //tnam
                DWRITE_FONT_FEATURE_TAG_TABULAR_FIGURES                 = $6d756e74, //tnum
                DWRITE_FONT_FEATURE_TAG_TRADITIONAL_FORMS               = $64617274, //trad
                DWRITE_FONT_FEATURE_TAG_THIRD_WIDTHS                    = $64697774, //twid
                DWRITE_FONT_FEATURE_TAG_UNICASE                         = $63696e75, //unic
                DWRITE_FONT_FEATURE_TAG_VERTICAL_WRITING                = $74726576, //vert
                DWRITE_FONT_FEATURE_TAG_VERTICAL_ALTERNATES_AND_ROTATION= $32747276, //vrt2
                DWRITE_FONT_FEATURE_TAG_SLASHED_ZERO                    = $6f72657a //zero
        );

        DWRITE_SCRIPT_SHAPES = (
                DWRITE_SCRIPT_SHAPES_DEFAULT = 0,
                DWRITE_SCRIPT_SHAPES_NO_VISUAL = 1
        );

        DWRITE_NUMBER_SUBSTITUTION_METHOD = (
                DWRITE_NUMBER_SUBSTITUTION_METHOD_FROM_CULTURE,
                DWRITE_NUMBER_SUBSTITUTION_METHOD_CONTEXTUAL,
                DWRITE_NUMBER_SUBSTITUTION_METHOD_NONE,
                DWRITE_NUMBER_SUBSTITUTION_METHOD_NATIONAL,
                DWRITE_NUMBER_SUBSTITUTION_METHOD_TRADITIONAL
        );

        DWRITE_TEXTURE_TYPE = (
                DWRITE_TEXTURE_ALIASED_1x1,
                DWRITE_TEXTURE_CLEARTYPE_3x1
        );

        DWRITE_MEASURING_MODE = (
                DWRITE_MEASURING_MODE_NATURAL = 0,
                DWRITE_MEASURING_MODE_GDI_CLASSIC = 1,
                DWRITE_MEASURING_MODE_GDI_NATURAL = 2
        );
        {$MinEnumSize 1}


        //Struct/records
        DWRITE_FONT_METRICS = record
              designUnitsPerEm : Word;
              ascent : Word;
              descent : Word;
              lineGap : SmallInt;
              capHeight : Word;
              xHeight : Word;
              underlinePosition : SmallInt;
              underlineThickness : Word;
              strikethroughPosition : SmallInt;
              strikethroughThickness : Word;
        end;

        DWRITE_GLYPH_METRICS = record
            leftSideBearing : Integer;
            advanceWidth : Cardinal;
            rightSideBearing : Integer;
            topSideBearing : Integer;
            advanceHeight : Cardinal;
            bottomSideBearing : Integer;
            verticalOriginY : Integer;
        end;

        DWRITE_GLYPH_OFFSET = record
                advanceOffset : Single;
                ascenderOffset : Single;
        end;

        DWRITE_MATRIX = record
                m11 : Single;
                m12 : Single;
                m21 : Single;
                m22 : Single;
                dx : Single;
                dy : Single;
        end;

        DWRITE_TRIMMING = record
            granularity : DWRITE_TRIMMING_GRANULARITY;
            delimiter : Cardinal;
            delimiterCount : Cardinal;
        end;

        DWRITE_GLYPH_RUN = record
                fontFace : IDWriteFontFace;
                fontEmSize : Single;
                glyphCount : Cardinal;
                glyphIndices : PWord;
                glyphAdvances : PSingle;
                glyphOffsets : PDWRITE_GLYPH_OFFSET;
                isSideways : BOOL;
                bidiLevel : Cardinal;
        end;

        DWRITE_GLYPH_RUN_DESCRIPTION = record
                localeName : LPCWSTR;
                str : LPCWSTR;
                stringLen : Cardinal;
                clusterMap : PWord;
                textPosition : Cardinal;
        end;

        DWRITE_UNDERLINE = record
                width : Single;
                thickness : Single;
                offset : Single;
                runHeight : Single;
                readingDirection : DWRITE_READING_DIRECTION;
                flowDirection : DWRITE_FLOW_DIRECTION;
                localeName : LPCWSTR;
                measuringMode : DWRITE_MEASURING_MODE;
        end;

        DWRITE_STRIKETHROUGH = record
                width : Single;
                thickness : Single;
                offset : Single;
                readingDirection : DWRITE_READING_DIRECTION;
                flowDirection : DWRITE_FLOW_DIRECTION;
                localeName : LPCWSTR;
                measuringMode : DWRITE_MEASURING_MODE;
        end;

        DWRITE_INLINE_OBJECT_METRICS = record
                width : Single;
                height : Single;
                baseline : Single;
                supportsSideways : BOOL;
        end;

        DWRITE_OVERHANG_METRICS = record
                left : Single;
                top : Single;
                right : Single;
                bottom : Single;
        end;

        DWRITE_FONT_FEATURE = record
                nameTag : DWRITE_FONT_FEATURE_TAG;
                parameter : Cardinal;
        end;

        DWRITE_LINE_METRICS = record
                length : Cardinal;
                trailingWhitespaceLength : Cardinal;
                newlineLength : Cardinal;
                height : Single;
                baseline : Single;
                isTrimmed : BOOL;
        end;

        DWRITE_TEXT_METRICS = record
                left : Single;
                top : Single;
                width : Single;
                widthIncludingTrailingWhitespace : Single;
                height : Single;
                layoutWidth : Single;
                layoutHeight : Single;
                maxBidiReorderingDepth : Cardinal;
                lineCount : Cardinal;
        end;

        DWRITE_CLUSTER_METRICS = record
                width : Single;
                length : Word;
                flags : Word;
        end;

        DWRITE_HIT_TEST_METRICS = record
                textPosition : Cardinal;
                length : Cardinal;
                left : Single;
                top : Single;
                width : Single;
                height : Single;
                bidiLevel : Cardinal;
                isText : BOOL;
                isTrimmed : BOOL;
        end;

        DWRITE_SCRIPT_ANALYSIS = record
                script : Word;
                shapes : DWRITE_SCRIPT_SHAPES;
        end;

        DWRITE_LINE_BREAKPOINT = record
                flags : Byte;
        end;

        DWRITE_TYPOGRAPHIC_FEATURES = record
                features : PDWRITE_FONT_FEATURE;
                count : Cardinal;
        end;

        DWRITE_SHAPING_TEXT_PROPERTIES = record
                flags : Word;
        end;

        DWRITE_SHAPING_GLYPH_PROPERTIES = record
                flags : Word;
        end;

        DWRITE_TEXT_RANGE = record
                startPosition : Cardinal;
                length : Cardinal;
        end;

        //Pointer types
        PIUnknown = ^IUnknown; //IUnknown**
        PPointer = ^Pointer;   //void**

        //Enum pointers
        PDWRITE_FONT_FILE_TYPE = ^DWRITE_FONT_FILE_TYPE;
        PDWRITE_FONT_FACE_TYPE = ^DWRITE_FONT_FACE_TYPE;
        PDWRITE_RENDERING_MODE = ^DWRITE_RENDERING_MODE;
        PDWRITE_LINE_SPACING_METHOD = ^DWRITE_LINE_SPACING_METHOD;
        PDWRITE_FONT_WEIGHT = ^DWRITE_FONT_WEIGHT;
        PDWRITE_FONT_STYLE = ^DWRITE_FONT_STYLE;
        PDWRITE_FONT_STRETCH = ^DWRITE_FONT_STRETCH;

        //Struct/record pointers
        PDWRITE_FONT_METRICS = ^DWRITE_FONT_METRICS;
        PDWRITE_GLYPH_METRICS = ^DWRITE_GLYPH_METRICS;
        PDWRITE_MATRIX = ^DWRITE_MATRIX;
        PDWRITE_GLYPH_RUN = ^DWRITE_GLYPH_RUN;
        PDWRITE_GLYPH_RUN_DESCRIPTION = ^DWRITE_GLYPH_RUN_DESCRIPTION;
        PDWRITE_UNDERLINE = ^DWRITE_UNDERLINE;
        PDWRITE_STRIKETHROUGH = ^DWRITE_STRIKETHROUGH;
        PDWRITE_INLINE_OBJECT_METRICS = ^DWRITE_INLINE_OBJECT_METRICS;
        PDWRITE_OVERHANG_METRICS = ^DWRITE_OVERHANG_METRICS;
        PDWRITE_BREAK_CONDITION = ^DWRITE_BREAK_CONDITION;
        PDWRITE_TRIMMING = ^DWRITE_TRIMMING;
        PDWRITE_TEXT_RANGE = ^DWRITE_TEXT_RANGE;
        PDWRITE_LINE_METRICS = ^DWRITE_LINE_METRICS;
        PDWRITE_TEXT_METRICS = ^DWRITE_TEXT_METRICS;
        PDWRITE_CLUSTER_METRICS = ^DWRITE_CLUSTER_METRICS;
        PDWRITE_HIT_TEST_METRICS = ^DWRITE_HIT_TEST_METRICS;
        PDWRITE_SCRIPT_ANALYSIS = ^DWRITE_SCRIPT_ANALYSIS;
        PDWRITE_LINE_BREAKPOINT = ^DWRITE_LINE_BREAKPOINT;
        PDWRITE_TYPOGRAPHIC_FEATURES = ^DWRITE_TYPOGRAPHIC_FEATURES;
        PPDWRITE_TYPOGRAPHIC_FEATURES = ^PDWRITE_TYPOGRAPHIC_FEATURES;

        //Com object pointers
        PIDWriteFactory = ^IDWriteFactory;
        PIDWriteFontFileStream = ^IDWriteFontFileStream;
        PIDWriteFontFileLoader = ^IDWriteFontFileLoader;
        PIDWriteFontFile = ^IDWriteFontFile;
        PIDWriteFontFileEnumerator = ^IDWriteFontFileEnumerator;
        PIDWriteFontFamily = ^IDWriteFontFamily;
        PIDWriteLocalizedStrings = ^IDWriteLocalizedStrings;
        PIDWriteFontFace = ^IDWriteFontFace;
        PIDWriteFontCollection = ^IDWriteFontCollection;
        PIDWriteFont = ^IDWriteFont;
        PIDWriteFontList = ^IDWriteFontList;
        PIDWriteInlineObject = ^IDWriteInlineObject;
        PIDWriteBitmapRenderTarget = ^IDWriteBitmapRenderTarget;
        PIDWriteTypography = ^IDWriteTypography;
        PIDWriteNumberSubstitution = ^IDWriteNumberSubstitution;
        //COM object declaration

        IDWriteFontFileStream = interface(IUnknown)
        ['{6D4865FE-0AB8-4D91-8F62-5DD6BE34A3E0}']
                function ReadFileFragment(
                        fragment_start : PPointer;
                        offset : Int64;
                        fragmentSize : Int64;
                        fragmentContet : PPointer
                ) : HRESULT; stdcall;
                procedure ReleaseFileFragment(
                        fragmentContext : Pointer
                ); stdcall;
                function GetFileSize(size : PInt64) : HRESULT; stdcall;
                function GetLastWriteTime(
                        lastWriteTime : PInt64
                ) : HRESULT; stdcall;
        end;

        IDWriteFontFileLoader  = interface(IUnknown)
        ['{727CAD4E-D6AF-4C9E-8A08-D695B11CAA49}']
                function CreateStreamFromKey(
                        key : Pointer;
                        keySize : Cardinal;
                        stream : PIDWriteFontFileStream
                ) : HRESULT; stdcall;
        end;

        IDWriteLocalFontFileLoader = interface(IDWriteFontFileLoader)
        ['{B2D9F3EC-C9FE-4A11-A2EC-D86208F7C0A2}']
                function GetFilePathLengthFromKey(
                        key : Pointer;
                        keySize : Cardinal;
                        length : PCardinal
                ) : HRESULT; stdcall;
                function GetFilePathFromKey(
                        key : Pointer;
                        keySize : Cardinal;
                        path : PWideChar;
                        length : Cardinal
                ) : HRESULT; stdcall;
                function GetLastWriteTimeFromKey(
                        key : Pointer;
                        keySize : Cardinal;
                        writetime : FILETIME
                ) : HRESULT; stdcall;
        end;

        IDWriteFontFile = interface(IUnknown)
        ['{739D886A-CEF5-47DC-8769-1A8B41BEBBB0}']
                function GetReferenceKey(
                        key : Pointer;
                        keySize : PCardinal
                ) : HRESULT; stdcall;
                function GetLoader(
                        loader : PIDWriteFontFileLoader
                ) : HRESULT; stdcall;
                function Analyze(
                        is_supported_fonttype : PBOOL;
                        file_type : PDWRITE_FONT_FILE_TYPE;
                        face_type : PDWRITE_FONT_FACE_TYPE;
                        faces_num : PCardinal
                ) : HRESULT; stdcall;
        end;

        IDWriteFontFileEnumerator = interface(IUnknown)
        ['{72755049-5FF7-435D-8348-4BE97CFA6C7C}']
                function MoveNext(
                        has_current_file : PBOOL
                ) : HRESULT; stdcall;
                function GetCurrentFontFile(
                        font_file : PIDWriteFontFile
                ) : HRESULT; stdcall;

        end;

        IDWriteFontCollectionLoader  = interface(IUnknown)
        ['{CCA920E4-52F0-492B-BFA8-29C72EE0A468}']
                function CreateEnumeratorFromKey(
                        factory : IDWriteFactory;
                        key : Pointer;
                        keySize : Cardinal;
                        enumerator : PIDWriteFontFileEnumerator
                ) : HRESULT; stdcall;
        end;

        IDWriteLocalizedStrings = interface(IUnknown)
                function GetCount() : Cardinal; stdcall;
                function FindLocaleName(
                        locale_name : LPCWSTR;
                        index : PCardinal;
                        exists : PBOOL
                ) : HRESULT; stdcall;
                function GetLocaleNameLength(
                        index : Cardinal;
                        length : PCardinal
                ) : HRESULT; stdcall;
                function GetLocaleName(
                        index : Cardinal;
                        locale_name : PWideChar;
                        size : Cardinal
                ) : HRESULT; stdcall;
                function GetStringLength(
                        index : Cardinal;
                        length : PCardinal
                ) : HRESULT; stdcall;
                function GetString(
                        index : Cardinal;
                        buffer : PWideChar;
                        size : Cardinal
                ) : HRESULT; stdcall;
        end;

        IDWriteRenderingParams = interface(IUnknown)
        ['{2F0DA53A-2ADD-47CD-82EE-D9EC34688E75}']
                function GetGamma() : Single; stdcall;
                function GetEnhancedContrast() : Single; stdcall;
                function GetClearTypeLevel() : Single; stdcall;
                function GetPixelGeometry() : DWRITE_PIXEL_GEOMETRY; stdcall;
                function GetRenderingMode() : DWRITE_RENDERING_MODE; stdcall;
        end;

        IDWriteFontFace  = interface(IUnknown)
        ['{5F49804D-7024-4D43-BFA9-D25984F53849}']
                function GetType() : DWRITE_FONT_FACE_TYPE; stdcall;
                function GetFiles(
                        number_of_files : PCardinal;
                        fontfiles : PIDWriteFontFile
                ) : HRESULT; stdcall;
                function GetIndex() : Cardinal; stdcall;
                function GetSimulations() : DWRITE_FONT_SIMULATIONS; stdcall;
                function IsSymbolFont() : BOOL; stdcall;
                procedure GetMetrics(metrics : PDWRITE_FONT_METRICS); stdcall;
                function GetGlyphCount() : Word; stdcall;
                function GetDesignGlyphMetrics(
                        glyphIndices : PWord;
                        glyphCount : Cardinal;
                        metrics : PDWRITE_GLYPH_METRICS;
                        is_sideways : BOOL = False
                ) : HRESULT; stdcall;
                function GetGlyphIndices(
                        codepoints : PCardinal;
                        count : Cardinal;
                        glyph_indices : PWord
                ) : HRESULT; stdcall;
                function TryGetFontTable(
                        table_tag : Cardinal;
                        table_data : PPointer;
                        table_size : PCardinal;
                        context : PPointer;
                        exists : PBOOL
                ) : HRESULT; stdcall;
                procedure ReleaseFontTable(table_context : Pointer); stdcall;
                function GetGlyphRunOutline(
                        emSize : Single;
                        glyph_indices : PWord;
                        glyph_advances : PSingle;
                        glyph_offsets : PDWRITE_GLYPH_OFFSET;
                        glyph_count : Cardinal;
                        is_sideways : BOOL;
                        is_rtl : BOOL;
                        geometrySink : PIDWriteGeometrySink
                ) : HRESULT; stdcall;
                function GetRecommendedRenderingMode(
                        emSize : Single;
                        pixels_per_dip : Single;
                        mode : DWRITE_MEASURING_MODE;
                        params : IDWriteRenderingParams;
                        renderingMode : PDWRITE_RENDERING_MODE
                ) : HRESULT; stdcall;
                function GetGdiCompatibleMetrics(
                        emSize : Single;
                        pixels_per_dip : Single;
                        transform : PDWRITE_MATRIX;
                        metrics : PDWRITE_FONT_METRICS
                ) : HRESULT; stdcall;
                function GetGdiCompatbileGlyphMetrics(
                        emSize : Single;
                        pixels_per_dip : Single;
                        transform : PDWRITE_MATRIX;
                        use_gdi_natural : BOOL;
                        glyph_count : Cardinal;
                        metrics : PDWRITE_GLYPH_METRICS;
                        is_sideways : BOOL = False
                ) : HRESULT; stdcall;
        end;

        IDWriteFont = interface(IUnknown)
        ['{ACD16696-8C14-4F5D-877E-FE3FC1D32737}']
                function GetFontFamily(
                        family : PIDWriteFontFamily
                ): HRESULT; stdcall;
                function GetWeight() : DWRITE_FONT_WEIGHT; stdcall;
                function GetStretch() : DWRITE_FONT_STRETCH; stdcall;
                function GetStyle() : DWRITE_FONT_STYLE; stdcall;
                function IsSymbolFont() : BOOL;
                function GetFaceNames(
                        names : PIDWriteLocalizedStrings
                ) : HRESULT; stdcall;
                function GetInformationalStrings(
                        stringid : DWRITE_INFORMATIONAL_STRING_ID;
                        strings : PIDWriteLocalizedStrings;
                        exists : PBOOL
                ) : HRESULT; stdcall;
                function GetSimulations() : DWRITE_FONT_SIMULATIONS; stdcall;
                procedure GetMetrics(metrics : PDWRITE_FONT_METRICS); stdcall;
                function HasCharacter(
                        value : Cardinal;
                        exists : PBOOL
                ) : HRESULT; stdcall;
                function CreateFontFace(
                        face : PIDWriteFontFace
                ) : HRESULT; stdcall;
        end;

        IDWriteFontList = interface(IUnknown)
        ['{1A0D8438-1D97-4EC1-AEF9-A2FB86ED6ACB}']
                function GetFontCollection(
                        collection : PIDWriteFontCollection
                ) : HRESULT; stdcall;
                function GetFontCount() : Cardinal; stdcall;
                function GetFont(
                        index : Cardinal;
                        font : PIDWriteFont
                ) : HRESULT; stdcall;
        end;

        IDWriteFontFamily = interface(IDWriteFontList)
        ['{DA20D8EF-812A-4C43-9802-62EC4ABD7ADD}']
                function GetFamilyNames(
                        names : PIDWriteLocalizedStrings
                ) : HRESULT; stdcall;
                function GetFirstMatchingFont(
                        weight : DWRITE_FONT_WEIGHT;
                        strecth : DWRITE_FONT_STRETCH;
                        style : DWRITE_FONT_STYLE;
                        font : PIDWriteFont
                ) : HRESULT; stdcall;
                function GetMatchingFonts(
                        weight : DWRITE_FONT_WEIGHT;
                        stretch : DWRITE_FONT_STRETCH;
                        style : DWRITE_FONT_STYLE;
                        fonts : PIDWriteFontList
                ) : HRESULT; stdcall;
        end;

        IDWriteFontCollection = interface(IUnknown)
        ['{A84CEE02-3EEA-4EEE-A827-87C1A02A0FCC}']
                function GetFontFamilyCount() : Cardinal; stdcall;
                function GetFontFamily(
                        index : Cardinal;
                        family : PIDWriteFontFamily
                ) : HRESULT; stdcall;
                function FindFamilyName(
                        name : LPCWSTR;
                        index : PCardinal;
                        exists : PBOOL
                ) : HRESULT; stdcall;
                function GetFontFromFontFace(
                        face : IDWriteFontFace;
                        font : PIDWriteFont
                ) : HRESULT; stdcall;
        end;

        IDWritePixelSnapping = interface(IUnknown)
        ['{EAF3A2DA-ECF4-4D24-B644-B34F6842024B}']
                function IsPixelSnappingDisabled(
                        client_drawingcontext : Pointer;
                        disabled : PBOOL
                ) : HRESULT; stdcall;
                function GetCurrentTransform(
                        client_drawingcontext : Pointer;
                        transform : PDWRITE_MATRIX
                ) : HRESULT; stdcall;
                function GetPixelsPerDip(
                        client_drawingcontext : Pointer;
                        pixels_per_dip : PSingle
                ) : HRESULT; stdcall;
        end;

        IDWriteTextRenderer = interface(IDWritePixelSnapping)
        ['{EF8A8135-5CC6-45FE-8825-C5A0724EB819}']
                function DrawGlyphRun(
                        client_drawingcontext : Pointer;
                        baselineOriginX : Single;
                        baselineOriginY : Single;
                        mode : DWRITE_MEASURING_MODE;
                        glyph_run : PDWRITE_GLYPH_RUN;
                        run_descr : PDWRITE_GLYPH_RUN_DESCRIPTION;
                        drawing_effect : PIUnknown
                ) : HRESULT; stdcall;
                function DrawUnderline(
                        client_drawingcontext : Pointer;
                        baselineOriginX : Single;
                        baselineOriginY : Single;
                        underline : PDWRITE_UNDERLINE;
                        drawing_effect : IUnknown
                ) : HRESULT; stdcall;
                function DrawStrikethrough(
                        client_drawingcontext : Pointer;
                        baselineOriginX : Single;
                        baselineOriginY : Single;
                        strikethrough : PDWRITE_STRIKETHROUGH;
                        drawing_effect : IUnknown
                ) : HRESULT; stdcall;
                function DrawInlineObject(
                        client_drawingcontext : Pointer;
                        originX : Single;
                        originY : Single;
                        obj : IDWriteInlineObject;
                        is_sideways : BOOL;
                        is_rtl : BOOL;
                        drawing_effect : IUnknown
                ) : HRESULT; stdcall;
        end;

        IDWriteInlineObject = interface(IUnknown)
        ['{8339FDE3-106F-47AB-8373-1C6295EB10B3}']
                function Draw(
                        client_drawingontext : Pointer;
                        renderer : IDWriteTextRenderer;
                        originX : Single;
                        originY : Single;
                        is_sideways : BOOL;
                        is_rtl : BOOL;
                        drawing_effect : IUnknown
                ) : HRESULT; stdcall;
                function GetMetrics(
                        metrics : PDWRITE_INLINE_OBJECT_METRICS
                ) : HRESULT; stdcall;
                function GetOverhangMetrics(
                        overhangs : PDWRITE_OVERHANG_METRICS
                ) : HRESULT; stdcall;
                function GetBreakConditions(
                        condition_before : PDWRITE_BREAK_CONDITION;
                        condition_after : PDWRITE_BREAK_CONDITION
                ) : HRESULT; stdcall;
        end;

        IDWriteTextFormat = interface(IUnknown)
        ['{9C906818-31D7-4FD3-A151-7C5E225DB55A}']
                function SetTextAlignment(
                        alignment : DWRITE_TEXT_ALIGNMENT
                ) : HRESULT; stdcall;
                function SetParagraphAlignment(
                        alignment : DWRITE_PARAGRAPH_ALIGNMENT
                ) : HRESULT; stdcall;
                function SetWordWrapping(
                        wrapping : DWRITE_WORD_WRAPPING
                ) : HRESULT; stdcall;
                function SetReadingDirection(
                        direction : DWRITE_READING_DIRECTION
                ) : HRESULT; stdcall;
                function SetFlowDirection(
                        direction : DWRITE_FLOW_DIRECTION
                ) : HRESULT; stdcall;
                function SetIncrementalTabStop(
                        tabstop : Single
                ) : HRESULT; stdcall;
                function SetTrimming(
                        trimming : PDWRITE_TRIMMING;
                        trimming_sign : IDWriteInlineObject
                ) : HRESULT; stdcall;
                function SetLineSpacing(
                        spacing : DWRITE_LINE_SPACING_METHOD;
                        line_spacing : Single;
                        baseline : Single
                ) : HRESULT; stdcall;
                function GetTextAlignment() : DWRITE_TEXT_ALIGNMENT; stdcall;
                function GetParagraphAlignment() : DWRITE_PARAGRAPH_ALIGNMENT;stdcall;
                function GetWordWrapping() : DWRITE_WORD_WRAPPING; stdcall;
                function GetReadingDirection() : DWRITE_READING_DIRECTION; stdcall;
                function GetFlowDirection() : DWRITE_FLOW_DIRECTION; stdcall;
                function GetIncrementalTabStop() : Single; stdcall;
                function GetTrimming(
                        options : PDWRITE_TRIMMING;
                        trimming_sign : PIDWriteInlineObject
                ) : HRESULT; stdcall;
                function GetLineSpacing(
                        method : PDWRITE_LINE_SPACING_METHOD;
                        spacing : PSingle;
                        baseline : PSingle
                ) : HRESULT; stdcall;
                function GetFontCollection(
                        collection : PIDWriteFontCollection
                ): HRESULT; stdcall;
                function GetFontFamilyNameLength() : Cardinal; stdcall;
                function GetFontFamilyName(
                        name : PWideChar;
                        size : Cardinal
                ) : HRESULT; stdcall;
                function GetFontWeight() : DWRITE_FONT_WEIGHT; stdcall;
                function GetFontStyle() : DWRITE_FONT_STYLE; stdcall;
                function GetFontStretch() : DWRITE_FONT_STRETCH; stdcall;
                function GetFontSize() : Single; stdcall;
                function GetLocaleNameLength() : Cardinal; stdcall;
                function GetLocaleName(
                        name : PWideChar;
                        size : Cardinal
                ) : HRESULT; stdcall;
        end;

        IDWriteTypography = interface(IUnknown)
        ['{55F1112B-1DC2-4B3C-9541-F46894ED85B6}']
                function AddFontFeature(
                        feature : DWRITE_FONT_FEATURE
                ) : HRESULT; stdcall;
                function GetFontFeatureCount() : Cardinal;
                function GetFontFeature(
                        index : Cardinal;
                        feature : PDWRITE_FONT_FEATURE
                ) : HRESULT; stdcall;
        end;

        IDWriteBitmapRenderTarget = interface(IUnknown)
        ['{5E5A32A3-8DFF-4773-9FF6-0696EAB77267}']
                function DrawGlyphRun(
                        baselineOriginX : Single;
                        baselineOriginY : Single;
                        measuring_mode : DWRITE_MEASURING_MODE;
                        glyph_run : PDWRITE_GLYPH_RUN;
                        textColor : COLORREF;
                        blackbox_rect : PRect = nil
                ) : HRESULT; stdcall;
                function GetMemoryDC() : HDC; stdcall;
                function GetPixelsPerDip() : Single; stdcall;
                function SetPixelsPerDip(
                        pixels_per_dip : Single
                ) : HRESULT; stdcall;
                function GetCurrentTransform(
                        transform : PDWRITE_MATRIX
                ) : HRESULT; stdcall;
                function SetCurrentTransform(
                        transform : PDWRITE_MATRIX
                ) : HRESULT; stdcall;
                function GetSize(
                        size : PCardinal //Check
                ) : HRESULT; stdcall;
                function Resize(
                        width : Cardinal;
                        height : Cardinal
                ) : HRESULT; stdcall;
        end;

        IDWriteGdiInterop = interface(IUnknown)
        ['{1EDD9491-9853-4299-898F-6432983B6F3A}']
                function CreateFontFromLOGFONT(
                        logfont : PLOGFONTW;
                        font : PIDWriteFont
                ) : HRESULT; stdcall;
                function ConvertFontToLOGFONT(
                        font : IDWriteFont;
                        logfont : PLOGFONTW;
                        is_systemfont : PBOOL
                ) : HRESULT; stdcall;
                function ConvertFontFaceToLOGFONT(
                        font : IDWriteFontFace;
                        logfont : PLOGFONTW
                ) : HRESULT; stdcall;
                function CreateFontFaceFromHdc(
                        dc : HDC;
                        fontface : PIDWriteFontFace
                ) : HRESULT; stdcall;
                function CreateBitmapRenderTarget(
                        dc : HDC;
                        width : Cardinal;
                        height : Cardinal;
                        target : PIDWriteBitmapRenderTarget
                ) : HRESULT; stdcall;
        end;

        IDWriteTextLayout = interface(IDWriteTextFormat)
        ['{53737037-6D14-410B-9BFE-0B182BB70961}']
                function SetMaxWidth(maxWidth : Single): HRESULT; stdcall;
                function SetMaxHeight(maxHeight : Single): HRESULT; stdcall;
                function SetFontCollection(
                        collection : IDWriteFontCollection;
                        range : DWRITE_TEXT_RANGE
                ): HRESULT; stdcall;
                function SetFontFamilyName(
                        name : PWideChar;
                        range : DWRITE_TEXT_RANGE
                ) : HRESULT; stdcall;
                function SetFontWeight(
                        weight : DWRITE_FONT_WEIGHT;
                        range : DWRITE_TEXT_RANGE
                ) : HRESULT; stdcall;
                function SetFontStyle(
                        style : DWRITE_FONT_STYLE;
                        range : DWRITE_TEXT_RANGE
                ) : HRESULT; stdcall;
                function SetFontStretch(
                        stretch : DWRITE_FONT_STRETCH;
                        range : DWRITE_TEXT_RANGE
                ) : HRESULT; stdcall;
                function SetFontSize(
                        size : Single;
                        range : DWRITE_TEXT_RANGE
                ) : HRESULT; stdcall;
                function SetUnderline(
                        underline : BOOL;
                        range : DWRITE_TEXT_RANGE
                ) : HRESULT; stdcall;
                function SetStrikethrough(
                        strikethrough : BOOL;
                        range : DWRITE_TEXT_RANGE
                ) : HRESULT; stdcall;
                function SetDrawingEffect(
                        effect : IUnknown;
                        range : DWRITE_TEXT_RANGE
                ): HRESULT; stdcall;
                function SetInlineObject(
                        obj : IDWriteInlineObject;
                        range : DWRITE_TEXT_RANGE
                ) : HRESULT; stdcall;
                function SetTypography(
                        typography : IDWriteTypography;
                        range : DWRITE_TEXT_RANGE
                ) : HRESULT; stdcall;
                function SetLocaleName(
                        locale : LPCWSTR;
                        range : DWRITE_TEXT_RANGE
                ) : HRESULT; stdcall;
                function GetMaxWidth() : Single; stdcall;
                function GetMaxHeight() : Single; stdcall;
                function GetFontCollection(
                        pos : Cardinal;
                        collection : PIDWriteFontCollection;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetFontFamilyNameLength(
                        pos : Cardinal;
                        len : PCardinal;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetFontFamilyName(
                        position : Cardinal;
                        name : PWideChar;
                        nameSize : Cardinal;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetFontWeight(
                        position : Cardinal;
                        weight : PDWRITE_FONT_WEIGHT;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetFontStyle(
                        currentPosition : Cardinal;
                        style : PDWRITE_FONT_STYLE;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetFontStretch(
                        position : Cardinal;
                        stretch : PDWRITE_FONT_STRETCH;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetFontSize(
                        position : Cardinal;
                        size : PSingle;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetUnderline(
                        position : Cardinal;
                        has_underline : PBOOL;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetStrikethrough(
                        position : Cardinal;
                        has_strikethrough : PBOOL;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetDrawingEffect(
                        position : Cardinal;
                        effect : PIUnknown;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetInlineObject(
                        position : Cardinal;
                        obj : PIDWriteInlineObject;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetTypography(
                        position : Cardinal;
                        typography : PIDWriteTypography
                ) : HRESULT; stdcall;
                function GetLocaleNameLength(
                        position : Cardinal;
                        length : PCardinal;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function GetLocaleName(
                        position : Cardinal;
                        name : PWideChar;
                        nameSize : Cardinal;
                        range : PDWRITE_TEXT_RANGE = nil
                ) : HRESULT; stdcall;
                function Draw(
                        context : Pointer;
                        renderer : IDWriteTextRenderer;
                        originX : Single;
                        originY : Single
                ) : HRESULT; stdcall;
                function GetLineMetrics(
                        metrics : PDWRITE_LINE_METRICS;
                        max_count : Cardinal;
                        actual_count : PCardinal
                ) : HRESULT; stdcall;
                function GetMetrics(
                        metrics : PDWRITE_TEXT_METRICS
                ) : HRESULT; stdcall;
                function GetOverhangMetrics(
                        overhangs : PDWRITE_OVERHANG_METRICS
                ) : HRESULT; stdcall;
                function GetClusterMetrics(
                        metrics : PDWRITE_CLUSTER_METRICS;
                        max_count : Cardinal;
                        act_count : PCardinal
                ) : HRESULT; stdcall;
                function DetermineMinWidth(min_width : PSingle) : HRESULT; stdcall;
                function HitTestPoint(
                        pointX : Single;
                        pointY : Single;
                        is_trailinghit : PBOOL;
                        is_inside : PBOOL;
                        metrics : PDWRITE_HIT_TEST_METRICS
                ) : HRESULT; stdcall;
                function HitTestTextPosition(
                        textPosition : Cardinal;
                        is_trailinghit : BOOL;
                        pointX : Single;
                        pointY : Single;
                        metrics : PDWRITE_HIT_TEST_METRICS
                ) : HRESULT; stdcall;
                function HitTestTextRange(
                        textPosition : Cardinal;
                        textLength : Cardinal;
                        originX : Single;
                        originY : Single;
                        metrics : PDWRITE_HIT_TEST_METRICS;
                        max_metricscount : Cardinal;
                        actual_metricscount : PCardinal
                ) : HRESULT; stdcall;
        end;

        IDWriteNumberSubstitution = interface(IUnknown)
        ['{14885CC9-BAB0-4F90-B6ED-5C366A2CD03D}']
        end;

        IDWriteTextAnalysisSource = interface(IUnknown)
        ['{688E1A58-5094-47C8-ADC8-FBCEA60AE92B}']
                function GetTextAtPosition(
                        position : Cardinal;
                        text : PPWideChar;
                        textLen : PCardinal
                ) : HRESULT; stdcall;
                function GetTextBeforePosition(
                        position : Cardinal;
                        text : PPWideChar;
                        textLen : PCardinal
                ) : HRESULT; stdcall;
                function GetParagraphReadingDirection() : DWRITE_READING_DIRECTION; stdcall;
                function GetLocaleName(
                        position : Cardinal;
                        textLen : PCardinal;
                        locale : PPWideChar
                ) : HRESULT; stdcall;
                function GetNumberSubstitution(
                        position : Cardinal;
                        textLen : PCardinal;
                        substitution : PIDWriteNumberSubstitution
                ) : HRESULT; stdcall;
        end;

        IDWriteTextAnalysisSink = interface(IUnknown)
        ['{5810CD44-0CA0-4701-B3FA-BEC5182AE4F6}']
                function SetScriptAnalysis(
                        position : Cardinal;
                        length : Cardinal;
                        scriptanalysis : PDWRITE_SCRIPT_ANALYSIS
                ) : HRESULT; stdcall;
                function SetLineBreakpoints(
                        position : Cardinal;
                        length : Cardinal;
                        breakpoints : PDWRITE_LINE_BREAKPOINT
                ) : HRESULT; stdcall;
                function SetBidiLevel(
                        position : Cardinal;
                        length : Cardinal;
                        explicitLevel : Byte;
                        resolvedLevel : Byte
                ) : HRESULT; stdcall;
                function SetNumberSubstitution(
                        position : Cardinal;
                        length : Cardinal;
                        substitution : IDWriteNumberSubstitution
                ) : HRESULT; stdcall;
        end;


        IDWriteTextAnalyzer = interface(IUnknown)
        ['{B7E6163E-7F46-43B4-84B3-E4E6249C365D}']
                function AnalyzeScript(
                        source : IDWriteTextAnalysisSource;
                        position : Cardinal;
                        length : Cardinal;
                        sink : IDWriteTextAnalysisSink
                ) : HRESULT; stdcall;
                function AnalyzeBidi(
                        source : IDWriteTextAnalysisSource;
                        position : Cardinal;
                        length : Cardinal;
                        sink : IDWriteTextAnalysisSink
                ) : HRESULT; stdcall;
                function AnalyzeNumberSubstitution(
                        source : IDWriteTextAnalysisSource;
                        position : Cardinal;
                        length : Cardinal;
                        sink : IDWriteTextAnalysisSink
                ) : HRESULT; stdcall;
                function AnalyzeLineBreakpoints(
                        source : IDWriteTextAnalysisSource;
                        position : Cardinal;
                        length : Cardinal;
                        sink : IDWriteTextAnalysisSink
                ) : HRESULT; stdcall;
                function GetGlyphs(
                        text : LPCWSTR;
                        length : Cardinal;
                        fontFace : IDWriteFontFace;
                        is_sideways : BOOL;
                        is_rtl : BOOL;
                        analysis : PDWRITE_SCRIPT_ANALYSIS;
                        locale : LPCWSTR;
                        substitution : IDWriteNumberSubstitution;
                        features : PPDWRITE_TYPOGRAPHIC_FEATURES;
                        feature_range_len : PCardinal;
                        feature_ranges : Cardinal;
                        max_glyph_count : Cardinal;
                        clutesrmap : PWord;
                        text_props : PDWRITE_SHAPING_TEXT_PROPERTIES;
                        glyph_indices : PWord;
                        glyph_props : PDWRITE_SHAPING_GLYPH_PROPERTIES;
                        actual_glyph_count : PCardinal
                ) : HRESULT; stdcall;
                function GetGlyphPlacement(
                        text : LPCWSTR;
                        clustermap : PWord;
                        props : PDWRITE_SHAPING_TEXT_PROPERTIES;
                        textLen : Cardinal;
                        glyph_indices : PWord;
                        glyph_props : PDWRITE_SHAPING_GLYPH_PROPERTIES;
                        glyph_count : Cardinal;
                        font_face : IDWriteFontFace;
                        fontEmSize : Single;
                        is_sideways : BOOL;
                        is_rtl : BOOL;
                        analysis : PDWRITE_SCRIPT_ANALYSIS;
                        locale : LPCWSTR;
                        features : PPDWRITE_TYPOGRAPHIC_FEATURES;
                        feature_range_len : PCardinal;
                        feature_ranges : Cardinal;
                        glyph_advances : PSingle;
                        glyph_offsets : PDWRITE_GLYPH_OFFSET
                ) : HRESULT; stdcall;
                function GetGdiCompatibleGlyphPlacement(
                        text : LPCWSTR;
                        clustermap : PWord;
                        props : PDWRITE_SHAPING_TEXT_PROPERTIES;
                        textLen : Cardinal;
                        glyph_indices : PWord;
                        glyph_props : PDWRITE_SHAPING_GLYPH_PROPERTIES;
                        glyph_count : Cardinal;
                        font_face : IDWriteFontFace;
                        fontEmSize : Single;
                        pixels_per_dip : Single;
                        transform : PDWRITE_MATRIX;
                        use_gdi_natural : BOOL;
                        is_sideways : BOOL;
                        is_rtl : BOOL;
                        analysis : PDWRITE_SCRIPT_ANALYSIS;
                        locale : LPCWSTR;
                        features : PPDWRITE_TYPOGRAPHIC_FEATURES;
                        feature_range_len : PCardinal;
                        feature_ranges : Cardinal;
                        glyph_advances : PSingle;
                        glyph_offsets : PDWRITE_GLYPH_OFFSET
                ) : HRESULT; stdcall;
        end;

        IDWriteGlyphRunAnalysis = interface(IUnknown)
        ['{7D97DBF7-E085-42D4-81E3-6A883BDED118}']
                function GetAlphaTextureBounds(
                        ttype : DWRITE_TEXTURE_TYPE;
                        bounds : PRECT
                ) : HRESULT; stdcall;
                function CreateAlphaTexture(
                        ttype : DWRITE_TEXTURE_TYPE;
                        bounds : PRECT;
                        alphaValues : PByte
                ) : HRESULT; stdcall;
                function GetAlphaBlendParams(
                        renderingParams : IDWriteRenderingParams;
                        blendGamma : PSingle;
                        blendEnchancedContrast : PSingle;
                        blendClearTypeLevel : PSingle
                ) : HRESULT; stdcall;
        end;

        IDWriteFactory = interface(IUnknown)
        ['{B859EE5A-D838-4B5B-A2E8-1ADC7D93DB48}']
                function GetSystemFontCollection(
                        collection : PIDWriteFontCollection;
                        check_for_updates : BOOL = False
                ) : HRESULT; stdcall;
                function CreateCustomFontCollection(
                        loader : IDWriteFontCollectionLoader;
                        key : Pointer;
                        keySize : Cardinal;
                        collection : PIDWriteFontCollection
                ) : HRESULT; stdcall;
                function RegisterFontCollectionLoader(
                        loader : IDWriteFontCollectionLoader
                ) : HRESULT; stdcall;
                function UnregisterFontCollectionLoader(
                        loader : IDWriteFontCollectionLoader
                ) : HRESULT; stdcall;
                function CreateFontFileReference(
                        path : LPCWSTR;
                        writetime : PFILETIME;
                        fontfile : PIDWriteFontFile
                ) : HRESULT; stdcall;
                function CreateCustomFontFileReference(
                        referenceKey : Pointer;
                        keySize : Cardinal;
                        loader : IDWriteFontFileLoader;
                        fontFile : PIDWriteFontFile
                ) : HRESULT; stdcall;
                function CreateFontFace(
                        facetype : DWRITE_FONT_FACE_TYPE;
                        files_number : Cardinal;
                        font_files : PIDWriteFontFile;
                        index : Cardinal;
                        sim_flags : DWRITE_FONT_SIMULATIONS;
                        font_face : PIDWriteFontFace
                ) : HRESULT; stdcall;
                function CreateRenderingParams(
                        params : PIDWriteRenderingParams
                ) : HRESULT; stdcall;
                function CreateMonitorRenderingParams(
                        monitor : Pointer;
                        params : PIDWriteRenderingParams
                ) : HRESULT; stdcall;
                function CreateCustomRenderingParams(
                        gamma : Single;
                        enchancedContrast : Single;
                        cleartype_level : Single;
                        geometry : DWRITE_PIXEL_GEOMETRY;
                        mode : DWRITE_RENDERING_MODE;
                        params : PIDWriteRenderingParams
                ) : HRESULT; stdcall;
                function RegisterFontFileLoader(
                        loader : IDWriteFontFileLoader
                ) : HRESULT; stdcall;
                function UnregisterFontFileLoader(
                        loader : IDWriteFontFileLoader
                ) : HRESULT; stdcall;
                function CreateTextFormat(
                        family_name : LPCWSTR;
                        collection : IDWriteFontCollection;
                        weight : DWRITE_FONT_WEIGHT;
                        style : DWRITE_FONT_STYLE;
                        stretch : DWRITE_FONT_STRETCH;
                        size : Single;
                        locale : LPCWSTR;
                        format : PIDWriteTextFormat
                ) : HRESULT; stdcall;
                function CreateTextLayout(
                        str : LPCWSTR;
                        strlength : Cardinal;
                        format : IDWriteTextFormat;
                        max_width : Single;
                        max_height : Single;
                        layout : PIDWriteTextLayout
                ) : HRESULT; stdcall;
                function CreateGdiCompatibleTextLayout(
                        str : LPCWSTR;
                        strlength : Cardinal;
                        format : IDWriteTextFormat;
                        layout_width : Single;
                        layout_height : Single;
                        pixels_per_dip : Single;
                        transform : PDWRITE_MATRIX;
                        use_gdi_natural : BOOL;
                        layout : PIDWriteTextLayout
                ) : HRESULT; stdcall;
                function CreateEllipsisTrimmingSign(
                        format : IDWriteTextFormat;
                        trimming_sign : PIDWriteInlineObject
                ) : HRESULT; stdcall;
                function CreateTextAnalyzer(
                        analyzer : PIDWriteTextAnalyzer
                ) : HRESULT; stdcall;
                function CreateNumberSubstitution(
                        method : DWRITE_NUMBER_SUBSTITUTION_METHOD;
                        locale : LPCWSTR;
                        ignore_user_override : BOOL;
                        substitution : PIDWriteNumberSubstitution
                ) : HRESULT; stdcall;
                function CreateNumberSubstitution(
                        method : DWRITE_NUMBER_SUBSTITUTION_METHOD;
                        locale : LPCWSTR;
                        ignore_user_override : BOOL;
                        substitution : PIDWriteNumberSubstitution
                ) : HRESULT; stdcall;
                function CreateGlyphRunAnalysis(
                        glyph_run : PDWRITE_GLYPH_RUN;
                        pixels_per_dip : Single;
                        transform : PDWRITE_MATRIX;
                        rendering_mode : DWRITE_RENDERING_MODE;
                        measuring_mode : DWRITE_MEASURING_MODE;
                        baseline_x : Single;
                        baseline_y : Single;
                        analysis : PIDWriteGlyphRunAnalysis
                ) : HRESULT; stdcall;
        end;

        function DWriteCreateFactory(
                factoryType : DWRITE_FACTORY_TYPE;
                iid : PGUID;
                factory : PIDWriteFactory
        ) : HRESULT; stdcall; external 'Dwrite.dll';

implementation


end.