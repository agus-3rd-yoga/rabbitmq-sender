FROM node:alpine
WORKDIR /app
COPY ./package.json ./package-lock.json .
RUN yarn install && yarn cache clean
COPY /app/dist/ .
#EXPOSE 3000
CMD [ "yarn", "start"]