; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

#MaxHotkeysPerInterval 1000
#UseHook
SetCapsLockState , AlwaysOff
SetTitleMatchMode, 2

;~CapsLock:: 
; Control (ƒ¬ќ…Ќќ≈ нажатие) - конвертировать введенные символы в punto switcher
;if (A_PriorHotkey <> "~CapsLock" or A_TimeSincePriorHotkey > 300)
; если предыдуща€ клавиша - не Control,
; или со времени нажати€ Control прошло больше 300 миллисекунд, то...
;{
;    KeyWait, CapsLock
    ;ожидать, пока клавиша не будет отпущена
    ;(чтобы исключить срабатывание от простого удержани€ нажатой клавиши)
;    Return ; закончить обработку гор€чей клавиши после отжати€ клавиши
;}
; а вот если предыдуща€ клавиша - Control,
; и со времени нажати€ Control прошло Ќ≈ больше 300 миллисекунд, то...
;KeyWait, CapsLock
; ожидать пока клавиша не будет отпущена
; (чтобы исключить срабатывание от клавиши CTRL + исправл€емые punto switcher'ом буквы)
;Send, {Break} ; переключить раскладку
;Return ; закончить обработку гор€чей клавиши


; double space to period+space
; ~$space::
 ; {
   ; keywait, space
   ; keywait, space, d t.14
   ; if (!errorlevel) && (a_thishotkey = "~$" . a_priorkey)
    ; {
      ; sendinput, {backspace 2}.%a_space%
    ; }
 ; }
; return

*#VK53::Send, +#{VK53}


; RStudio
; ahk_class QWidget
#IfWinActive RStudio ahk_class QWidget 
	!=::Send, {Space}`%>`%{Space} 
	^F1::
		send, ^{VK43}
		send, ^2
		send, str(
		send, ^{VK56}
		send, ){enter}
		sleep, 100
		send, ^1
		
	return
    ^F2::
		send, ^{VK43}
		send, ^2
		send, readRDS(
		send, ^{VK56}
		send, ){enter}
		sleep, 100
		send, ^1
		
	return
	+F1::
		send, ^{VK43}
		send, ^2
		send, summary(
		send, ^{VK56}
		send, ){enter}
		sleep, 100
		send, ^1
		
	return
#IfWinActive
; MouseGetPos, , , , control
; if control in Chrome_AutocompleteEditView1
; {
; Send, !{Enter}
; }
; else
; {
; Send, {Enter}
; }
; return

WheelDown:: 
    Click WheelDown
return
    
WheelUp:: 
    Click WheelUp
return
    
; RStudio 0.99+
; ahk_class QWidget
#IfWinActive RStudio ahk_class Qt5QWindowIcon 
	!=::Send, {Space}`%>`%{Space} 
	^F1::
		; send, ^{Left}
		; send, +^{Right}
		send, ^{VK43}
		; send, ^{Left}
		send, ^2
		send, str(
		send, ^{VK56}
		send, ){enter}
		sleep, 100
		send, ^1
		
	return   
    ^F2::
		send, ^{VK43}
		send, ^2
		send, readRDS(
		send, ^{VK56}
		send, ){enter}
		sleep, 100
		send, ^1
    return
     
	+F1::
		; send, ^{Left}
		; send, +^{Right}
		send, ^{VK43}
		; send, ^{Left}
		send, ^2
		send, summary(
		send, ^{VK56}
		send, ){enter}
		sleep, 100
		send, ^1
		
	return
    WheelDown:: 
       Click WheelDown
       ; Click WheelDown
    return
    
    WheelUp:: 
       Click WheelUp
       ; Click WheelUp
    return
#IfWinActive

CapsLock & Sc014::
WinSet, AlwaysOnTop, Toggle, A
return


CapsLock::send, {LShift Down}{LCtrl Down}{LShift Up}{LCtrl Up}
LShift & LAlt::send, {LShift Down}{LCtrl Down}{LShift Up}{LCtrl Up}