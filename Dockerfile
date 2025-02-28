# Use an official Node.js runtime as a parent image
FROM oven/bun:1 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./
COPY bun.lockb ./

# Install dependencies
RUN bun install

# Copy the rest of the application code
COPY . .

# Build the Svelte app
RUN bun --bun run build

FROM oven/bun:1
WORKDIR /app

COPY --from=build /app/build .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app
CMD ["bun", "index.js"] 