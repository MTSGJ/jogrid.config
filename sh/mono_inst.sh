#
#
#
MONOVER="2.10.9"
GDIPVER="2.10"
#
NANTVER=""

#
# DownLoad
#
wget ftp://www.nsl.tuis.ac.jp/pub/mono/libgdiplus/libgdiplus-${GDIPVER}.tar.bz2
wget ftp://www.nsl.tuis.ac.jp/pub/mono/mono-${MONOVER}.tar.bz2
wget ftp://www.nsl.tuis.ac.jp/pub/mono/mono.pc/mono.pc-${MONOVER}.tgz

tar xfvj mono-${MONOVER}.tar.bz2
tar xfvj libgdiplus-${GDIPVER}.tar.bz2

if [ "$NANTVER" != "" ]; then
	wget ftp://www.nsl.tuis.ac.jp/pub/mono/nant-${NANTVER}-src.tar.gz
	tar xfvz nant-${NANTVER}-src.tar.gz
fi


#
# libgdiplus
#
cd libgdiplus-$GDIPVER
./configure
make clean
make
make install
ldconfig
cd ..


#
# mono
# 
cd mono-$MONOVER
./configure --with-libgdiplus=/usr/local/lib/libgdiplus.la
make clean

if [ -d /usr/local/lib/mono ]; then
	rm -fr /usr/local/lib/mono-
	mv /usr/local/lib/mono /usr/local/lib/mono-
fi

make
make install
cd ..

#
zcat mono.pc-${MONOVER}.tgz |(cd /usr/lib/pkgconfig/ && tar xfv -)


#
# nant
#
if [ "$NANTVER" != "" ]; then
	cd nant-$NANTVER
	make
	make install
fi

