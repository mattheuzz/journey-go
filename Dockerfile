FROM golang:1.22.4-alpine

WORKDIR /journey-go

COPY go.mod go.sum ./

RUN go mod download && go mod verify

COPY . .

WORKDIR /journey-go/cmd/journey

RUN go build -o /journey-go/bin/journey .

EXPOSE 8080
ENTRYPOINT [ "/journey-go/bin/journey" ]