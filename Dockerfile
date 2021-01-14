# creating image from official mongo repo 
FROM mongo as db
# copy mongod.conf file into container
COPY ./mongod.conf /etc/

# from lghtweight node instance, create app image
FROM node:alpine as app

WORKDIR /usr/src/app
COPY ./app/ . 
RUN npm install
