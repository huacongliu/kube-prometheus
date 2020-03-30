#!/bin/bash
##用法：
#image-load.sh --images-path images-2020-03-19

# 定义日志
workdir=`pwd`
log_file=${workdir}/sync_images_$(date +"%Y-%m-%d").log

logger()
{
    log=$1
    cur_time='['$(date +"%Y-%m-%d %H:%M:%S")']'
    echo ${cur_time} ${log} | tee -a ${log_file}
}

POSITIONAL=()
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -i|--images-path)
        images_path="$2"
        shift # past argument
        shift # past value
        ;;
        -l|--image-list)
        list="$2"
        shift # past argument
        shift # past value
        ;;
        -h|--help)
        help="true"
        shift
        ;;
    esac
done

usage () {
    echo "USAGE: $0 [--image-list images.txt] [--images images.tar.gz]"
    echo "  [-l|--images-list path] text file with list of images. 1 per line."
    echo "  [-l|--images path] tar.gz generated by docker save."
    echo "  [-h|--help] Usage message"
}

if [[ $help ]]; then
    usage
    exit 0
fi

#set -e -x

# 镜像压缩文件列表
images=$(cat images.txt |sed "s#/#-#g; s#:#-#g")
#images_path=images-$(date +"%Y-%m-%d")
images_path=images-prometheus-optrator
cd $images_path

# 导入镜像
docker_load ()
{
    for imgs in $(echo ${images});
    do
        gunzip -c ${imgs}.tgz | docker load >/dev/null 2>&1

        if [ $? -ne 0 ]; then
            logger "${imgs} load failed."
        else
            logger "${imgs} load successfully."
        fi
    done
}
docker_load
cd ..