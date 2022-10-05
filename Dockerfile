FROM golang:1.19.1

ARG REVISION
ARG COMMIT_HASH

WORKDIR /usr/src/app

COPY . .
RUN go mod download

COPY . .
RUN go build -v -o /usr/local/bin/app ./... -ldflags="-w -s -X 'main.Rev=$REVISION' -X 'main.CommitHash=$COMMIT_HASH' -X 'main.BuildTS=$(date)'"

CMD ["app"]