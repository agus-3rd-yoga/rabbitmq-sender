FROM node:alpine
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install && yarn clean cache
COPY . .
CMD ["yarn", "start"]