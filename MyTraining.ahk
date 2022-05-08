#Warn , Off
SetTitleMatchMode("RegEx")

Run(
"msedge.exe https://www.youtube.com/results?search_query=crossfit+games --new-window"
)

; Sleep(1000)

If WinWaitActive("^crossfit.*$ ahk_exe msedge.exe",,2)
{
    WinMove(1713,0)
}
title:=WinGetTitle("^crossfit.*$ ahk_exe msedge.exe")

If(title){
    WinActivate(title)
    SendInput("{LWin down}{Right}")
    SendInput("{LWin up}")
    Sleep(1000)
    SendInput("{Esc}")
}


Run(
"msedge.exe https://www.timeme.com/split-lap-timer.htm --new-window"
)
; Sleep(1000)
; WinActivate("^Split Lap Timer.*$ ahk_exe msedge.exe")
if WinWaitActive("^Split Lap Timer.*$ ahk_exe msedge.exe",,2)
{
    ; SetWindowPos(775, 102)
    WinMove(775, 102, 948, 1206)
}


Run(
"`"C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE`" `"C:\Users\{{name}}\OneDrive\CASUAL\Gezondheid\Sport\Logs\Trainingslog2.xlsx`""
)

Sleep(1000)
if WinWaitActive("^Trainingslog.*$ ahk_exe EXCEL.EXE",,2)
{
    WinMove(6, 165, 753, 1052)
}
