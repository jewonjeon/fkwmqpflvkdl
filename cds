 # 아두이노-라즈베리 파이를 이용한 조도센서 데이터 베이스 활용
 - 소스코드
  ```py
  import sys, serial, time
import requests, json
from influxdb import InfluxDBClient as influxdb

device = serial.Serial('/dev/ttyACM0',9600,timeout=5)

while(1):
    rcvBuf = device.readline()
    rcvBuf = int(rcvBuf.decode())
    data = [{
            'measurement' : 'lux',
            'tags':{
                'hgcom' : '1111',
            },
            'fields':{
                'luxValue' :  rcvBuf,
            }
    }]
    client = None
    try:
        client = influxdb('localhost',8086,'root','root','lux')
    except Exception as e:
        print ("Exception" + str(e))
    if client is not None:
        try:
            client.write_points(data)
        except Exception as e:
            print (" Exception write" + str(e))
        finally:
            print("database lux is clear")
            client.close()
    time.sleep(1)
   ```
   ## 임의의 데이터 베이스 'lux' 만들기
   ```
   influx
   create database lux
   show databases
   exit
   ```
   ->조도센서 연결
   ->데이터 삽입
   -> grafana 확인
   
   
   
   
   
  
