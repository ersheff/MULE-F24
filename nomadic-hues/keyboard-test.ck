0 => int deviceNum;

Hid hi;
HidMsg msg;

hi.openKeyboard(deviceNum);

// accounts for bluetooth keyboard or touch bar on mac
while (hi.name().find("Magic") != -1 || hi.name().find("Touch") != -1) {
  <<< "skipping '", hi.name(), "'" >>>;
  deviceNum++;
  hi.openKeyboard(deviceNum);
}

<<< "keyboard '", hi.name(), "' ready" >>>;

while(true) {
  hi => now;

  if (hi.recv(msg) && msg.isButtonDown()) {
    <<< "\n", msg.which, "PRESSED" >>>;
  }

}