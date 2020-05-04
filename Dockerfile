FROM perl:5.26.3-slim AS builder
COPY . .
ENTRYPOINT ["./pg_format"]

