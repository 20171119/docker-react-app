# build 과정
FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

# run 과정
FROM nginx
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
# /usr/src/app/build 에 build 파일 저장
# /usr/share/nginx/html 을 기본적으로 nginx 가 저장됨

# docker run -p 8080:80 jspark98/docker-react-app
# nginx 는 80 기본 포트를 씀