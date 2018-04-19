# base image
FROM node:7.6

# install chrome for protractor tests

# set working directory
RUN mkdir hello-world
WORKDIR /hello-world

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /hello-world/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /hello-world/package.json
RUN npm install
RUN npm install -g @angular/cli

# add app
COPY . /hello-world
EXPOSE 80

# start app
CMD ng serve --host 0.0.0.0