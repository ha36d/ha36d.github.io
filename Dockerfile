FROM ruby:3.4-slim AS jekyll

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# used in the jekyll-server image, which is FROM this image
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN gem update --system && gem cleanup

EXPOSE 4000

WORKDIR /site

ENTRYPOINT [ "entrypoint.sh" ]

CMD [ "jekyll", "--help" ]