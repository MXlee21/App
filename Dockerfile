# Use an official Node.js runtime as a parent image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json from the root of the repository
COPY App/package*.json ./

# Install dependencies
RUN npm ci

# Copy the scripts directory
COPY App/scripts ./scripts

# Copy the rest of the application code
COPY App/ .

# Run the post-install script
RUN sh ./scripts/postInstall.sh

# Build the project
RUN npm run build --if-present

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
