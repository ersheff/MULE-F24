import netP5.*;
import oscP5.*;
import java.util.HashMap;
import java.util.Arrays;
import java.util.List;
import java.util.LinkedList;

OscP5 oscP5;
HashMap<String, Integer[]> noteToColor;
LinkedList<Dot> allDots = new LinkedList<Dot>();
List<Dot> newDots = new ArrayList<Dot>();
List<Dot> dotsToRemove = new ArrayList<Dot>();

int maxDots = 500;
int dotDim;

int dotOpacity = 255;
float fadeInAmount = 50;
float fadeOutAmount = 3;
float driftMin = -0.05;
float driftMax = 0.05;
float dropMin = 0.05;
float dropMax = 0.2;

void setup() {
  size(1280, 720, P3D);
  dotDim = width/15;
  noStroke();
  oscP5 = new OscP5(this, 7001); // Listen for OSC messages on port 7001
  
  noteToColor = new HashMap<String, Integer[]>();
  noteToColor.put("C", new Integer[] {245, 190, 65});
  noteToColor.put("G", new Integer[] {209, 193, 63});
  noteToColor.put("D", new Integer[] {149, 198, 61});
  noteToColor.put("A", new Integer[] {81, 178, 80});
  noteToColor.put("E", new Integer[] {82, 181, 161});
  noteToColor.put("B", new Integer[] {69, 152, 183});
  noteToColor.put("F#", new Integer[] {78, 97, 216});
  noteToColor.put("C#", new Integer[] {128, 100, 198});
  noteToColor.put("G#", new Integer[] {165, 66, 177});
  noteToColor.put("D#", new Integer[] {234, 55, 131});
  noteToColor.put("A#", new Integer[] {235, 86, 56});
  noteToColor.put("F", new Integer[] {240, 148, 60});
}


void draw() {
  background(0);
  
  // Draw all the circles
  for (Dot dot : allDots) {
    dot.drawAndFade();
    if (dot.shouldRemove()) {
      dotsToRemove.add(dot);
    }
  }
  
  
  allDots.removeAll(dotsToRemove);
  allDots.addAll(newDots);

  while (allDots.size() > maxDots) {
    allDots.removeFirst();
  }
  newDots.clear();
}


void oscEvent(OscMessage msg) {
  for (int i = 0; i < msg.typetag().length(); i++) {
    if (msg.typetag().charAt(i) == 's') {
      String note = msg.get(i).stringValue();
      
      if (noteToColor.containsKey(note)) {
        Integer[] clr = noteToColor.get(note);
    
        float x = random(width);
        float y = random(height);
     
        newDots.add(new Dot(x, y, clr));
      }
    }
  }
}

class Dot {
  float x, y;
  Integer[] clr;
  float alpha;
  boolean fadingIn;
  float driftAmount;
  float dropAmount;

  Dot(float x, float y, Integer[] clr) {
    this.x = x;
    this.y = y;
    this.clr = clr;
    this.alpha = 0;
    this.fadingIn = true;
    this.driftAmount = random(driftMin, driftMax);
    this.dropAmount = random(dropMin, dropMax);
  }
  
  void drawAndFade() {
    color dotColor = color(clr[0], clr[1], clr[2], alpha);
    fill(dotColor);
    ellipse(x, y, dotDim, dotDim);
    if (fadingIn) {
      alpha = min(dotOpacity, alpha + fadeInAmount);
      if (alpha >= dotOpacity) {
        fadingIn = false;
      }
    } else {
      alpha = max(0, alpha - fadeOutAmount);
    }
    x += driftAmount;
    y += dropAmount;
  }

  boolean shouldRemove() {
    return alpha == 0;
  }
}
