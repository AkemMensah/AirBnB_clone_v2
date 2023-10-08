#!/usr/bin/env bash
# Bash script that sets up web servers for the deployment of web_static

sudo apt-get update

# Install Nginx if it not already installed
sudo apt-get -y install nginx

# Create the folders /data /web_static /releases /test/ if it doesn’t already exist
sudo mkdir -p ~/data/web_static/releases/test/

# Create the folder /data/web_static/shared/ if it doesn’t already exist
sudo mkdir -p ~/data/web_static/shared/
touch ~/data/web_static/releases/test/index.html
# Create a fake HTML file /data/web_static/releases/test/index.html
sudo echo '<html>
  <head>
  </head>
  <body>
    Alx SE School
  </body>
</html>' > ~/data/web_static/releases/test/index.html

# Create a symbolic link /data/web_static/current linked to the\
# /data/web_static/releases/test/ folder. If the symbolic link already\
# exists, it should be deleted and recreated every time the script is ran. 
sudo ln -sf ~/data/web_static/releases/test/ ~/data/web_static/current

# Give ownership of the /data/ folder to the ubuntu user AND group (
# assume this user and group exist). This should be recursive; everything
# inside should be created/owned by this user/group.
sudo chown -hR ubuntu:ubuntu ~/data/

# Update the Nginx configuration to serve the content of
# /data/web_static/current/ to hbnb_static
# (ex: https://mydomainname.tech/hbnb_static).
#sudo sed -i '51 i \\n\tlocation /hbnb_static {\n\talias ~/data/web_static/current;\n\t}' /etc/nginx/sites-available/default
echo 'server {
    listen 80 default_server;
            listen [::]:80 default_server;
	                add_header X-Served-By 316263-web-01;
			                root   ~/data/web_static/current;
					                    index  index.html index.htm;

							                            location /redirect_me {
										                                    return 301 https//YouTube.com/;
														                                        }

																		                                error_page 404 /404.html;
																						                                    location /404 {
																										                                              root /var/www/html;
																															                                                      internal;
																																					                                                          }
																																											                                      }' > /etc/nginx/sites-available/default
# Restart Nginx after updating the configuration:
sudo service nginx restart
