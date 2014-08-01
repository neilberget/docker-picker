Docker Picker
===

A set of small bash scripts to make it really easy to inspect, tail, or stop and destroy your running containers.

If you run any of these scripts, vim will open with the result of running docker ps on your host.
Hit enter on any of the lines and the result of running docker inspect, docker tail -f or docker stop and destroy will be run

dinspect
---

    dinspect

Runs `docker inspect <ID>` for the selected container.

dtail
---

    dtail

Runs `docker tail -f <ID>` to follow the logs of the selected container

ddestroy
---

    ddestroy

Runs `docker stop <ID> && docker rm <ID>` on the selected container.


Shout out
---

I got the idea and technique to use vim to pick from a list and launch a command from the awesome warp shell script:
[https://github.com/jpalardy/warp](https://github.com/jpalardy/warp)
Warp lets you SSH somewhere by picking a hostname from a list.
