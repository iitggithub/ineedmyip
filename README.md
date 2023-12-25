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

## Make your own server

You need to install docker and how you do that will depend on your Operating System (OS) but it's usually one of these groups of commands:

### Redhat/CentOS/Fedora etc

```
$ sudo yum -y install docker
$ sudo systemctl enable docker
$ sudo systemctl start docker
```

### Ubuntu/Debian etc

```
$ sudo apt-get update && sudo apt-get install -y docker
$ sudo systemctl enable docker
$ sudo systemctl start docker
```

### Pull the docker image

```
$ sudo docker pull ineedmyip-server:latest
```

### Setup the systemd service

```
$ sudo curl -s -o /etc/systemd/system/ineedmyip.service https://raw.githubusercontent.com/iitggithub/ineedmyip/main/ineedmyip.service
$ sudo systemctl daemon-reload
$ sudo systemctl enable ineedmyip
```

### Start the ineedmyip service

```
$ sudo systemctl start ineedmyip
```

### Test the service is working

```
$ nc localhost 22222
127.0.0.1

$
```

### Setup iptables/ufw etc

Haven't placed rules here because it's different depending on what you're using. Refer to OS documentation for information on how to add this.

The basic idea behind this is to make sure connections on ports 22 and 80 are instead sent to the docker container that's running on TCP port 22222.

#### Forward TCP port 80 and 22 to 22222 via NAT PREROUTING

#### Allow connections on TCP port 80, 22, and 22222
