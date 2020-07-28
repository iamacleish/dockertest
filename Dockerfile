FROM golang:1.14 as build
WORKDIR /app
COPY . /app
RUN cd /app && CGO_ENABLED=0 GOOS=linux go build .


FROM alpine:latest
COPY --from=build /app /
CMD ["./hello"]
