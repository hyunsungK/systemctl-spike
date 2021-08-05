#!/bin/bash


function up() {
    docker run --rm -d --name systemctl --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 4000:22 ubuntu-systemctl
}

up