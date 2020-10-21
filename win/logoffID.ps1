#Sets the server as local host
$server = hostname.exe

try {
   query user /server:$SERVER 2>&1 | select -skip 1 | foreach {
     logoff ($_ -split "\s+")[-6] /server:$SERVER
   }
}
catch {}
