cd /tmp/src
curl -O http://ftp.rediris.es/mirror/GNU/gdb/gdb-13.1.tar.gz
tar xf gdb-13.1.tar.gz
mkdir gdb-build
cd gdb-build
export PREFIX="/usr/local/i386elfgcc"
export TARGET=i386-elf
../gdb-13.1/configure --target="$TARGET" --prefix="$PREFIX" --program-prefix=i386-elf-
make
make install