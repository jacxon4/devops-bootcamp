FROM node:latest
EXPOSE 3000
WORKDIR /app
ENV NODE_ENV=production
COPY ["package.json","package-lock.json","./"]
RUN npm install --silent --production && mv node_modules ../
COPY . .
CMD [ "npm", "start" ]