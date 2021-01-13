# Containerising Sparta's JSnode app 

## Acceptance Criteria
- When you go to localhost, you should see the app homepage
- Your Dockerfile should be available on GitHub
- Anyone should be able to pull and run your container (uploaded to Docker Hub)

## Steps 
1. Create a Dockerfile to contain dependencies and provisioning steps for the app, you can do this using your bash terminal (see below) or just in your IDE / Code-Editor (e.g VSC)

```bash
touch Dockerfile
nano Dockerfile
```

```docker
FROM node:latest
# build this image from the official image of node

LABEL MAINTAINER=farah.mh98@hotmail.com
# label is used as a refrence if you needed to know who built this image
```
Be careful with the pathing, and that it's relative to the location of the docker file

```docker
WORKDIR /usr/src/app

COPY ./app/ .
#copy all app files over
```

Expose port 3000, because this is what the app will run on. 
```docker
EXPOSE 3000
# app runs on port 3000, but we will do 80:3000 to avoid reverse proxy stuff 
```

And finally execute the commands needed to run the app

```docker
RUN npm install

CMD ["node", "app.js"]
# CMD will run this command once all other instructions have been successfully completed
```

2. Create a docker image from your dockerfile by running the following command in your terminal
```bash
docker build -t image_name .
```

3. run a container from this build
```bash 
docker run -d -p 80:3000 image_name 
```

4. you can go to your browser (make sure cookies are cleared) and type `localhost` into your url tab, you should be able to see this:
![](https://cdn.discordapp.com/attachments/770295530336288770/798872939046895646/unknown.png)