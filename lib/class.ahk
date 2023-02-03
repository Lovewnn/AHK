MouseAction := 'left right'
class MyState
{

    __New(Jsobj, name)
    {
        this.name := name
		this.imagePath :=  Jsobj["ImagePath"]
        ;this.type :=  Jsobj["Type"]
		this.action :=  Jsobj["Action"]
        ;MsgBox "New StateMachine of " this.name ",ImagePath: " this.imagePath  ",Function:" this.function "."
    }

    actionFun(x, y) {
        for name in this.action {
            if InStr(MouseAction, name) {
                MouseMove x,y
                MouseClick name
            }
        }

    }

}