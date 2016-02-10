
Run:

$ docker build -t samber/free_proxy_list .
$ docker run -d -v ~/.ssh/id_rsa:/root/.ssh/id_rsa free_proxy_list