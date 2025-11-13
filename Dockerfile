FROM node:25-alpine AS builder
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npx parcel "./src/index.html" --dist-dir "./dist" --public-url "./"

FROM nginx:alpine
COPY --from=builder /app/dist/ /usr/share/nginx/html