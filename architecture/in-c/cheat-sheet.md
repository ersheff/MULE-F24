# In C MULE Cheatsheet

## Prep

1. Make a copy of **load.rb** and put it in the Storage folder. Open the file, uncomment the line that corresponds to your OS (modifying it as needed), and save.

	- On Mac, the file path should work as-is if your **MULE-F24** folder is in the default GitHub location.
	- On Windows, replace "\<YourUsername\>" with your username.

2. In Sonic Pi, load the updated **load.rb** file in a tab and run it.
3. In a different Sonic Pi tab, load the **performance.rb** file (but do not run it yet).
4. Make sure that you are connected to one of MULE's wifi networks and click the **Link** button to synchronize with the other players.

## Performance

All of the following actions take place in the tab where the **performance.rb** file was loaded.

- At the top of the file is a list of recommended synths. To change synths, replace the value assigned to **synth_name** on **line 21**.
- Volume differences for a couple of synths are compensated for in the `if` statements on **lines 24–30**. **DO NOT** change the **amp** or **sustain** parameters. You may adjust the **attack** value (default is 0) for a softer articulation.
- The patterns are always loaded with either **echo** or **reverb**, as specified on **lines 32 and 33**. You can uncomment **ONE** of these lines at a time, depending on the effect you'd like to use. You may also adjust the parameters for each effect as needed:
	- Echo
		- Phase = delay time (0.25 = 1/16 note, 0.5 = 1/8 note, etc.)
	- Reverb
		- Room = length of the reverb (0-1, default 0.6)
		- Damp = dampening of high frequencies (0-1, default 0.5)
	- Mix = dry/wet balance (0-1). Set to 0 to bypass the active effect.
- Running the tab will start the pattern specified on **line 34**. The number after the pattern is the octave shift (-1, 0, or 1).
