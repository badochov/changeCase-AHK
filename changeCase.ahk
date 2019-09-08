; ctrl + capslock changes text case
; if there is at  least one upper  case letter lowercase the text otherwise upper case it
^CapsLock::
    old := Clipboard

    Send, ^x

    string := CLIPBOARD

    u := False

    Loop,parse,string 
    {
        if (asc(a_loopfield) > 64 and asc(a_loopfield) < 91){
            u := True
            Break
        }
        else if (asc(a_loopfield) > 96 and asc(a_loopfield) < 123)
            Continue
    }

    If (u)
        StringLower, string, string
    Else
        StringUpper, string, string

    Clipboard := string

    Send, ^v

    Clipboard := old

    return