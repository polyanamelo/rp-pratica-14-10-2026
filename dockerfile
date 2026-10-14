#backend

FROM node:24-alpine AS backend

WORKDIR /app

COPY ./backend/package*.json /app

RUN npm i

COPY ./backend/ /app/

EXPOSE 3000

CMD ["npm", "start"]

#frontend

FROM node:24-alpine AS frontend

WORKDIR /app

COPY ./frontend/package*.json /app

RUN npm i

COPY ./frontend/ /app/

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173"]