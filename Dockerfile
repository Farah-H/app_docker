# Creating micro-services for nodejs front end
FROM mongo as DB
EXPOSE 27017
COPY ./mongod.conf /etc/



FROM node:alpine as app
WORKDIR /usr/src/app
COPY ./app/ . 



# run the npm install and start app 
RUN npm install
EXPOSE 3000

CMD ["node", "app.js"]