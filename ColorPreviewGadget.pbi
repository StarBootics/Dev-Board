; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; Project name : Dev-Board
; File name : ColorPreviewGadget.pbi
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

DeclareModule ColorPreview
  
  Declare.l GetCurrentColor(GadgetID)
  Declare SetCurrentColor(GadgetID, Color.l)
  Declare Gadget(GadgetID, x, y, Width, Height, Color.l, SupportRGBA.i = 0)
  Declare Free(GadgetID)
  
EndDeclareModule

Module ColorPreview
  
  Structure Instance
    
    SupportRGBA.i
    CurrentColor.l
    BackgroundID.i
    ImageID.i
    
  EndStructure
  
  Procedure.l GetCurrentColor(GadgetID)
    
    If IsGadget(GadgetID)
      
      *Instance.Instance = GetGadgetData(GadgetID)
      
      If *Instance <> #Null
        CurrentColor.l = *Instance\CurrentColor ; & $FFFFFF
      EndIf
      
      ProcedureReturn CurrentColor
    EndIf  
    
  EndProcedure 
  
  Procedure SetCurrentColor(GadgetID, Color.l)
    
    If IsGadget(GadgetID)
      
      *Instance.Instance = GetGadgetData(GadgetID)
      
      If *Instance <> #Null
        
        *Instance\CurrentColor = Color ; & $FFFFFF
        Width = GadgetWidth(GadgetID)
        Height = GadgetHeight(GadgetID)
        
        If *Instance\SupportRGBA <> 0
          ColorImage.i = CreateImage(#PB_Any, Width, Height, 32)
        Else
          ColorImage.i = CreateImage(#PB_Any, Width, Height, 24)
        EndIf
        
        If StartDrawing(ImageOutput(ColorImage))
          
          DrawingMode(#PB_2DDrawing_AllChannels)
          Box(0, 0, Width, Height, *Instance\CurrentColor)
          StopDrawing()
          
        EndIf
        
        If StartDrawing(ImageOutput(*Instance\ImageID))
          
          If *Instance\SupportRGBA <> 0
            DrawImage(ImageID(*Instance\BackgroundID), 0, 0)
            DrawAlphaImage(ImageID(ColorImage), 0, 0)
          Else
            DrawImage(ImageID(ColorImage), 0, 0)
          EndIf
          
          StopDrawing()
          
          SetGadgetState(GadgetID, ImageID(*Instance\ImageID))
          FreeImage(ColorImage)
          
        EndIf 
        
      EndIf
      
    EndIf  
    
  EndProcedure 
  
  Procedure Gadget(GadgetID, x, y, Width, Height, Color.l, SupportRGBA.i = 0)
    
    GadgetHandle = ImageGadget(GadgetID, x, y, Width, Height, 0, #PB_Image_Border)
    
    If GadgetID = #PB_Any 
      GadgetID = GadgetHandle 
    EndIf 
    
    *Instance.Instance = AllocateStructure(Instance)
    
    *Instance\SupportRGBA = SupportRGBA
    
    If *Instance\SupportRGBA = 0
      *Instance\ImageID = CreateImage(#PB_Any, Width, Height)
    Else
      
      *Instance\BackgroundID = CreateImage(#PB_Any, Width, Height, 24)
      *Instance\ImageID = CreateImage(#PB_Any, Width, Height, 32)
      
      If StartDrawing(ImageOutput(*Instance\BackgroundID))
        
        Color1.l = RGB(000,000,000)
        Color2.l = RGB(128,128,128)
        
        For PosY = 0 To Height - 1 Step 8
          
          For PosX = 0 To Width - 1 Step 8
            
            Box(PosX, PosY, 8, 8, Color1)
            
            Swap Color1, Color2
            
          Next 
          
          Swap Color1, Color2
          
        Next
        
        StopDrawing()
        
      EndIf
      
    EndIf
    
    SetGadgetData(GadgetID, *Instance)
    SetCurrentColor(GadgetID, Color)
    
    ProcedureReturn GadgetID
  EndProcedure 
  
  Procedure Free(GadgetID)
    
    If IsGadget(GadgetID)
      
      *Instance.Instance = GetGadgetData(GadgetID)
      
      If *Instance <> #Null
        
        If IsImage(*Instance\BackgroundID)
          FreeImage(*Instance\BackgroundID)
        EndIf
        
        FreeImage(*Instance\ImageID)
        FreeStructure(*Instance)
        
      EndIf
      
    EndIf
    
  EndProcedure
  
EndModule

; <<<<<<<<<<<<<<<<<<<<<<<
; <<<<< END OF FILE <<<<<
; <<<<<<<<<<<<<<<<<<<<<<<
; IDE Options = PureBasic 6.11 LTS (Linux - x64)
; Folding = --
; EnableXP
; CompileSourceDirectory
; EnableUnicode