# Use Node 20
FROM node:20

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install top-level dependencies
RUN yarn install

# Build Medusa project
RUN yarn build

# Move into Medusa backend directory and install dependencies
WORKDIR /app/.medusa/server
RUN yarn install

# Copy startup script
COPY start.sh ./start.sh
RUN chmod +x ./start.sh

# Expose Medusa default port
EXPOSE 9000

# Run startup script
CMD ["sh", "./start.sh"]