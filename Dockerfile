FROM node:alpine
WORKDIR /app
COPY ./package.json ./package-lock.json .
RUN yarn install
COPY dist/ .
#EXPOSE 3000
CMD [ "yarn", "start"]