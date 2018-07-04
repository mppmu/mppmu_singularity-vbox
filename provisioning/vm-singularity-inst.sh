#!/bin/bash -e

# run as root

test -f /usr/local/bin/singularity && exit 0

BUILD_DIR=`mktemp -t -d "build-singularity-XXXXXX"`

(
	cd "${BUILD_DIR}"
    git clone "https://github.com/singularityware/singularity.git" "singularity"
	cd singularity
	git checkout 2.5.2
	./autogen.sh
	./configure --prefix=/usr/local
	make -j`nproc` install
)

rm -rf "${BUILD_DIR}"
