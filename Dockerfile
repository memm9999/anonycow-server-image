FROM node:current-alpine3.16
ENV NODE_ENV=production
WORKDIR /app
COPY ["anonycow-server/package.json", "anonycow-server/package-lock.json*", "./"]
RUN npm install --production
COPY ./.env .
COPY ./anonycow-server .
COPY ./runPrismaStudio.sh .
RUN chmod +x ./runPrismaStudio.sh
RUN npm link
RUN npx prisma generate
RUN npx prisma db push
RUN create-admin --username=mohammed --password=123456789
RUN nohup ./runPrismaStudio.sh &
RUN node index.js
