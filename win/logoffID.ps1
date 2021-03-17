<<<<<<< HEAD
﻿#Sets the server as local host
=======
#Sets the server as local host
>>>>>>> 1f7d1880e59b46ad347ab94d7b0ec97e5d5c911e
$server = hostname.exe

try {
   query user /server:$SERVER 2>&1 | select -skip 1 | foreach {
     logoff ($_ -split "\s+")[-6] /server:$SERVER
   }
}
catch {}
<<<<<<< HEAD


=======
>>>>>>> 1f7d1880e59b46ad347ab94d7b0ec97e5d5c911e
