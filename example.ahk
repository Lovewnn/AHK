


FindPose(&x,&y,"D:\work\learn\ahk\image\test.png")
MsgBox "icon(" x "," y ")"
MouseMove 0,0

MouseMove x,y
MouseClick "left"
