FROM python:3.11-slim

# Set working directory
WORKDIR /mcpo

# Install Node.js and npx
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /mcpo

# Install Python dependencies and uv
RUN pip install --no-cache-dir . uv

# Expose the default port
EXPOSE 8000

# Command to run the mcpo server
CMD ["mcpo", "--config", "/mcpo/config.json"]