FROM node:lts-alpine3.15 AS app

RUN rm -rf node_modules/
RUN npm install --silent
RUN npm run build



FROM nginx

COPY --from=app /app/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
