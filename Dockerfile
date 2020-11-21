FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


#Begins new stage
FROM nginx

EXPOSE 80
#From the latest stage get what was produced on app/build and copy it inside this new directory
COPY --from=0 /app/build /usr/share/nginx/html