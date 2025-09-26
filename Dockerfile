FROM debian:stable-slim

RUN apt-get update &&     apt-get install -y fortune cowsay bash &&     rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh &&     groupadd -r app && useradd -r -g app app && chown -R app:app /app
USER app

EXPOSE 4499
CMD ["/bin/bash", "/app/wisecow.sh"]
