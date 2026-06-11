FROM node:22

WORKDIR /cube

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 4000

CMD ["npm","run","dev"]
