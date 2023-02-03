#include "lib/JSON.ahk"
#include "lib/class.ahk"

; Create some JSON
;str := "[`"abc`", 123, {`"true`": 1, `"false`": 0, `"null`": `"`"}, [true, false, null]]"

str := FileRead("D:/work/learn/ahk/.StateConfig")
Jobj := Jxon_load(&str)

MsgBox Jobj["StateDir"]
StateList := Jobj["StateList"] ; abc


StateArry := Array()

for name in StateList {
	;MsgBox state
	StateArry.Push(MyState(Jobj[name], name))
}

MsgBox WinExist("A")
;1. 判断当前所处的状态,执行功能函数

#s:: {
	Loop  {
		if WinExist("ahk_exe" "Code.exe") {
			MouseMove 0,0
			for state in StateArry {
				if FindPose(&x, &y, state.imagePath) {
					MsgBox "find" state.name
					state.actionFun(x,y)
				}
			}
			sleep 1000
		} else {
			MsgBox "please start the window"
			break
		}
	
	}
	return
}


FindPose(&FoundX, &FoundY, Path)
{
	try
		{
			if !FileExist(Path) {
				return false
			}
			if ImageSearch(&FoundX, &FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, Path)
				return true
			else
				return false
		}
		catch as exc
			MsgBox "Could not conduct the search due to the following error:`n" exc.Message

		return false
}
;
; If you set `JSON.BoolsAsInts := false` before calling JSON.Load
;MsgBox, % obj[4, 1] == JSON.True ; 1
;MsgBox, % obj[4, 2] == JSON.False ; 1

; If you set `JSON.NullsAsStrings := false` before calling JSON.Load
;MsgBox, % obj[4, 3] == JSON.Null ; 1