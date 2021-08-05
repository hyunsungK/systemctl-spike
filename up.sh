#!/bin/bash


function up() {
    docker run --rm -d --name systemctl --privileged -p 4000:22 ubuntu-systemctl
}

up