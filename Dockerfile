FROM node
# build this image from the official image of node

LABEL MAINTAINER=farah.mh98@hotmail.com
# label is used as a refrence if you needed to know who built this image

COPY app/ usr/src/
#copy all app files over

EXPOSE 3000
# app runs on port 3000, but we will do 80:3000 to avoid reverse proxy stuff 

WORKDIR /usr/src/app

RUN npm install

CMD ["pm2", "start", "app.js;"]
# CMD will run this command once all other instructions have been successfully completed
