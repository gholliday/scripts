$cd = Add-Type -memberDefinition @"
[DllImport("winmm.dll", CharSet = CharSet.Ansi)] public static extern int mciSendStringA(string lpstrCommand, string lpstrReturnString, int uReturnLength, IntPtr hwndCallback);
"@ -passthru -name mciSendString
$cd::mciSendStringA('set cdaudio door open', $null, 0, 0);
