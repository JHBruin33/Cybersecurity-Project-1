#!/bin/bash
mkdir scripts
more 0310_Dealer_schedule ./* | grep 'AM' ./* | grep 'PM' |  awk -F" " '{print $1,$2,$5,$6}'
