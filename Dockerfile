FROM node:lts-alpine

WORKDIR /app

# Copy the package files for the main application, client, and server
COPY package*.json ./
COPY client/package*.json client/
COPY server/package*.json server/
COPY client/ client/
COPY server/ server/

# Install dependencies for main application
RUN npm install

# Install dependencies for client
WORKDIR /app/client
RUN npm install

# Build the client application
RUN npm run build

# Go back to the main directory
WORKDIR /app

# Install dependencies for server
WORKDIR /app/server
RUN npm install

# Go back to the main directory
WORKDIR /app

# Set user
USER node

# Start the server application
CMD [ "npm", "start", "--prefix", "server" ]

# Expose the port
EXPOSE 8001
