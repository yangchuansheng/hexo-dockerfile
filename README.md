# What is Hexo?

Hexo is a fast, simple & powerful blog framework, powered by Node.js. It allows for Blazing fast generation of pages, github flavored markdown, one command deployment, and a powerful plugin system

# How to use this image

## Start Hexo

This image will initialize a base hexo system by default using nginx and Hexo to generate the initial page. In addition, this image will generate your Hexo static files on start.

To start Hexo:

	sudo docker run --name hexo -it -p 80:80 -v <hexo source dir>:/usr/share/nginx/html/source simplyintricate/hexo

You should now be able to see the default Hexo page on your server.

## Customizing Hexo

Hexo can be further customized by either adding or mounting a local instance of `_config.yml` to `/usr/share/nginx/html/_config.yml` in the container. Adding is recommended by extending this image so you are able to preserve the immutability of the container for your Hexo needs. Here is an example Dockerfile

	FROM simplyintricate/hexo
	ADD _config.yml /usr/share/nginx/html/_config.yml

If you choose to mount the config instead, you may do so as such

	sudo docker run --name hexo -it -p 80:80 -v <hexo source dir>:/usr/share/nginx/html/source -v <config path>:/usr/share/nginx/html/_config.yml simplyintricate/hexo

# Interacting with Hexo

To interact with Hexo, such as for the purposes of publishing a new article, you may execute the `docker exec` command to communicate with the `hexo` command inside the container.

For example, to add re-generate your source files:

	sudo docker exec -it hexo hexo generate

To create a new post:

	sudo docker exec -it hexo hexo new "New Post"

The create command will create a new post in `/usr/share/nginx/html/source` which you can then modify on your host's source directory you have chosen.
