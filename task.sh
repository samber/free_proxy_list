#!/bin/bash

curl http://txt.proxyspy.net/proxy.txt | grep -v list | grep -v address | grep -v -e '^$' > list.txt

rm /root/.ssh/known_hosts
touch /root/.ssh/known_hosts
ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

git add list.txt
git commit -m `date --rfc-3339=seconds`
git push

