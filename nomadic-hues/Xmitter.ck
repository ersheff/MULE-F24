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
  1 => int NUM_IN_FRONT;
  0 => int NUM_IN_BACK;
  1 => int NUM_BASS;
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
      13 => num_targets;
      6 => NUM_IN_FRONT;
      7 => NUM_IN_BACK;

      // left section
      backing[0].setHost ( "192.168.0.116", port ); // Oscar
      backing[1].setHost ( "192.168.0.4", port ); // Micah
      // backing[2].setHost ( "192.168.0.5", port ); // Ethan
      backing[2].setHost ( "192.168.0.6", port ); // Ian
      backing[3].setHost ( "192.168.0.9", port ); // Aidan
      backing[4].setHost ( "192.168.0.12", port ); // Nate
      backing[5].setHost ( "192.168.0.13", port ); // Paul

      // right section
      backing[6].setHost ( "192.168.0.7", port ); // Mitsi
      backing[7].setHost ( "192.168.0.8", port ); // Megan
      backing[8].setHost ( "192.168.0.10", port ); // Alex
      backing[9].setHost ( "192.168.0.11", port ); // Jackson
      backing[10].setHost ( "192.168.0.14", port ); // Sydney
      backing[11].setHost ( "192.168.0.15", port ); // Will
      backing[12].setHost ( "192.168.0.16", port ); // Isa
      // backing[14].setHost ( "192.168.0.17", port ); // Artemis

      // SETUP FOR BASS SYNTH
      // write into the bassIndexes array negative numbers if you want less than
      // NUM_BASS basses (handled as special case by the sendBass function)
      13 => NUM_BASS;
      [0,1,2,3,4,5,6,7,8,9,10,11,12] @=> bassIndexes;
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
