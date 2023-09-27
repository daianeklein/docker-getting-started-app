FROM node:18-alpine
WORKDIR /app

#add users
RUN addgroup -S dev && adduser -S daiane -G dev
USER daiane

COPY . .
#COPY yarn.lock package.json
#COPY package.json /app/
#COPY *.json
#COPY . /app/

#ADD https://microsoft.com/test.json .
#ADD test.zip .

#instalar dependencias
#instala quando a imagem foi construida
RUN apk add --no-cache python3 g++ make
RUN yarn install --production

#ENV API_URL=https://api.daianeklein.com/

#node /src/index.ls
CMD ["node", "src/index.js"] #qdo a imagem ja foi construida

#port
EXPOSE 3000 