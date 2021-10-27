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

## 참고
```
서비스의 타입에 따라 다르게 동작한다. 이중에 simple과 oneshot을 사용하는 방법이 있다.
```
[링크](https://twpower.github.io/217-difference-between-simple-and-oneshot-in-systemd-service-type-option)

링크 안의 글을 추가한다.
```txt
systemd service type
simple
[Service]
Type=simple
메인 프로세스가 시작되면 바로 systemd unit이 정상적으로 실행되었다고 판단하고 active 상태로 바꾼다. 실행된 메인 프로세스가 끝날때까지 기다려주지 않고 연결된 다음 systemd unit을 실행한다. 만약 네트워크를 다 올리는 작업같이 기다렸다가 다음 systemd unit을 실행해야하는 상황이면 다른 옵션과 함께 사용하던가 아래 oneshot을 이용해야 한다.
ExecStart=를 하나만 가질 수 있다.
프로세스가 실행되면 active 상태가 되며 다 끝났을때 inactive가 됩니다.


oneshot
[Service]
Type=oneshot
메인 프로세스가 시작되면 상태를 activating으로 바꾸고 끝나때까지 기다리며 해당 메인 프로세스가 끝나야지만 다음 systemd unit으로 넘어간다.
ExecStart=를 여러개 가질 수 있다.
프로세스가 실행되면 activating 상태가 되며 프로세스가 다 끝나고 inactive 상태로 바뀐다. 만약, RemainAfterExit=true 옵션을 사용하면 프로세스가 다 끝났을때 inactive가 아닌 active 상태가 된다.(실행되고 있는 프로세스는 없을수도 있다!)

```