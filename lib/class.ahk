MouseAction := 'left right'



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

class MyState
{

    __New(Jsobj, name)
    {
        this.name := name
		this.stateImagePath :=  Jsobj["StateImagePath"]
        ;this.type :=  Jsobj["Type"]
		this.action :=  Jsobj["Action"]

        try {
            this.actionImagePath := Jsobj["ActionImagePath"]
        } catch Error as err {
            
        }
        ;MsgBox "New StateMachine of " this.name ",ImagePath: " this.imagePath  ",Function:" this.function "."
    }

    actionFun(x, y) {
        for name in this.action {
            if InStr(MouseAction, name) {
                this.x := x
                this.y := y
                if this.actionImagePath {
                    if FindPose(&xa, &ya, this.actionImagePath) {
                        this.x := xa
                        this.y := ya
                    }
                }
                MouseMove this.x, this.y
                MouseClick name
            } else {
                Send name
            }
            Sleep Random(100, 1000)
        }

    }

}