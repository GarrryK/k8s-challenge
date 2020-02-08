FROM node:13
# ENV NODE_VERSION 13.8.0

# Create working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
RUN npm install
RUN apt-get update
RUN apt-get install -y curl nginx

# Bundle source code in docker image
COPY . .

# Map app port
EXPOSE 5150

# Run app
CMD ["npm", "start"]

