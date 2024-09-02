# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json from the root of the repository
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the scripts directory from the root of the repository
COPY scripts ./scripts

# Copy the rest of the application code from the root of the repository
COPY . .

# Build the project
RUN npm run build --if-present

# Expose port and define the command to run the app
EXPOSE 3000
CMD ["npm", "start"]
