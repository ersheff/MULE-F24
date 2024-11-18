# -----
# usable synths

# :bass_foundation (mellow synth)
# :beep (sine tones)
# :blade (suprisingly mellow, just a hint of buzz)
# :chipbass (8-bit, TUNING DOES NOT WORK UP AN OCTAVE)
# :dtri (slightly detuned synth)
# :fm (80s synth with a little growl)
# :hollow (kind of a pizz sound, TOO MUDDY DOWN AN OCTAVE)
# :kalimba
# :organ_tonewheel (lots of sustain, don't use on fast patterns)
# :piano
# :pretty_bell
# :rodeo (electric piano)
# :tri (triangle wave, slightly brighter than sine)

live_loop :my_pattern do
  
  # change synth here
  synth_name = :piano
  use_synth synth_name
  
  if synth_name == :hollow
    use_synth_defaults amp: 3, attack: 0
  elsif synth_name == :kalimba
    use_synth_defaults amp: 9, sustain: 0.15, attack: 0
  else
    use_synth_defaults attack: 0
  end
  
  # with_fx :echo, phase: 0.5, mix: 0.5 do
  with_fx :reverb, room: 0.6, damp: 0.5, mix: 0.4 do
    pattern1 0
  end
  
end





