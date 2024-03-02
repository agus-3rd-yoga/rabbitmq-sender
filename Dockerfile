FROM node:alpine as builder

# Create app directory
#WORKDIR /usr/src/app

# Install app dependencies
#COPY package.json yarn.lock ./

#RUN yarn install --frozen-lockfile

#COPY . .

#RUN yarn build

#FROM node:alpine

ENV NODE_ENV production
USER node

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package.json yarn.lock ./

RUN yarn install --production --frozen-lockfile && yarn cache clean

COPY --from=builder /app/dist ./app

#EXPOSE 8080
#CMD [ "node", "dist/index.js" ]
CMD [ "yarn", "start" ]