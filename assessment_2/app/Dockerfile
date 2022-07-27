FROM node:16-alpine as builder
COPY package.json package-lock.json ./
RUN npm install && mkdir /react-ui && mv ./node_modules ./react-ui
WORKDIR /react-ui
COPY . .
RUN npm run build


FROM nginx
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /react-ui/build /usr/share/nginx/html
EXPOSE 3000 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
