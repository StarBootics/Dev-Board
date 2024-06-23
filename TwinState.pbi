; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; Project name : Dev-Board
; File name : TwinState.pbi
; File Version : 1.0.0
; Programmation : OK
; Programmed by : Guillaume Saumure
; AKA : StarBootics
; E-mail : gsaumure@cgocable.ca
; Creation Date : 17-06-2024
; Last update : 17-06-2024
; Coded for PureBasic : V6.11 LTS
; Platform : Windows, Linux, MacOS X
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

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

DeclareModule TwinState

  Interface TwinState
    
    GetStatus.i()
    SetStatus.i(Status.i)
    Free()

  EndInterface

  Declare.i New(Button.i, Path.s, Image_0.s, Image_1.s, Status.i = 0)

EndDeclareModule

Module TwinState

  Structure Private_Members

    VirtualTable.i
    Status.i
    Button.i
    Image.i[2]
  
  EndStructure
  
  Procedure.i SetStatus(*This.Private_Members, Status.i)
    
    If Status <= 0
      *This\Status = 0
    ElseIf Status >= 1
      *This\Status = 1
    EndIf
    
    SetGadgetAttribute(*This\Button, #PB_Button_Image, ImageID(*This\Image[*This\Status]))
    
  EndProcedure
  
  Procedure.i GetStatus(*This.Private_Members)
  
    ProcedureReturn *This\Status
  EndProcedure
  
  Procedure Free(*This.Private_Members)
    
    For ImageID = 0 To 1
      
      If IsImage(*This\Image[ImageID])
        FreeImage(*This\Image[ImageID])
      EndIf
      
    Next
    
    FreeStructure(*This)

  EndProcedure

  Procedure.i New(Button.i, Path.s, Image_0.s, Image_1.s, Status.i = 0)

    *This.Private_Members = AllocateStructure(Private_Members)
    *This\VirtualTable = ?START_METHODS
    
    If Status <= 0
      *This\Status = 0
    ElseIf Status >= 1
      *This\Status = 1
    EndIf
    
    *This\Button = Button
    
    If FileSize(Path + Image_0) > 0
      *This\Image[0] = LoadImage(#PB_Any, Path + Image_0)
    EndIf
    
    If FileSize(Path + Image_1) > 0
      *This\Image[1] = LoadImage(#PB_Any, Path + Image_1)
    EndIf
    
    ProcedureReturn *This
  EndProcedure

  DataSection
    START_METHODS:
    Data.i @GetStatus()
    Data.i @SetStatus()
    Data.i @Free()
    END_METHODS:
  EndDataSection

EndModule


; <<<<<<<<<<<<<<<<<<<<<<<
; <<<<< END OF FILE <<<<<
; <<<<<<<<<<<<<<<<<<<<<<<
; IDE Options = PureBasic 6.11 LTS (Linux - x64)
; Folding = --
; EnableXP
; CompileSourceDirectory