import time
import subprocess
 
subprocess.call (["monstart"])

process = subprocess.Popen(["airodump-ng", "wlan0", "--write", "pnp", "--output-format", "csv"])
time.sleep(30)
process.terminate()

process = subprocess.Popen(["airdrop-ng", "-i", "wlan0", "-t", "pnp-01.csv", "-r", "rulefile.txt"])
time.sleep(11600)
process.terminate()

subprocess.call(["rm" ,  "*.csv"])

