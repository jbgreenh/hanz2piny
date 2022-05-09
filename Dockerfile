# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake g++ make

## Add source code to the build stage.
ADD . /hanz2piny
WORKDIR /hanz2piny

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN cd build && cmake . && make

# Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

## TODO: Change <Path in Builder Stage>
COPY --from=builder /hanz2piny/build/hanz2piny /

