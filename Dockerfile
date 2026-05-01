FROM node:18-alpine

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev vips-dev > /dev/null 2>&1

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/app

COPY package.json package-lock.json ./
RUN npm install --omit=dev

COPY . .
RUN npm run build

EXPOSE 1337
CMD ["npm", "run", "start"]