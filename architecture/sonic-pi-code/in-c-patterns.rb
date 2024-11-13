grace = 0.1

define :pulse do |r = 1, o = 0|
  play :c4 + o*12, release: 0.5*r
  play :c5 + o*12, release: 0.5*r
  sleep 0.5
end

define :pattern1 do |r = 1, o = 0|
  play :e4 + o*12, release: r
  sleep 1-grace
  play :c4 + o*12, release: grace*r
  sleep grace
  play :e4 + o*12, release: r
  sleep 1-grace
  play :c4 + o*12, release: grace*r
  sleep grace
  play :e4 + o*12, release: r
  sleep 1-grace
  play :c4 + o*12, release: grace*r
  sleep grace
end

define :pattern2 do |r = 1, o = 0|
  play :e4 + o*12, release: 0.5*r
  sleep 0.5
  play :f4 + o*12, release: 0.5*r
  sleep 0.5
  play :e4 + o*12, release: r
  sleep 1-grace
  play :c4 + o*12, release: grace*r
  sleep grace
end

define :pattern3 do |r = 1, o = 0|
  sleep 0.5
  play :e4 + o*12, release: 0.5*r
  sleep 0.5
  play :f4 + o*12, release: 0.5*r
  sleep 0.5
  play :e4 + o*12, release: 0.5*r
  sleep 0.5
end

define :pattern4 do |r = 1, o = 0|
  sleep 0.5
  play :e4 + o*12, release: 0.5*r
  sleep 0.5
  play :f4 + o*12, release: 0.5*r
  sleep 0.5
  play :g4 + o*12, release: 0.5*r
  sleep 0.5
end

define :pattern5 do |r = 1, o = 0|
  play :e4 + o*12, release: 0.5*r
  sleep 0.5
  play :f4 + o*12, release: 0.5*r
  sleep 0.5
  play :g4 + o*12, release: 0.5*r
  sleep 1
end

define :pattern6 do |r = 1, o = 0|
  play :c5 + o*12, release: 4*r
  sleep 4
end

define :pattern7 do |r = 1, o = 0|
  sleep 3.5
  play :c4 + o*12, release: 0.25*r
  sleep 0.25
  play :c4 + o*12, release: 0.25*r
  sleep 0.25
  play :c4 + o*12, release: 0.5*r
  sleep 0.5
  sleep 4.5
end

define :pattern8 do |r = 1, o = 0|
  play :g4 + o*12, release: 6*r
  sleep 6
  play :f4 + o*12, release: 4*r
  sleep 4
  play :f4 + o*12, release: 4*r
  sleep 4
end

define :pattern9 do |r = 1, o = 0|
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  sleep 3.5
end

define :pattern10 do |r = 1, o = 0|
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern11 do |r = 1, o = 0|
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern12 do |r = 1, o = 0|
  play :f4 + o*12, release: 0.5*r
  sleep 0.5
  play :g4 + o*12, release: 0.5*r
  sleep 0.5
  play :b4 + o*12, release: 4*r
  sleep 4
  play :c5 + o*12, release: r
  sleep 1
end

define :pattern13 do |r = 1, o = 0|
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.75*r
  sleep 0.75
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.5*r
  sleep 0.5
  sleep 0.75
  play :g4 + o*12, release: 3.25*r
  sleep 3.25
end

define :pattern14 do |r = 1, o = 0|
  play :c5 + o*12, release: 4*r
  sleep 4
  play :b4 + o*12, release: 4*r
  sleep 4
  play :g4 + o*12, release: 4*r
  sleep 4
  play :fs4 + o*12, release: 4*r
  sleep 4
end

define :pattern15 do |r = 1, o = 0|
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  sleep 3.75
end

define :pattern16 do |r = 1, o = 0|
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :c5 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern17 do |r = 1, o = 0|
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :c5 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :c5 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  sleep 0.25
end

define :pattern18 do |r = 1, o = 0|
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :e4 + o*12, release: 0.75*r
  sleep 0.75
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern19 do |r = 1, o = 0|
  sleep 1.5
  play :g5 + o*12, release: 1.5*r
  sleep 1.5
end

define :pattern20 do |r = 1, o = 0|
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :g3 + o*12, release: 0.75*r
  sleep 0.75
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern21 do |r = 1, o = 0|
  play :fs4 + o*12, release: 3*r
  sleep 3
end

