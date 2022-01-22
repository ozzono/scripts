# SSH INTO WSL
## Pages that helped me out

- [How to configure ssh server to start on boot within wsl](https://www.illuminiastudios.com/dev-diaries/ssh-on-windows-subsystem-for-linux/)
- [Enable windows port forwarding](https://www.hanselman.com/blog/how-to-ssh-into-wsl2-on-windows-10-from-an-external-machine)

> Soon steps to configure WSL as Squid proxy server

## Configure port forwarding automatically

```powershell
> $ipaddr=bash.exe -c "ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
> netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=2222 connectaddress=$ipaddr connectport=2222
```
schtasks /create /tn "FileMonitor" /sc onstart /delay 0000:30 /rl highest /ru system /tr "powershell.exe -file C:\Doc\Files\FileMonitor.ps1"