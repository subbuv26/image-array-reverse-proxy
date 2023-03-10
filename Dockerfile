FROM golang:1.18 as builder
WORKDIR /workspace/reverse_proxy

COPY main.go .
COPY proto proto

COPY go.mod .

RUN go mod download

RUN go mod tidy

# RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o reverse_proxy main.go
RUN CGO_ENABLED=0 go build -a -o reverse_proxy main.go


# RUN CGO_ENABLED=0 go get github.com/grpc-ecosystem/grpc-health-probe
# RUN CGO_ENABLED=0 go get github.com/subbuv26/hellogrpcreverseproxy/greeter_server

FROM scratch
COPY --from=builder /workspace/reverse_proxy/reverse_proxy reverse_proxy
EXPOSE 8082
ENTRYPOINT ["/reverse_proxy"]
