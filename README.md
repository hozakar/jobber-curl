# jobber-curl
Docker image jobber with curl installed

docker-compose.yml example

```sh
version: "3.9"
services:
  jobber:
    restart: unless-stopped
    image: hozakar/jobber-curl
    container_name: jobber
    volumes:
      - ./jobs/.jobs:/home/jobberuser/.jobs
```

if specified, content of ".jobs" file will be replaced with ".jobber"

.jobs file content example

```sh
version: 1.4

prefs:
  logPath: /home/jobberuser/log/jobber.log
  runLog:
    type: file
    path: /home/jobberuser/log/runlog.log
    maxFileLen: 1m
    maxHistories: 2

jobs:
  runCurl:
    cmd: curl https://domain.tld/
    time: '0 * * * * *'
    onError: Continue
```
