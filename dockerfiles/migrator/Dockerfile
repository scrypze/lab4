FROM alpine:3.19
RUN apk add --no-cache postgresql-client bash

WORKDIR /migrations
COPY ./migrations /migrations
COPY ./apply_migrations.sh /apply_migrations.sh
RUN chmod +x /apply_migrations.sh

ENTRYPOINT ["/bin/bash", "/apply_migrations.sh"]
