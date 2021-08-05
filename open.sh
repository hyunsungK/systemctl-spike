#!/bin/bash


function open() {
    docker exec -it systemctl /bin/bash
}

open