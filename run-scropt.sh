# list images
docker images

# pull images from registry ie. Docker Hub or private registry
docker pull nginx:latest

# Run
docker run --rm -d -p 8080:80 nginx:latest
# use browser and connect http://127.0.0.1:8080 

# create new image use 'docker tag'
docker tag nginx:latest myweb:1.0
docker run --rm -d -p 8081:80 myweb:1.0
docker ps

# mount external volume to container
docker run --rm -d -p 8082:80 -v html:/usr/share/nginx/html nginx:latest

# go inside running container
docker exec -it <container-id> /bin/bash
# try modify content of HTML
cat <<EOF > index.html
<!doctype html>
<html>
    <head>
        <title>My new web</title>
</head>

<body>
    <h2>Welcome to my new web site.</h2>
</body>
</html>
EOF
# check what happen from your browser

# try modify HTML code inside container
# create new HTML file via any editor (Sublime, VS Code or just notepad)
# 
# copy new HTML to inside container
docker cp html/index.html <container-name>:/usr/share/nginx/html

# use 'docker commit' to create new images
docker commit <container-name> myweb:2.0

# see detailed informattion of running containers - compare between running of web:1.0 and web2.0
docker inspect <container-id> | grep -i ipaddress
docker inspect <container-id> | grep -i ipaddress

# see logs
docker logs <container-id>

# stop running container
docker stop <container-id>

# create new container from Dockerfile
# use any editor to create file called 'Dockerfile'
docker build -t myweb:3.0 .
docker images
docker run --rm -d -p 8080:80 myweb:3.0

# cleanup
docker stop <container-id>
docker rmi <container-id>