define :pattern22 do |r = 1, o = 0|
  play :e4 + o*12, release: 1.5*r
  sleep 1.5
  play :e4 + o*12, release: 1.5*r
  sleep 1.5
  play :e4 + o*12, release: 1.5*r
  sleep 1.5
  play :e4 + o*12, release: 1.5*r
  sleep 1.5
  play :e4 + o*12, release: 1.5*r
  sleep 1.5
  play :fs4 + o*12, release: 1.5*r
  sleep 1.5
  play :g4 + o*12, release: 1.5*r
  sleep 1.5
  play :a4 + o*12, release: 1.5*r
  sleep 1.5
  play :b4 + o*12, release: 0.5*r
  sleep 0.5
end

define :pattern23 do |r = 1, o = 0|
  play :e4 + o*12, release: 0.5*r
  sleep 0.5
  play :fs4 + o*12, release: 1.5*r
  sleep 1.5
  play :fs4 + o*12, release: 1.5*r
  sleep 1.5
  play :fs4 + o*12, release: 1.5*r
  sleep 1.5
  play :fs4 + o*12, release: 1.5*r
  sleep 1.5
  play :fs4 + o*12, release: 1.5*r
  sleep 1.5
  play :g4 + o*12, release: 1.5*r
  sleep 1.5
  play :a4 + o*12, release: 1.5*r
  sleep 1.5
  play :b4 + o*12, release: r
  sleep 1
end

define :pattern24 do |r = 1, o = 0|
  play :e4 + o*12, release: 0.5*r
  sleep 0.5
  play :fs4 + o*12, release: 0.5*r
  sleep 0.5
  play :g4 + o*12, release: 1.5*r
  sleep 1.5
  play :g4 + o*12, release: 1.5*r
  sleep 1.5
  play :g4 + o*12, release: 1.5*r
  sleep 1.5
  play :g4 + o*12, release: 1.5*r
  sleep 1.5
  play :g4 + o*12, release: 1.5*r
  sleep 1.5
  play :a4 + o*12, release: 1.5*r
  sleep 1.5
  play :b4 + o*12, release: 0.5*r
  sleep 0.5
end

define :pattern25 do |r = 1, o = 0|
  play :e4 + o*12, release: 0.5*r
  sleep 0.5
  play :fs4 + o*12, release: 0.5*r
  sleep 0.5
  play :g4 + o*12, release: 0.5*r
  sleep 0.5
  play :a4 + o*12, release: 1.5*r
  sleep 1.5
  play :a4 + o*12, release: 1.5*r
  sleep 1.5
  play :a4 + o*12, release: 1.5*r
  sleep 1.5
  play :a4 + o*12, release: 1.5*r
  sleep 1.5
  play :a4 + o*12, release: 1.5*r
  sleep 1.5
  play :b4 + o*12, release: 1.5*r
  sleep 1.5
end

define :pattern26 do |r = 1, o = 0|
  play :e4 + o*12, release: 0.5*r
  sleep 0.5
  play :fs4 + o*12, release: 0.5*r
  sleep 0.5
  play :g4 + o*12, release: 0.5*r
  sleep 0.5
  play :a4 + o*12, release: 0.5*r
  sleep 0.5
  play :b4 + o*12, release: 1.5*r
  sleep 1.5
  play :b4 + o*12, release: 1.5*r
  sleep 1.5
  play :b4 + o*12, release: 1.5*r
  sleep 1.5
  play :b4 + o*12, release: 1.5*r
  sleep 1.5
  play :b4 + o*12, release: 1.5*r
  sleep 1.5
end

define :pattern27 do |r = 1, o = 0|
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.5*r
  sleep 0.5
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern28 do |r = 1, o = 0|
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
  play :fs4 + o*12, release: 0.25*r
  sleep 0.25
  play :e4 + o*12, release: 0.75*r
  sleep 0.75
  play :e4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern29 do |r = 1, o = 0|
  play :e4 + o*12, release: 3*r
  sleep 3
  play :g4 + o*12, release: 3*r
  sleep 3
  play :c5 + o*12, release: 3*r
  sleep 3
end

define :pattern30 do |r = 1, o = 0|
  play :c5 + o*12, release: 6
  sleep 6
end

define :pattern31 do |r = 1, o = 0|
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern32 do |r = 1, o = 0|
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :f4 + o*12, release: 3.25*r
  sleep 3.25
  play :g4 + o*12, release: 1.5*r
  sleep 1.5
end

define :pattern33 do |r = 1, o = 0|
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  sleep 0.5
end

