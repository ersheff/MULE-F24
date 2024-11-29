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
  5 => int NUM_IN_FRONT;
  6 => int NUM_IN_BACK;
  5 => int NUM_BASS;
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
      9 => num_targets;
      5 => NUM_IN_FRONT;
      4 => NUM_IN_BACK;

      // front section
      backing[0].setHost ( "Isas-MacBook-Pro.local", port ); // Isa
      backing[1].setHost ( "LAPTOP-ROO7OHCS.local", port ); // Paul
      // backing[2].setHost ( "192.168.0.5", port ); // Will
      backing[2].setHost ( "SydneysDell.local", port ); // Sydney
      backing[3].setHost ( "Ethans-MacBook-Pro.local", port ); // Ethan
      backing[4].setHost ( "Megans-MacBook-Pro.local", port ); // Megan
      // backing[5].setHost ( "192.168.0.13", port ); // Aidan

      // back section
      backing[5].setHost ( "oscar-mba.local", port ); // Oscar
      // backing[7].setHost ( "192.168.0.8", port ); // Alex
      backing[6].setHost ( "LAPTOP-BEFMPJ5E.local", port ); // Micah
      // backing[9].setHost ( "192.168.0.11", port ); // Jackson
      // backing[9].setHost ( "192.168.0.14", port ); // Nate
      // backing[9].setHost ( "192.168.0.15", port ); // Mitsi
      backing[7].setHost ( "Artemis.local", port ); // Artemis
      backing[8].setHost ( "Ians-MBP.local", port ); // Ian

      // SETUP FOR BASS SYNTH
      // write into the bassIndexes array negative numbers if you want less than
      // NUM_BASS basses (handled as special case by the sendBass function)
      9 => NUM_BASS;
      [0,1,2,3,4,5,6,7,8] @=> bassIndexes;
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
