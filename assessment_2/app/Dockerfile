FROM node as builder

RUN mkdir react-ui
WORKDIR /react-ui

COPY . .

RUN npm install
RUN npm run build

FROM nginx

COPY --from=builder /react-ui/build /usr/share/nginx/html


