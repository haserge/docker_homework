# build environment

FROM node:13.12.0-alpine AS builder

# set working directory
WORKDIR /frontend

# add `/node_modules/.bin` to $PATH
ENV PATH /frontend/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./

RUN npm install

# copy application
COPY . ./

# make build directory
RUN npm run build

# production environment

FROM nginx:latest

COPY --from=builder /frontend/build /usr/share/nginx/html

# replace default nginx configuration file with custom one
# (because we are using react router)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
