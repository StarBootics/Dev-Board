; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; Project name : Dev-Board
; File name : FormatColor.pbi
; File Version : 1.0.0
; Programmation : OK
; Programmed by : Guillaume Saumure
; AKA : StarBootics
; E-mail : gsaumure@cgocable.ca
; Creation Date : 22-06-2024
; Last update : 22-06-2024
; Coded for PureBasic : V6.11 LTS
; Platform : Windows, Linux, MacOS X
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; This is free and unencumbered software released into the public domain.
; 
; Anyone is free to copy, modify, publish, use, compile, sell, or
; distribute this software, either in source code form or as a compiled
; binary, for any purpose, commercial or non-commercial, and by any
; means.
; 
; In jurisdictions that recognize copyright laws, the author or authors
; of this software dedicate any and all copyright interest in the
; software to the public domain. We make this dedication for the benefit
; of the public at large and to the detriment of our heirs and
; successors. We intend this dedication to be an overt act of
; relinquishment in perpetuity of all present and future rights to this
; software under copyright law.
; 
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
; IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
; OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
; ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
; OTHER DEALINGS IN THE SOFTWARE.
; 
; For more information, please refer to <http://unlicense.org/>
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

DeclareModule FormatColor
  
  Declare.s DoIt(Color.q, ColorMode.i = 0)
  Declare.q UndoIt(FormattedColor.s)
  
EndDeclareModule

Module FormatColor
  
  Procedure.s DoIt(Color.q, ColorMode.i = 0)
    
    Select ColorMode
        
      Case 0
        FormattedColor.s = "RGB(" + RSet(Str(Red(Color)), 3, "0") + ", " + RSet(Str(Green(Color)), 3, "0") + ", " + RSet(Str(Blue(Color)), 3, "0") + ")"
        
      Case 1
        FormattedColor.s = "RGBA(" + RSet(Str(Red(Color)), 3, "0") + ", " + RSet(Str(Green(Color)), 3, "0") + ", " + RSet(Str(Blue(Color)), 3, "0") + ", " + RSet(Str(Alpha(Color)), 3, "0") + ")"
        
      Default
        FormattedColor.s = "RGB(" + RSet(Str(Red(Color)), 3, "0") + ", " + RSet(Str(Green(Color)), 3, "0") + ", " + RSet(Str(Blue(Color)), 3, "0") + ")"
        
    EndSelect
    
    ProcedureReturn FormattedColor
  EndProcedure
  
  Procedure.q UndoIt(FormattedColor.s)
    
    Values.s = StringField(StringField(FormattedColor, 2, "("), 1, ")")
    
    Select StringField(FormattedColor, 1, "(")
        
      Case "RGB"
        Red.a = Val(StringField(Values, 1, ","))
        Green.a = Val(StringField(Values, 2, ","))
        Blue.a = Val(StringField(Values, 3, ","))
        Color.q = RGB(Red, Green, Blue)
        
      Case "RGBA"
        Red.a = Val(StringField(Values, 1, ","))
        Green.a = Val(StringField(Values, 2, ","))
        Blue.a = Val(StringField(Values, 3, ","))
        Alpha.a = Val(StringField(Values, 4, ","))
        Color.q = RGBA(Red, Green, Blue, Alpha)
        
      Default 
        Red.a = Val(StringField(Values, 1, ","))
        Green.a = Val(StringField(Values, 2, ","))
        Blue.a = Val(StringField(Values, 3, ","))
        Color.q = RGB(Red, Green, Blue)
        
    EndSelect
    
    ProcedureReturn Color
  EndProcedure
  
EndModule

; <<<<<<<<<<<<<<<<<<<<<<<
; <<<<< END OF FILE <<<<<
; <<<<<<<<<<<<<<<<<<<<<<<
; IDE Options = PureBasic 6.11 LTS (Linux - x64)
; Folding = -
; EnableXP
; CompileSourceDirectory
; EnableUnicode