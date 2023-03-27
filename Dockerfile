FROM node:16.14-alpine as builder
# Node directory in container
WORKDIR /usr/src/app

COPY .npmrc.ci .npmrc
COPY package.json .
COPY yarn.lock .

RUN --mount=type=ssh yarn install --frozen-lockfile

COPY . .

RUN yarn build