FROM node:alpine as build
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn
COPY . ./
RUN yarn install

FROM node:alpine
RUN mkdir -p /app
WORKDIR /app
COPY --from=build /usr/src/app/build /app
CMD ["yarn", "run"]