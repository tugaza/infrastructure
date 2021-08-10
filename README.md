# Infrastructure
Infrastructure definitions

Please set up tugaza like this:
* `git clone` tugaza/gui, tugaza/player and tugaza/infrastructure so they all reside in one directory, like this:

```
~/somedir/tugaza
     │
     │
     ├── gui
     │
     │
     ├── infrastructure
     │
     │
     └── player
``` 

MUST HAVE/RUN:

* `sudo modprobe snd-aloop`
* `arecord -l | grep "Loopback PCM"` to find out what PLAY_DEVICE / RECORD_DEVICE should be set to (`hw:$card,$device,$subdevice`)
* run `mkdir /tmp/volatile && chmod 777 /tmp/volatile` prior to docker-compose up.