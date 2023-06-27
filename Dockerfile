FROM node:alpine

# Install dependencies
RUN apk update
RUN apk add --no-cache nginx

# Copy application files
COPY ./app /usr/share/app
WORKDIR /usr/share/app

# Install application dependencies and build
RUN npm install

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf
COPY ./app/dist /usr/share/nginx/html

# Expose ports for Node.js and Nginx
EXPOSE 3000
EXPOSE 80

# CMD ["nginx", "-g", "daemon off;", "&&", "node", "index.js"]
CMD sh -c "nginx -g 'daemon off;' & node index.js"

