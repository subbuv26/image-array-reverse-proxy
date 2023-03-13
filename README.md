# Reverse Proxy for gRPC Server

A Reverse Proxy that serves HTTP endpoints for gRPC Server https://github.com/subbuv26/image-array-grpc

# REST API

Add a dummy Bearer token with prefix `Bearer`

## Get List of Images

### Request
    GET localhost:8080/images

### Response
    < HTTP/2 200
    < content-type: application/json
    < content-length: 116
    < apigw-requestid: BjYDVgoOBcwEMTg=
    < grpc-metadata-content-type: application/grpc

    {
        "Images": [
            {
                "url": "image.png",
                "name": "profile",
                "size": 1000
            },
            {
                "url": "image2.png",
                "name": "profile",
                "size": 2000
            }
        ]
    }

## Get an Image
### Request
    GET localhost:8080/images/f2a5e510-ef20-4d60-a68f-b50baffdfae6
### Response
    < HTTP/2 200
    < content-type: application/json
    < content-length: 116
    < apigw-requestid: BjYDVgoOBcwEMTg=
    < grpc-metadata-content-type: application/grpc

    {
        "url": "image2.png",
        "name": "profile",
        "size": 2000
    }

## Create an Image
### Request
    POST localhost:8080/images/
### Body
    {
        "url": "image2.png",
        "name": "profile",
        "size": 2000
    }
### Response
    < HTTP/2 200
    < content-type: application/json
    < content-length: 116
    < apigw-requestid: BjYDVgoOBcwEMTg=
    < grpc-metadata-content-type: application/grpc

    {
        "id": "f2a5e510-ef20-4d60-a68f-b50baffdfae6"
    }

## Delete an Image
### Request
    DELETE localhost:8080/images/f2a5e510-ef20-4d60-a68f-b50baffdfae6
### Response
    < HTTP/2 200
    < content-type: application/json
    < content-length: 116
    < apigw-requestid: BjYDVgoOBcwEMTg=
    < grpc-metadata-content-type: application/grpc

    {
        "success": true
    }

## Note
-  Please add a dummy `Bearer` token with a random value and prefix `Bearer` on every request
