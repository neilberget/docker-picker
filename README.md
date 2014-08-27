Docker Picker
===

A set of small bash functions to make it really easy to inspect, tail, or stop and destroy your running containers.

When you run any of these, vim will open with the result of running docker ps on your host.
Hit enter on any of the lines and the result of running docker inspect, docker tail -f or docker stop and destroy will be run.

![docker picker demo](https://raw.githubusercontent.com/neilberget/docker-picker/master/assets/docker-picker.gif)

dinspect
---

    dinspect

Runs `docker inspect <ID>` for the selected container.

dtail
---

    dtail

Runs `docker logs -f <ID>` to follow the logs of the selected container.

dlogs
---

    dlogs

Runs `docker logs <ID>` to print all the logs from a container.

dattach
---

    dattach

Runs `docker attach <ID>` on the selected container.

ddestroy
---

    ddestroy

Runs `docker stop <ID> && docker rm <ID>` on the selected container.

Installation
---
Add `source /PATH/TO/docker-picker.sh` in your `.bashrc` or `.bash_profile` and reload your shell.

These functions will modify your history and save the actual invoked command as if you typed it rather than the shortcut.

Shout out
---

I got the idea and technique to use vim to pick from a list and launch a command from the awesome warp shell script:
[https://github.com/jpalardy/warp](https://github.com/jpalardy/warp)
Warp lets you SSH somewhere by picking a hostname from a list.
