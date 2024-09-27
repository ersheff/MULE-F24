// ----- keyboard setup -----

/*
All Windows laptops that have been tested report the built-in keyboard as device 0.
Some older Mac laptops report the Touch Bar as device 0.
They may also retain a connection to nearby bluetooth "Magic" keyboards, even when not in use.
This checks whether the name of device 0 includes "Magic" or "Touch".
If it does, the device number is incremented in order to find the built-in keyboard.
*/

// the device number to open
0 => int deviceNum;

// instantiate a HidIn object
Hid hi;
// structure to hold HID messages
HidMsg msg;

// open keyboard
if( !hi.openKeyboard( deviceNum ) ) me.exit();

// accounts for bluetooth keyboard or touch bar on mac
while (hi.name().find("Magic") != -1 || hi.name().find("Touch") != -1) {
  <<< "skipping '", hi.name(), "'" >>>;
  deviceNum++;
  hi.openKeyboard(deviceNum);
}

// successful! print name of device
<<< "keyboard '", hi.name(), "' ready" >>>;


// ----- key numbers, mac vs. windows -----

if (me.arg(1) == "mac") {
  44 => spacebar;
  82 => upArrow;
  81 => downArrow;
  80 => leftArrow;
  79 => rightArrow;
  41 => escKey;
  13 => jKey;
  30 => oneKey;
  39 => zeroKey;
}
else {
  57 => spacebar;
  200 => upArrow;
  208 => downArrow;
  203 => leftArrow;
  205 => rightArrow;
  1 => escKey;
  36 => jKey;
  2 => oneKey;
  11 => zeroKey;
}

/*
Some Mac laptops with Touch Bar do not record a value when the escape key is pressed.
I'm not sure whether this is an OS version or hardward difference.
In any case, we've added the ~ key as an option to leave the grid.
*/ 

//escape, allow nodes to leave, optionally use ~ on touch bar macs
if (msg.which == escKey || msg.which == 53)
{
  <<< "YOU HAVE DEPARTED THE GRID. PRESS SPACE TO RE-ENTER" >>>;
  false => hasEntered; //reset to allow spacebar for reentry
  xmitMove(0,0);
}