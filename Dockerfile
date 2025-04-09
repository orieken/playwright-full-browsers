FROM mcr.microsoft.com/playwright:v1.51.1-noble

ENV VERSION=${VERSION}

RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    # libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    # Core libraries
    libx11-6 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxi6 \
    libxtst6 \
    libnss3 \
    libxrandr2 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
#    libasound2 \
    libdrm2 \
    libxshmfence1 \
    # Mesa for GL
    libgbm1 \
    libgl1-mesa-dri \
    mesa-utils \
    # XVFB
    xvfb \
    xauth \
    xkb-data \
    # Supervisor
    supervisor \
    --no-install-recommends \
#   Google Chrome
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || apt-get install -fy \
#   Microsoft Edge
    && wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list \
    && apt-get update \
    && apt-get install -y microsoft-edge-stable \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
    google-chrome-stable_current_amd64.deb

