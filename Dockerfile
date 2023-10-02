FROM alpine:latest

LABEL author="alsemo@gmail.com"

# Update APK
RUN apk update && apk upgrade

# Create fossil user
RUN adduser -DH fossil

# Install Fossil SCM
RUN apk add --no-cache fossil

# Create repository directory
RUN mkdir -p /opt/fossil/dev
RUN mknod /opt/fossil/dev/null c 1 3
RUN mknod /opt/fossil/dev/urandom c 1 9
RUN chown -R fossil:fossil /opt/fossil
RUN chmod -R 666 /opt/fossil/dev/*

WORKDIR /opt/fossil

EXPOSE 9000

# Added entrypoint for fossil
ENTRYPOINT [ "/usr/bin/fossil" ]

# Run fossil server with scgi and repolist
CMD [ "server", "--scgi", "--port", "9000", "--repolist", "/opt/fossil" ]