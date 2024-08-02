### STAGE 1: BUILD ###
# Use Node image for building and compiling the code
FROM node:12.14-alpine AS build

# Set working directory inside the container
WORKDIR /dist/src/app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Clean npm cache
RUN npm cache clean --force

# Install dependencies and build the Angular app
RUN npm install
RUN npm run build --prod

### STAGE 2: RUN ###
# Use Nginx image for serving the application
FROM nginx:latest AS ngi

# Copy compiled code and Nginx config to the appropriate folder
COPY --from=build /dist/src/app/dist/angdemo/browser /usr/share/nginx/html
COPY /nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
# EXPOSE 80
