FROM golang:1.19.1

ARG REVISION
ARG COMMIT_HASH

WORKDIR /usr/src/app

COPY . .
RUN go mod download

COPY . .
RUN go build -ldflags="-w -s -X 'main.Rev=$REVISION' -X 'main.CommitHash=$COMMIT_HASH' -X 'main.BuildTS=$(date)'" -o main

FROM scratch

COPY --from=builder /usr/src/app/main ./main

CMD ["./main"]