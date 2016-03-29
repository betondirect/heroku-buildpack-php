#!/bin/bash
# Build Path: /app/.heroku/php/
dep_url=git://github.com/mote0230/dbase-pecl-php7
dbase_dir=dbase-pecl-php7
echo "-----> Building dbase..."

### Dbase
echo "[LOG] Downloading dbase-pecl-php7"
git clone $dep_url -q
if [ ! -d "$dbase_dir" ]; then
  echo "[ERROR] Failed to find phalconphp directory $phalcon_dir"
  exit
fi
cd $dbase_dir

phpize
./configure --enable-dbase
make
make install
BUILD_DIR=$1
ln -s $BUILD_DIR/.heroku /app/.heroku
export PATH=/app/.heroku/php/bin:$PATH
bash ./install
cd
echo "important extension phalcon into php.ini"
echo "extension=dbase.so" >> /app/.heroku/php/etc/php/php.ini
