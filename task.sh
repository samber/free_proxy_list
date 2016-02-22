#!/bin/bash


function clean_up {
    rm -f /tmp/list,txt /tmp/list_speed.txt
}

function download_list {
    2> /dev/null curl http://txt.proxyspy.net/proxy.txt | grep -v list | grep -v address | grep -v -e '^$' > /tmp/list.txt
}

function test_speed {
    while read proxy; do
	./speed_test.py $proxy >> /tmp/list_speed.txt
    done < /tmp/list.txt
}

function wait_jobs_over {
    for job in `jobs -p`; do
	wait $job
    done
}

function push {
    rm -f /root/.ssh/known_hosts
    touch /root/.ssh/known_hosts
    ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

    git add list.txt list.fastest-*.txt
    git commit -m `date --rfc-3339=seconds`
    git push -f
}



clean_up
download_list
test_speed
wait_jobs_over
cat /tmp/list_speed.txt | sort -n | awk '{print $2}' > list.txt
cat list.txt | head -n 10  > list.fastest-10.txt
cat list.txt | head -n 50  > list.fastest-50.txt
cat list.txt | head -n 100 > list.fastest-100.txt
cat list.txt | head -n 200 > list.fastest-200.txt
push
clean_up
