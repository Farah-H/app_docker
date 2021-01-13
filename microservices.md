# Creating Micro-services for node-js

## Dockerfile
```docker
FROM node:latest as APP
# build this image from the official image of node

LABEL MAINTAINER=farah.mh98@hotmail.com
# label is used as a refrence if you needed to know who built this image

EXPOSE 3000
# app runs on port 3000, but we will do 80:3000 to avoid reverse proxy stuff 

WORKDIR /usr/src/app

COPY ./app/ .
#copy all app files over
RUN npm install

FROM node:alphine

COPY --from=app /usr/src/app /usr/src/app
# magic line of code


CMD ["node", "app.js"]
# CMD will run this command once all other instructions have been successfully completed
```
