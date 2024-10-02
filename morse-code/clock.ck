// "127.0.0.1" => string address; // for local testing
// "192.168.0.1" => string address; // for MULE network
8002 => int port;

OscOut xmit;
xmit.dest(address,port);

while(true) {
    xmit.start("/clock");
    1 => xmit.add;
    xmit.send();
    
    0.5::second => now;
}