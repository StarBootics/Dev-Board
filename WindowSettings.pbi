; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; AUTOMATICALLY GENERATED CODE, DO NOT MODIFY
; UNLESS YOU REALLY, REALLY, REALLY MEAN IT !!
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; Code generated by : Dev-Object - V2.2.5
; Project name : Dev-Board
; File name : WindowSettings.pbi
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

DeclareModule WindowSettings
  
  Interface WindowSettings
    
    GetIntegers.i(Key.s)
    SetIntegers(Key.s, Integers.i)
    ReadPrefs(GroupName.s)
    WritePrefs(GroupName.s)
    Free()
    
  EndInterface
  
  Declare.i New()
  
EndDeclareModule

Module WindowSettings
  
  DisableDebugger
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< Structure declaration <<<<<

  Structure Private_Members
    
    VirtualTable.i
    Map Integers.i(16)
    
  EndStructure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The observators <<<<<

  Procedure.i GetIntegers(*This.Private_Members, Key.s)
    
    If FindMapElement(*This\Integers(), Key)
      ProcedureReturn *This\Integers()
    EndIf
    
    ProcedureReturn 0
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The mutators <<<<<

  Procedure SetIntegers(*This.Private_Members, Key.s, Integers.i)
    
    *This\Integers(Key) = Integers
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< Read preferences group <<<<<

  Procedure ReadPrefs(*This.Private_Members, GroupName.s)
    
    PreferenceGroup(GroupName)
    
    Integers_Max.i = ReadPreferenceInteger("Integers_Max", 0) - 1
    
    For IntegersID.i = 0 To Integers_Max
      AddMapElement(*This\Integers(), ReadPreferenceString("Integers_Key_" + Str(IntegersID), ""))
      *This\Integers() = ReadPreferenceInteger("Integers_" + Str(IntegersID), *This\Integers())
    Next
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< Write preferences group <<<<<

  Procedure WritePrefs(*This.Private_Members, GroupName.s)
    
    PreferenceGroup(GroupName)
    
    WritePreferenceInteger("Integers_Max", MapSize(*This\Integers()))
    IntegersID.i = 0
    
    ForEach *This\Integers()
      WritePreferenceString("Integers_Key_" + Str(IntegersID), MapKey(*This\Integers()))
      WritePreferenceInteger("Integers_" + Str(IntegersID), *This\Integers())
      IntegersID + 1
    Next
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Destructor <<<<<

  Procedure Free(*This.Private_Members)
    
    FreeStructure(*This)
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Constructor <<<<<

  Procedure.i New()
    
    *This.Private_Members = AllocateStructure(Private_Members)
    *This\VirtualTable = ?START_METHODS
    
    ProcedureReturn *This
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Virtual Table Entries <<<<<

  DataSection
    START_METHODS:
    Data.i @GetIntegers()
    Data.i @SetIntegers()
    Data.i @ReadPrefs()
    Data.i @WritePrefs()
    Data.i @Free()
    END_METHODS:
  EndDataSection

  EnableDebugger
  
EndModule

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; <<<<< Code generated in : 00.001 seconds (164000.00 lines/second) <<<<<
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

; <<<<<<<<<<<<<<<<<<<<<<<
; <<<<< END OF FILE <<<<<
; <<<<<<<<<<<<<<<<<<<<<<<
; IDE Options = PureBasic 6.11 LTS (Linux - x64)
; Folding = --
; EnableXP
; CompileSourceDirectory