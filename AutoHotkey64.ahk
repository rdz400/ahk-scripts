^F5::Reload

!Volume_Up::
{
    SendInput("!{F4}")
}

!^x::
{
    If (UniqueID := WinExist("Productivity ahk_exe msedge.exe")) {
        WinActivate("ahk_id " . UniqueID)
    } else {
        SetKeyDelay , -1,-1
        Run("msedge.exe --new-window")
        WinActivate("New tab ahk_exe msedge.exe")
        WinWaitActive("New tab ahk_exe msedge.exe")
        SendInput("!f")
        SendInput("l")
        SendInput("w")
        Sleep(1000)
        SendInput("Productivity{Enter}")
        Sleep(300)
        SendInput("^+o")
        Sleep(1200)
        SendInput("Daily Start")
        Sleep(800)
        SendInput("^{Enter}")
        SendInput("^w")
    }
}

^#j::
{
    snippets:=EnvGet("snippets")
    Run("cmd /K jupyter lab `"" . snippets . "`"")
}


^#e::
{
    ClippedText:=A_Clipboard
    If(RegExMatch(ClippedText, "^[\s\d]*$")){
        NewText:=RegExReplace(ClippedText, "(\s+)", " ")
        NewText:=Trim(NewText)
        NewText:=RegExReplace(NewText, " ", ",")
        SumInts:=0
        Loop Parse, NewText, ",", A_Space A_Tab{
            If(IsNumber(A_LoopField)){
                SumInts:= SumInts + A_LoopField
            }
        }
        MsgBox(SumInts)
    }
}

^#f::
{
    Result:=Trim(A_Clipboard, OmitChars := "`"")

    If(RegExMatch(Result, "^C:\\Users\\{{name}}\\OneDrive\\.+xlsx$")){
        NewStr := RegExReplace(Result
            ,"C:\\Users\\{{name}}\\OneDrive\\"
            ,"https://d.docs.live.net/{{live_id}}/"
            ,
            ,1)

        NewStr := RegExReplace(NewStr
            ,"\\"
            ,"/")
        NewClipBoard:="ms-excel:" . NewStr
        MsgBox "ms-excel:" . NewStr
        A_Clipboard := NewClipBoard
    } Else{
        MsgBox "Nope no match for " . Result
    }
}


#Include "ContextSensitive.ahk"
#Include "Hotstrings.ahk"