# Use Hugo's official Docker image
FROM klakegg/hugo:ext-alpine

# Set working directory
WORKDIR /site

# Copy site files into the container
COPY . /site

# Install Go modules (for Hextra theme or other modules)
RUN hugo mod get -u

# Expose the default port used by Hugo server
EXPOSE 1313

# Start the Hugo development server
CMD ["hugo", "server", "--bind", "0.0.0.0", "--baseURL", "http://localhost", "--disableFastRender", "--buildDrafts", "--buildFuture"]
