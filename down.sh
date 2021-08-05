#!/bin/bash


function down() {
    docker stop systemctl
}

function remove_all() {
    docker system prune -f
}

down
remove_all
