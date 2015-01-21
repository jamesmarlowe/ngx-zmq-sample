# ngx-zmq-sample
Using the ngx_zeromq module with nginx to test it's connection to zmq

See https://github.com/FRiCKLE/ngx_zeromq
and https://github.com/jamesmarlowe/zmq-sample-server

Setup
-----
Firstly, compile nginx (or openresty) with ngx_zeromq (and set paths appropriately)
```
mkdir nginx
cd /home/ubuntu/nginx/
git clone https://github.com/FRiCKLE/ngx_zeromq
wget http://openresty.org/download/ngx_openresty-1.7.7.1.tar.gz
#or wget http://nginx.org/download/nginx-1.7.9.tar.gz
tar xzvf ngx_openresty-1.7.7.1.tar.gz
cd ngx_openresty-1.7.7.1/
./configure --add-module=/home/ubuntu/nginx/ngx_zeromq
make && sudo make install
```

Next Set up a zmq server to respond to requests
```
mkdir zmq
cd /home/ubuntu/zmq/
git clone git@github.com:jamesmarlowe/zmq-sample-server.git
cd zmq-sample-server
mkdir build
cd build
cmake ..
./server &
```

Finally start nginx with a zmq forwarding url and try sending traffic through
```
cd
git clone git@github.com:jamesmarlowe/ngx-zmq-sample.git
cd ngx-zmq-sample
bash restart.sh
curl -X POST -d 'test' localhost/
```