define :pattern34 do |r = 1, o = 0|
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern35 do |r = 1, o = 0|
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  sleep 3.5
  play :bb4 + o*12, release: r
  sleep 1
  play :g5 + o*12, release: 3*r
  sleep 3
  play :a5 + o*12, release: 0.5*r
  sleep 0.5
  play :g5 + o*12, release: r
  sleep 1
  play :b5 + o*12, release: 0.5*r
  sleep 0.5
  play :a5 + o*12, release: 1.5*r
  sleep 1.5
  play :g5 + o*12, release: 0.5*r
  sleep 0.5
  play :e5 + o*12, release: 3*r
  sleep 3
  play :g5 + o*12, release: 0.5*r
  sleep 0.5
  play :fs5 + o*12, release: 3.5*r
  sleep 3.5
  sleep 2.5
  play :e5 + o*12, release: 2.5*r
  sleep 2.5
  play :f5 + o*12, release: 6*r
  sleep 6
end

define :pattern36 do |r = 1, o = 0|
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern37 do |r = 1, o = 0|
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern38 do |r = 1, o = 0|
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern39 do |r = 1, o = 0|
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :c5 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern40 do |r = 1, o = 0|
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern41 do |r = 1, o = 0|
  play :b4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern42 do |r = 1, o = 0|
  play :c5 + o*12, release: 4*r
  sleep 4
  play :b4 + o*12, release: 4*r
  sleep 4
  play :a4 + o*12, release: 4*r
  sleep 4
  play :c5 + o*12, release: 4*r
  sleep 4
end

define :pattern43 do |r = 1, o = 0|
  play :f5 + o*12, release: 0.25*r
  sleep 0.25
  play :e5 + o*12, release: 0.25*r
  sleep 0.25
  play :f5 + o*12, release: 0.25*r
  sleep 0.25
  play :e5 + o*12, release: 0.25*r
  sleep 0.25
  play :e5 + o*12, release: 0.5*r
  sleep 0.5
  play :e5 + o*12, release: 0.5*r
  sleep 0.5
  play :e5 + o*12, release: 0.5*r
  sleep 0.5
  play :f5 + o*12, release: 0.25*r
  sleep 0.25
  play :e5 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern44 do |r = 1, o = 0|
  play :f5 + o*12, release: 0.5*r
  sleep 0.5
  play :e5 + o*12, release: r
  sleep 1
  play :e5 + o*12, release: 0.5*r
  sleep 0.5
  play :c5 + o*12, release: r
  sleep 1
end

define :pattern45 do |r = 1, o = 0|
  play :d5 + o*12, release: r
  sleep 1
  play :d5 + o*12, release: r
  sleep 1
  play :g4 + o*12, release: r
  sleep 1
end

define :pattern46 do |r = 1, o = 0|
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :d5 + o*12, release: 0.25*r
  sleep 0.25
  play :e5 + o*12, release: 0.25*r
  sleep 0.25
  play :d5 + o*12, release: 0.25*r
  sleep 0.25
  sleep 0.5
  play :g4 + o*12, release: 0.5*r
  sleep 0.5
  sleep 0.5
  play :g4 + o*12, release: 0.5*r
  sleep 0.5
  sleep 0.5
  play :g4 + o*12, release: 0.5*r
  sleep 0.5
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :d5 + o*12, release: 0.25*r
  sleep 0.25
  play :e5 + o*12, release: 0.25*r
  sleep 0.25
  play :d5 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern47 do |r = 1, o = 0|
  play :d5 + o*12, release: 0.25*r
  sleep 0.25
  play :e5 + o*12, release: 0.25*r
  sleep 0.25
  play :d5 + o*12, release: 0.5*r
  sleep 0.5
end

define :pattern48 do |r = 1, o = 0|
  play :g4 + o*12, release: 6*r
  sleep 6
  play :g4 + o*12, release: 4*r
  sleep 4
  play :f4 + o*12, release: 4*r
  sleep 4
  play :f4 + o*12, release: r
  sleep 1
end

define :pattern49 do |r = 1, o = 0|
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :bb4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :bb4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern50 do |r = 1, o = 0|
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern51 do |r = 1, o = 0|
  play :f4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :bb4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern52 do |r = 1, o = 0|
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
  play :bb4 + o*12, release: 0.25*r
  sleep 0.25
end

define :pattern53 do |r = 1, o = 0|
  play :bb4 + o*12, release: 0.25*r
  sleep 0.25
  play :g4 + o*12, release: 0.25*r
  sleep 0.25
end