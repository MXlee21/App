# Use an official Node runtime as a parent image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY App/package*.json ./

# Install dependencies
RUN npm ci

# Copy the scripts directory
COPY App/scripts ./scripts

# Copy the rest of the application code
COPY App/ .

# Build the project
RUN npm run build --if-present

# Expose port and define the command to run the app
EXPOSE 3000
CMD ["npm", "start"]
