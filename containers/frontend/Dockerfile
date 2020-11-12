FROM node:latest
EXPOSE 3000
WORKDIR /app
ENV NODE_ENV=production
COPY ["package.json","package-lock.json","./"]
ENV REACT_APP_API_URL=http://localhost:5000/api/topics
RUN npm install --silent --production && mv node_modules ../
COPY . .
ENTRYPOINT [ "npm", "start" ]