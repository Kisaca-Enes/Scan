#!/bin/bash

echo "=============================="
echo "[*] System Information"
echo "=============================="
uname -a
cat /etc/os-release 2>/dev/null
echo ""

echo "=============================="
echo "[*] Current User Info"
echo "=============================="
whoami
id
echo ""

echo "=============================="
echo "[*] Users & Groups"
echo "=============================="
cat /etc/passwd | cut -d: -f1
echo ""
echo "[*] Groups:"
cat /etc/group | cut -d: -f1
echo ""

echo "=============================="
echo "[*] Sudo Permissions"
echo "=============================="
sudo -l 2>/dev/null || echo "[-] Cannot run sudo -l"
echo ""

echo "=============================="
echo "[*] SUID Files"
echo "=============================="
find / -perm -4000 -type f 2>/dev/null
echo ""

echo "=============================="
echo "[*] Capabilities"
echo "=============================="
getcap -r / 2>/dev/null
echo ""

echo "=============================="
echo "[*] Cron Jobs"
echo "=============================="
echo "[+] /etc/crontab:"
cat /etc/crontab 2>/dev/null
echo ""
echo "[+] /etc/cron.*:"
ls -la /etc/cron.* 2>/dev/null
echo ""

echo "=============================="
echo "[*] Environment PATH"
echo "=============================="
echo $PATH
echo ""

echo "=============================="
echo "[*] Writable Directories by Current User"
echo "=============================="
find / -writable -type d 2>/dev/null | grep -v /proc
echo ""

echo "=============================="
echo "[*] Kernel Version"
echo "=============================="
uname -r
echo ""

echo "=============================="
echo "[*] Looking for World-Writable Files"
echo "=============================="
find / -type f -perm -o+w -exec ls -l {} \; 2>/dev/null | grep -v /proc
echo ""

echo "=============================="
echo "[*] Looking for .sh scripts in /home or /tmp"
echo "=============================="
find /home /tmp -name "*.sh" 2>/dev/null
echo ""

echo "[+] Scan complete."
