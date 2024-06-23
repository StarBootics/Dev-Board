; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; Project name : Dev-Board
; File name : DevBoard - Main.pb
; File Version : 1.0.0
; Programmation : In progress
; Programmed by : Guillaume Saumure
; AKA : StarBootics
; E-mail : gsaumure@cgocable.ca
; Creation Date : June 17th, 2024
; Last update : June 22nd, 2024
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

IncludeFile "WindowSettings.pbi"
IncludeFile "TwinState.pbi"
IncludeFile "StringHashMap.pbi"
IncludeFile "FormatColor.pbi"
IncludeFile "ColorPreviewGadget.pbi"

IncludeFile "DevBoard - Card.pb"
IncludeFile "DevBoard - CardsList.pb"
IncludeFile "DevBoard - Project.pb"

IncludeFile "DevBoard - Setting.pb"
IncludeFile "DevBoard - BoardDrawingSystem.pbi"
IncludeFile "DevBoard - Language.pbi"

IncludeFile "DevBoard - DevBoard.pbi"

Global DevBoard.DevBoard::DevBoard = DevBoard::New()

DevBoard\CreateWindow()
DevBoard\EventManager()
DevBoard\Shutdown()
DevBoard\Free()

; <<<<<<<<<<<<<<<<<<<<<<<
; <<<<< END OF FILE <<<<<
; <<<<<<<<<<<<<<<<<<<<<<<
; IDE Options = PureBasic 6.11 LTS (Linux - x64)
; Optimizer
; EnableXP
; Executable = DevBoard
; DisableDebugger
; CompileSourceDirectory
; Compiler = PureBasic 6.11 LTS - C Backend (Linux - x64)