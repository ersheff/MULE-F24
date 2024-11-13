live_loop :my_pattern do  
  use_synth :beep
  use_synth_defaults
  
  # values after pattern name are release time (0-1) and octave shift
  pattern1 1, 0
  
end

# -----
# collect usable synths here

# :beep
# :blade
# :growl
# :hollow
# :hoover
# --- attack: 0.25
# :kalimba
# --- sustain 0.3 or lower
# :pretty_bell
# :prophet
# --- env_curve: 7
# --- attack: 0.5
# --- cutoff: 85
# :rodeo
# --- sustain_level: between 0.05 - 0.5
# :saw
# --- raising the attack and lowering the cutoff gives a drone sound for low octaves
# --- something like attack:5, cutoff: 70
# --- in general, a good synth for playing with envelope settings
# --- env_curve: 1 - linear; 2 and 3 - broken; 4, 6, and 7 - good curves
# :tb303
# --- cutoff: 80 - makes a vocal wah sound
# --- cutoff: 60 - makes a mellow bass sound 
# --- cutoff_release: 0.1-0.5 - sounds like a fart
# --- wave: 2
# --- cutoff_release: 0.5 - sounds like a lazer beam at the end
# :tech_saws
# :winwood_lead
# --- lfo_width: 0.05
# --- lfo_rate: 8
# -- ramp_length: 0
# --- ramp_ratio: 0
# --- sustain: 0.2
