#!/usr/bin/env bash
set -euo pipefail

gpu_numbers=0
name=
data_dir=
port=8888


usage() {
    echo "USAGE: ./run.sh --port 8888 --data /root/ --gpu 0 --name your_username"
    echo "For multiple GPUs specify commas."
}

if [ $# -eq 0 ]
then
    usage
    exit 1
fi

while [ "$1" != "" ]
do
    case $1 in
        -g | --gpu )
            shift
            gpu_numbers=$1
            ;;
        -n | --name )
            shift
            name=$1
            ;;
        -d | --data)
            shift
            data_dir=$1
            ;;
        -p | --port)
            shift
            port=$1
            ;;
        -h | --help )
            usage
            exit
            ;;
        * ) 
            usage
            exit 1
    esac
    shift
done

if [ "$name" == "" ]
then
    usage
    exit 1
fi

if [ "$data_dir" == "" ]
then
    usage
    exit 1
fi

sudo docker run \
    --runtime=nvidia \
    -e NVIDIA_VISIBLE_DEVICES=${gpu_numbers} \
    -d \
    -p ${port}:8888 \
    -v ${data_dir}:/data/ \
    --name ${name}_gpu_$(echo $gpu_numbers | tr , _) \
    local/devenv-${name}:0.1
