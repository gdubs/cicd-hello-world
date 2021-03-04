FROM node:10.23-alpine

RUN apk update
RUN apk add python busybox-extras alpine-sdk bash 

COPY package*.json ./

RUN yarn install

COPY . .

EXPOSE 3000

CMD ["yarn", "start"]