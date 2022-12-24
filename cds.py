#!/uer/bin/python3

import sys, serial, time
import requests, json
from influxdb import InfluxDBClient as influxdb

device = serial.Serial('/dev/ttyACM0',9600,timeout=5)

while(1):
    rcvBuf = device.readline()
    rcvBuf = rcvBuf.decode()
    temp = rcvBuf.split(' ')[0]
    humi = rcvBuf.split(' ')[1]
    print(temp)
    print(humi)
    
    data = [{
            'measurement' : 'dht',
            'tags':{
                'hgcom' : '1111',
            },
            'fields':{
				'temp' :  float(temp),
                'humi' : float(humi) ,
            }
    }]
    client = None
    try:
        client = influxdb('localhost',8086,'root','root','tehu')
    except Exception as e:
        print ("Exception" + str(e))
    if client is not None:
        try:
            client.write_points(data)
        except Exception as e:
            print (" Exception write" + str(e))
        finally:
            print("database temp,humi is clear")
            client.close()
           
    time.sleep(1)
		
	
