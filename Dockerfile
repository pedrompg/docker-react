#build
FROM node:lts-alpine AS builder

WORKDIR /app
COPY package.json .
RUN npm i
COPY . .

RUN npm run build

# run
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
