# haproxy


docker run command ::

```
docker run -v /path/to/folder:/etc/haproxy -p 80:80 -p 443:443 -p 5432:5432 -it --name <<container-name>> --hostname <<hostname>> akhilrajmailbox/haproxy:latest /bin/bash

```


NOTE ::

If these directories are not empty then the server will not overwirte the configuration, it will choose the existing one.
but if the directory is empty, then the container will not start.

```
here we are mounting these directory to host,

        /etc/haproxy          =       for haproxy configuration (haproxy.cfg)

```


INFO ::


```
you can find the configuration templates under your mount point once the server start.


check the folder under the mount point (/path/to/mountpoint/real-conf)

the 'real-conf' folder consist of the following template,

	*  haproxy.cfg-backend			=	http configuration with request header
	*  haproxy.cfg-letsencrypt		=	haproxy with 'letsencrypt' ssl certificate with request header
	*  haproxy.cfg-redirect			=	haproxy configuration with redirection
	*  haproxy.cfg-ssl			=	https configuration in frontend reflect on all backend with request header
	*  haproxy.cfg-ssl-individual		=	https configuration in specified backend with request header 

```


NOTE :::

 *	5432 port is used for web_ui (need credentials)
This port is configured in the file 'haproxy.cfg' under the mount location


web_ui ::

```
admin		=		
password	=		

```

