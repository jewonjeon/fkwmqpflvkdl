# inhatc
# InfluxDB Installation

### 라즈베리파이 eth0 down && up
```
  sudo ip link set down && sudo ip link set up
```

## 0. 라즈베이파이 업데이트
```
  sudo apt update
  sudo apt upgrade
```
## 1. Repository의 GPG key를 더하기

```
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -

```

## 2. Repository를 더하기

```
echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
```

## 3. 프로그램 설치
```
sudo apt update
sudo apt install influxdb
```
## 3.1 프로그램 실행 전 설정
```
sudo systemctl unmask influxdb
sudo systemctl enable influxdb
sudo systemctl start influxdb
```

## 4. 데이터베이스 만들기
```
$ influx

>create database <데이터베이스이름>
```
```
확인 : show databases 
```
# Grafana Installation

## 1. Repository의 GPG key를 더하기
```
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
```

## 2. Repository를 더하기
```
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
```

## 3. 프로그램 설치
```
sudo apt update
sudo apt install grafana
```

## 4. 프로그램 실행
```
sudo service grafana-server start
```
## influxdb import with python
```
sudo pip3 install influxdb
```
## gpio pin map
```
cd /tmp
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb
```

## 온습도 사용
```
sudo pip3 install Adafruit_DHT
```
```
import Adafruit_DHT
```
참고 사이트 - https://blog.naver.com/PostView.nhn?blogId=emperonics&logNo=222092518468
## 아두이노 소스코드
img width = "300" hight="300" src="./png/dht.png"></img>
## 라즈베리파이 소스코드
->파일 확인

## 기타 설정
  - 한글깨짐
```
$ sudo apt-get install fonts-unfonts-core
$ sudo apt-get install ibus ibus-hangul
$ sudo reboot
```
## 데이터 베이스에 저장
-> 

##아두이노 조도센서 -> 라즈베리파이 grafana 표시
  -조도센서( cda 조도센서)
```c
void setup() {

  Serial.begin(9600);

}

void loop() {
 int readValue = analogRead(A0);
 Serial.println(readValue);
 delay(1000);

}
```
 -조도센서 동작원리
 <img width = "300" hight="300" src="./png/cds.png"></img>
