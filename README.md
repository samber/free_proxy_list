
## Start

```
# Build
$ docker build -t samber/free_proxy_list .

# Run
$ docker run -d --restart=always -v `pwd`/.ssh:/root/.ssh --name free_proxy_list samber/free_proxy_list
```
