#!/bin/bash

for interface in "$@"
do
    echo $interface
    sudo ethtool -K $interface gro off
    sudo ethtool -K $interface gso off
    sudo ethtool -K $interface lro off
    sudo ethtool -K $interface ufo off
    sudo ethtool -K $interface tso off
    sudo ethtool -K $interface tx off
    sudo ethtool -K $interface sg off
    sleep 1
done

