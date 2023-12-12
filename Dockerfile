FROM golang:1.21 as builder
WORKDIR /app
COPY . .
RUN go build -buildmode=c-shared -o /app/nats-output.so .

FROM fluent/fluent-bit:2.2-debug
COPY --from=builder /app/nats-output.so /fluent-bit/bin/nats-output.so
ADD ./build/plugins.conf /fluent-bit/etc/plugins.conf
