﻿; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; AUTOMATICALLY GENERATED CODE, DO NOT MODIFY
; UNLESS YOU REALLY, REALLY, REALLY MEAN IT !!
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; Code generated by : Dev-Object - V2.2.5
; Project name : Dev-Board
; File name : DevBoard - CardsList.pb
; File Version : 1.0.0
; Programmation : OK
; Programmed by : Guillaume Saumure
; AKA : StarBootics
; E-mail : gsaumure@cgocable.ca
; Creation Date : June 19th, 2024
; Last update : June 19th, 2024
; Coded for PureBasic : V6.11 LTS
; Platform : Windows, Linux, MacOS X
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

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

DeclareModule CardsList
  
  Interface CardsList
    
    GetName.s()
    GetCards.i()
    SetName(Name.s)
    SetCards(*Cards.Card::Card)
    AddCardsEx(*Cards.Card::Card)
    SelectCards.i(Index.i)
    LastCards.i()
    NextCards.i()
    DeleteCards()
    ResetCards()
    ClearCards()
    CardsIndex.i()
    CardsSize.i()
    XML_SetNode(CurrentNode.i)
    XML_GetNode.i(CurrentNode.i)
    SearchCardByUUID(UUID.s)
    Free()
    
  EndInterface
  
  Declare.i New(Name.s = "")
  
EndDeclareModule

