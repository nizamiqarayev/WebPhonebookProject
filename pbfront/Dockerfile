FROM node:15.13-alpine as build
WORKDIR /pbfront
COPY . .
ENV /pbfront/.bin .
VOLUME /tmp
EXPOSE 3000
RUN npm install
RUN npm run build
ENTRYPOINT [ "npm","start" ]