FROM node:latest
EXPOSE 3000
ENV REACT_APP_API_URL=http://localhost:5000/api/topics
COPY . /app
WORKDIR /app
RUN npm install
ENTRYPOINT [ "npm", "start" ]