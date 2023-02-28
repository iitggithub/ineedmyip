# ineedmyip
A simply way to bypass HTTP and/or HTTPS web proxies to obtain your actual public IP address. This test essentially just fakes a regular SSH connection and simply returns the IP address of the client that connects to it.

There's a number of ways to do this and a few options and examples are listed below. Essentially it will depend on what tools you have available on your system.

It should go without saying but don't include the dollar sign at the start of the command.

### nc

```
$ nc -v ineedmyip.com 22
Connection to ineedmyip.com (140.82.49.8) 22 port [tcp/ssh] succeeded!
1.2.3.4

$ 
```

### telnet

```
$ telnet ineedmyip.com 22
Trying 140.82.49.8...
Connected to ineedmyip.com.
Escape character is '^]'.
1.2.3.4
Connection closed by foreign host.
$
```

### netcat

```
$ netcat -v ineedmyip.com 22
Connection to ineedmyip.com (140.82.49.8) 22 port [tcp/ssh] succeeded!
1.2.3.4

$
```

### powershell

Download the client script from here [https://github.com/iitggithub/ineedmyip/blob/main/client.ps1]

Right click on the "Raw" button and choose "Save Link As" to download the script to your computer.

Open a powershell prompt and navigate to the directory where your script is saved and execute it like so:

```
PS C:\Users\iitggithub> .\client.ps1
```

### python

```
$ curl -so - https://raw.githubusercontent.com/iitggithub/ineedmyip/main/client.py | python
1.2.3.4
$
```
