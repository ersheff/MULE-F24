public class Xmitter
{
  // send objects
  OscSend backing[16];
  // number of targets (initialized by init)
  int num_targets;
  // port
  6449 => int port;

  // default values, set actual values based on setup in the init function below, 
  // under the else branch
  8 => int NUM_IN_FRONT;
  7 => int NUM_IN_BACK;
  15 => int NUM_BASS;
  int bassIndexes[NUM_BASS];

  fun void init(string arg)
  {
    if (arg == "local" || arg == "l" || arg == "localhost")
    {
      <<< "Initializing Xmitter for local" >>>;
      1 => num_targets;

      1 => NUM_BASS;
      [0] @=> bassIndexes;
      backing[0].setHost ( "localhost", port );
    } else
    {
      <<< "Initializing Xmitter for non-local" >>>;

      // SETUP CLIENT TARGETS
      15 => num_targets;
      8 => NUM_IN_FRONT;
      7 => NUM_IN_BACK;

      // front section
      backing[0].setHost ( "Oscars-MacBook-Air.local", port ); // Oscar
      backing[1].setHost ( "LAPTOP-BEFMPJ5E.local", port ); // Micah
      backing[2].setHost ( "Ethans-MacBook-Pro.local", port ); // Ethan
      backing[3].setHost ( "Ians-MacBook-Pro.local", port ); // Ian
      backing[4].setHost ( "LAPTOP-NPLAEJ80.local", port ); // Mitsi
      backing[5].setHost ( "Megans-MacBook-Pro-6.local", port ); // Megan
      backing[6].setHost ( "DESKTOP-JCSG891.local", port ); // Aidan
      backing[7].setHost ( "Alex-LapPowerBottom.local", port ); // Alex


      // back section
      backing[8].setHost ( "Jacksons-MacBook-Pro-2.local", port ); // Jackson
      backing[9].setHost ( "nate.local", port ); // Nate
      backing[10].setHost ( "LAPTOP-ROO7OHCS.local", port ); // Paul
      backing[11].setHost ( "SydneysDell.local", port ); // Sydney
      backing[12].setHost ( "Williams-MBP-2.local", port ); // Will
      backing[13].setHost ( "Isas-MacBook-Pro.local", port ); // Isa
      backing[14].setHost ( "Artemis.local", port ); // Artemis


      // SETUP FOR BASS SYNTH
      // write into the bassIndexes array negative numbers if you want less than
      // NUM_BASS basses (handled as special case by the sendBass function)
      15 => NUM_BASS;
      [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14] @=> bassIndexes;
    }
  }

  fun int targets()
  {
    return num_targets;
  }

  fun OscSend @ at(int i)
  {
    return backing[i];
  }

  fun int[] basses()
  {
    return bassIndexes;
  }

  fun int front()
  {
    return NUM_IN_FRONT;
  }

  fun int back()
  {
    return NUM_IN_BACK;
  }
}
