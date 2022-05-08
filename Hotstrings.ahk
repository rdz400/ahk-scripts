#Hotstring EndChars |
::->::
{
    SendInput("--->")
}

::dt::
{
    SendInput(A_YYYY . A_MM . A_DD)
}

::rere:: ;This is a comment
{
    userprofile := EnvGet("userprofile")
    SendInput(userprofile)
}