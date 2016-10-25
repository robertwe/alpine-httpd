## Apache Docker's image based on Alpine Linux
####Installed components: 
  - with HTTPD v2.4.23 ([link](https://httpd.apache.org/docs/2.4/))
  - PHP v5.6.26 ([link](https://secure.php.net/))
  - Composer v1.2.1 ([link](https://getcomposer.org/doc/))
  
### How to use it?
If you would like to [pull](https://docs.docker.com/engine/reference/commandline/pull/) it
you should simple execute `docker pull nwms/httpd`.     
By default you should get the latest version of the httpd container.
To get it up and running we need to execute `docker run -d -p 8080:80 nwms/httpd`
After that you should see on port 8080 at `localhost` default message from Apache installed
inside the container. 
To get details about installed PHP version inside the container you can simple go to `http://127.0.0.1:8080/index.php`
if you started the `nwms/httpd` container as mentioned above.

If you want to check what's inside the container without running it in the background you can just execute:     
``
docker run -it --entrypoint bash nwms/httpd
``

After that you should get interactive console inside the running container. 

### Customization
If you need similar container to this one you can create your own container based on this one (`Dockerfile` and `FROM` statement).
To provide/load custom config files to this container please use docker volumes ([documentation](https://docs.docker.com/engine/tutorials/dockervolumes/))
 
 
### Useful links
 - [https://docs.docker.com/engine/reference/run/](https://docs.docker.com/engine/reference/run/) 
   Especially section "VOLUME (shared filesystems)"
  

  