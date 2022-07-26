FROM node as builder

COPY package.json package-lock.json ./

RUN npm install && mkdir /react-ui && mv ./node_modules ./react-ui

WORKDIR /react-ui

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /react-ui/build /usr/share/nginx/html


