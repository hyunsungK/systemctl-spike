#!/bin/bash


function build() {
    docker build -t ubuntu-systemctl .
}

build
