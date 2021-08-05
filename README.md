# Systemd 란?

systemd(System daemon)은 전통적으로 Unix 시스템이 부팅 후에 가장 먼저 생성된 init 역할을 대체하는 데몬입니다.
init 프로세스의 역할 중에 하나는 실행해야 하는 다른 프로세스를 구동시키는 책임을 지고 있다. 이를 대신하기 위한 용도로 systemd를 사용한다.

만약 도커 내부에서 실행하는 것이 필요한 경우에는 `supervisord`를 활용하는 것이 효과적이다.

## Getting Started


### Default Target

```bash
# 기본 확인
$ systemctl get-default
graphical.target
```

### Systemd Application
systemd의 위치는 해당 폴더 아래에 위치해야 한다. 

- 서비스 복사

```
$ cp ./test.service /lib/systemd/system/
```

- 서비스 실행
```
$ systemctl enable test.service
$ systemctl start test.service
```