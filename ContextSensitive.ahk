/*
**********************
****OneNote Shortcuts
**********************
*/

#HotIf WinActive("ahk_exe ONENOTE.EXE")

^Del::
{
    SendInput("^!g")
    Sleep(100)
    SendInput("{Enter}{Del}")
    SendInput("^!g")
}

#^c::
{
    If (A_Cursor == "IBeam"){
        Sleep(300)
        SendInput("{LAlt}")
        Sleep(300)
        SendInput("hff")
        SendInput("Roboto Mono{Enter}")
        SendInput("{Esc}")
    }
}

/*
**********************
****File Explorer Shortcuts
**********************
*/

#HotIf WinActive("ahk_exe Explorer.EXE")
^+c::{
    SendInput("{Shift down}{F10}")
    SendInput("{Shift up}")
    SendInput("a")
}

/*
**********************
****EXCEL Shortcuts
**********************
*/

#HotIf WinActive("ahk_exe EXCEL.EXE")
#\::
{
    A_Clipboard:=""
    Sleep(200)
    SendInput("{LAlt}fic")
    ClipWait  ; Wait for the clipboard to contain text.
    Result :=  Trim(A_Clipboard, "`"")
    SendInput("{Esc}")
    NewClipBoard:="ms-excel:" . Result
    A_Clipboard := NewClipBoard
}
#HotIf