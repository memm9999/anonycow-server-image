FROM node:current-alpine3.16
ENV NODE_ENV=production
WORKDIR /app
COPY ["anonycow-server/package.json", "anonycow-server/package-lock.json*", "./"]
RUN npm install --production
COPY ./.env .
COPY ./anonycow-server .
COPY ./runPrismaStudio.sh .
COPY ./entrypoint.sh .
RUN chmod +x ./runPrismaStudio.sh
RUN chmod +x ./entrypoint.sh
RUN npm link
RUN npx prisma generate
ENTRYPOINT ["bash", "./entrypoint.sh"]
