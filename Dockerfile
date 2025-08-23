# Use newer Debian base (bullseye) instead of buster
FROM nikolaik/python-nodejs:python3.10-nodejs20-bullseye

# Install ffmpeg
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy your app code
COPY . /app/
WORKDIR /app/

# Install Python dependencies
RUN pip3 install --no-cache-dir -U -r requirements.txt

# Start the app
CMD ["bash", "start"]
