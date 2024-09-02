# Use an official Node.js runtime as a parent image
FROM node:20.15.1

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Copy the scripts directory if needed
COPY scripts ./scripts

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the project 
RUN npm run build --if-present

# Expose the port your app runs on
EXPOSE 3000

# Define the command to run your app
CMD [ "npm", "start" ]
