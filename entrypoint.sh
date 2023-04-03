#!/bin/sh
npx prisma db push
nohup ./runPrismaStudio.sh &
node index.js
