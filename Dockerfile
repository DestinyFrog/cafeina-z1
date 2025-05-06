FROM node:23-alpine3.21 AS front
WORKDIR /cafeina

ENV VITE_URL=/api/v1

COPY web ./web
COPY package.json .
COPY package-lock.json .
COPY svelte.config.js .
COPY tsconfig.app.json .
COPY tsconfig.json .
COPY tsconfig.node.json .
COPY vite.config.ts .

RUN npm install
RUN npm run build

FROM rust:1.86.0
WORKDIR /cafeina

COPY Cargo.lock .
COPY Cargo.toml .
COPY api ./api

RUN apt-get update
RUN apt-get install -y apt-utils lua5.3 lua5.3-dev build-essential
RUN cargo build --release

ENV MODE=PROD
ENV LOCAL_DB=cat.sqlite3
ENV API_HOST=0.0.0.0
ENV API_PORT=80
ENV API_PREFIX=/api/v1

COPY --from=front /cafeina/dist ./dist
COPY z1 ./z1

EXPOSE 80
CMD ["./target/release/api"]