Hid hi;
HidMsg msg;


0 => int deviceNum;

if( !hi.openKeyboard( deviceNum ) ) me.exit();

while (hi.name().find("Magic") != -1 || hi.name().find("Touch") != -1) {
  <<< "skipping '", hi.name(), "'" >>>;
  deviceNum++;
  hi.openKeyboard(deviceNum);
}

<<< "keyboard '", hi.name(), "' ready" >>>;

while( true ) {
  
  hi => now;

  while( hi.recv( msg ) ) {
    if( msg.isButtonDown() ) {
      <<< "\n", msg.which, "PRESSED" >>>;
    }
  }
}