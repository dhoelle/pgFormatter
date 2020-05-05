FROM scottw/alpine-perl AS builder
COPY . .
RUN cpanm pp
RUN pp -l /lib/ld-musl-x86_64.so.1 -o /pg_format_bin pg_format

FROM scratch AS runner
COPY --from=builder /pg_format_bin /pg_format_bin
COPY --from=builder /lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
ENTRYPOINT ["/pg_format_bin"]

