FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# exposing port 80 for aws elasticbeanstalk with the "EXPOSE" command 
FROM nginx
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
