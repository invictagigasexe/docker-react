# 1. step
FROM node:alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# output is build folder -> /app/build

# 2.step new base image
FROM nginx 

#copy result from first block wich was saved in /app/build to nginx specific folder
COPY --from=0 /app/build /usr/share/nginx/html