Module CardsList
  
  DisableDebugger
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< Structure declaration <<<<<

  Structure Private_Members
    
    VirtualTable.i
    Name.s
    List Cards.Card::Card()
    
  EndStructure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Getters <<<<<

  Procedure.s GetName(*This.Private_Members)
    
    ProcedureReturn *This\Name
  EndProcedure
  
  Procedure.i GetCards(*This.Private_Members)
    
    ProcedureReturn *This\Cards()
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Setters <<<<<

  Procedure SetName(*This.Private_Members, Name.s)
    
    *This\Name = Name
    
  EndProcedure
  
  Procedure SetCards(*This.Private_Members, *Cards.Card::Card)
    
    If *This\Cards() <> #Null
      *This\Cards()\Free()
    EndIf
    
    *This\Cards() = *Cards
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The AddEx to linked list operator(s) <<<<<

  Procedure AddCardsEx(*This.Private_Members, *Cards.Card::Card)
    
    AddElement(*This\Cards())
    *This\Cards() = *Cards
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Select in linked list operator(s) <<<<<

  Procedure.i SelectCards(*This.Private_Members, Index.i)
    
    ProcedureReturn SelectElement(*This\Cards(), Index)
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Last element from linked list operator(s) <<<<<

  Procedure.i LastCards(*This.Private_Members)
    
    ProcedureReturn LastElement(*This\Cards())
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Delete element from linked list operator(s) <<<<<

  Procedure.i NextCards(*This.Private_Members)
    
    ProcedureReturn NextElement(*This\Cards())
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< L'operateur(s) Supprimer l'élément courant de la liste chaînée <<<<<

  Procedure DeleteCards(*This.Private_Members)
    
    If *This\Cards() <> #Null
      *This\Cards()\Free()
    EndIf
    
    DeleteElement(*This\Cards())
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Reset linked list operator(s) <<<<<

  Procedure ResetCards(*This.Private_Members)
    
    ResetList(*This\Cards())
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Clear linked list operator(s) <<<<<

  Procedure ClearCards(*This.Private_Members)
    
    ForEach *This\Cards()
      If *This\Cards() <> #Null
        *This\Cards()\Free()
      EndIf
    Next
    
    ClearList(*This\Cards())
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Index in the linked list operator(s) <<<<<
  
  Procedure.i CardsIndex(*This.Private_Members)
    
    ProcedureReturn ListIndex(*This\Cards())
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Size of the linked list operator(s) <<<<<

  Procedure.i CardsSize(*This.Private_Members)
    
    ProcedureReturn ListSize(*This\Cards())
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< XML Set Node with child nodes <<<<<

  Procedure XML_SetNode(*This.Private_Members, CurrentNode.i)
    
    If ParentXMLNode(CurrentNode) = #Null
      ObjectNode = CreateXMLNode(CurrentNode, "CardsList")
    Else
      ObjectNode = CurrentNode
    EndIf
    
    FieldNode = CreateXMLNode(ObjectNode, "Name")
    SetXMLNodeText(FieldNode, *This\Name)
    
    FieldNode = CreateXMLNode(ObjectNode, "Cards")
    SetXMLAttribute(FieldNode, "ElementCount", Str(ListSize(*This\Cards())))
    
    ForEach *This\Cards()
      ElementNode = CreateXMLNode(FieldNode, "Element")
      SetXMLAttribute(ElementNode, "ID", Str(ListIndex(*This\Cards())))
      *This\Cards()\XML_AddAttribute(ElementNode)
    Next
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< XML Get Node with child nodes <<<<<

  Procedure.i XML_GetNode(*This.Private_Members, CurrentNode.i)
    
    If ParentXMLNode(CurrentNode) = #Null
      ObjectNode = ChildXMLNode(CurrentNode)
      If GetXMLNodeName(ObjectNode) = "CardsList"
        Success.i = #True
      EndIf
    Else
      Success = #True
      ObjectNode = CurrentNode
    EndIf
    
    If Success = #True
      
      FieldNode = ChildXMLNode(ObjectNode)
      
      While FieldNode
        
        Select GetXMLNodeName(FieldNode)
    
          Case "Name"
            *This\Name = GetXMLNodeText(FieldNode)
    
          Case "Cards"
            Cards_Max.i = Val(GetXMLAttribute(FieldNode, "ElementCount")) - 1
            
            For CardsID.i = 0 To Cards_Max
              
              ElementNode = ChildXMLNode(FieldNode, CardsID + 1)
              
              If GetXMLNodeName(ElementNode) = "Element"
                AddElement(*This\Cards())
                *This\Cards() = Card::New()
                *This\Cards()\XML_CollectAttribute(ElementNode)
              EndIf
              
            Next
    
        EndSelect
        
        FieldNode = NextXMLNode(FieldNode)
        
      Wend
      
    EndIf
    
    ProcedureReturn Success
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The SearchCardByUUID <<<<<
  
  Procedure SearchCardByUUID(*This.Private_Members, UUID.s)
    
    ForEach *This\Cards()
      
      If *This\Cards()\GetUUID() = UUID
        Break
      EndIf
      
    Next
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Destructor <<<<<

  Procedure Free(*This.Private_Members)
    
    ForEach *This\Cards()
      If *This\Cards() <> #Null
        *This\Cards()\Free()
      EndIf
    Next
    
    FreeStructure(*This)
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Constructor <<<<<

  Procedure.i New(Name.s = "")
    
    *This.Private_Members = AllocateStructure(Private_Members)
    *This\VirtualTable = ?START_METHODS
    
    *This\Name = Name
    
    ProcedureReturn *This
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Virtual Table Entries <<<<<

  DataSection
    START_METHODS:
    Data.i @GetName()
    Data.i @GetCards()
    Data.i @SetName()
    Data.i @SetCards()
    Data.i @AddCardsEx()
    Data.i @SelectCards()
    Data.i @LastCards()
    Data.i @NextCards()
    Data.i @DeleteCards()
    Data.i @ResetCards()
    Data.i @ClearCards()
    Data.i @CardsIndex()
    Data.i @CardsSize()
    Data.i @XML_SetNode()
    Data.i @XML_GetNode()
    Data.i @SearchCardByUUID()
    Data.i @Free()
    END_METHODS:
  EndDataSection
  
  EnableDebugger
  
EndModule

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; <<<<< Code generated in : 00.001 seconds (307000.00 lines/second) <<<<<
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

; <<<<<<<<<<<<<<<<<<<<<<<
; <<<<< END OF FILE <<<<<
; <<<<<<<<<<<<<<<<<<<<<<<
; IDE Options = PureBasic 6.11 LTS (Linux - x64)
; Folding = ----
; EnableXP
; CompileSourceDirectory