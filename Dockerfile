# Use an official Node.js runtime as a parent image
FROM oven/bun:1 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and bun.lockb
COPY package*.json ./
COPY bun.lockb ./

# Install dependencies
RUN bun install

# Copy the rest of the application code
COPY . .

# Build the Svelte app
RUN bun run build

# Production stage
FROM oven/bun:1
WORKDIR /app

# Copy the built application from build stage
# SvelteKit with Bun adapter creates the build output in the build directory
COPY --from=build /app/build ./
COPY --from=build /app/package.json ./

# Install only production dependencies
RUN bun install --production

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app
CMD ["bun", "index.js"]
