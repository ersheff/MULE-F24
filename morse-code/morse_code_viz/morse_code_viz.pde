import spout.*;
import codeanticode.syphon.*;

import netP5.*;
import oscP5.*;

OscP5 oscP5;

Spout spout;
SyphonServer syphon;

ArrayList<Sonar> sonars = new ArrayList<Sonar>();
ArrayList<Ripple> ripples = new ArrayList<Ripple>();

float rotation = 0;

boolean xr = false;
int port = 8400;

int scene = 1;

int w, h;

void settings() {
  if (xr) {
    w = 4752;
    h = 1584;
  }
  else {
    w = 4752/4;
    h = 1584/4;
  }
  size(w, h, P3D);
}

void setup() {
  if (xr) {
    spout = new Spout(this);
    spout.setSenderName("morse_code");
  }
  else syphon = new SyphonServer(this, "morse_code");

  oscP5 = new OscP5(this, 8400);

  sonars.add(new Sonar(width / 3, height / 5, 60, color(255, 100, 100)));
  sonars.add(new Sonar(width / 3 * 2, height / 5, 60, color(100, 255, 100)));
  sonars.add(new Sonar(width / 2, height / 2, 60, color(255)));
  sonars.add(new Sonar(width / 3, height / 5 * 4, 60, color(100, 100, 255)));
  sonars.add(new Sonar(width / 3 * 2, height / 5 * 4, 60, color(255, 255, 100)));
  
  noStroke();
}

void draw() {
  background(0);
  lights();
  
  if (scene == 1) {
    pointLight(200, 200, 200, width/3, height/2, -200);
    pointLight(200, 200, 200, width/3*2, height/2, -200);
  }
  if (scene == 2) {
    sonars.get(0).c = color(255);
    sonars.get(0).x = width/27*22;
    sonars.get(0).y = height/2;
    
    sonars.get(1).c = color(255);
    sonars.get(1).x = width/27*17;
    sonars.get(1).y = height/2;
    
    sonars.get(2).c = color(255);
    sonars.get(2).x = width/27*13.5;
    sonars.get(2).y = height/2;
    
    sonars.get(3).c = color(255);
    sonars.get(3).x = width/27*10;
    sonars.get(3).y = height/2;
    
    sonars.get(4).c = color(255);
    sonars.get(4).x = width/27*5;
    sonars.get(4).y = height/2;
    
    pointLight(0, 0, 255, 0, height/2, 400);
    pointLight(0, 0, 255, width, height/2, 400);
  }
  if (scene == 3) {
    // Apply transformations to skew the plane
    translate(width / 2, height / 2, 0);
    rotateX(rotation); // Rotate around X-axis
    rotation += 0.002;
    rotateY(rotation*0.1); // Rotate around Y-axis
    translate(-width / 2, -height / 2, 0);
    
    sonars.get(0).c = color(50, 150, 50);
    // sonars.get(0).x = width/27*22;
    sonars.get(0).y = height/5*4;
    
    sonars.get(1).c = color(100, 50, 0);
    // sonars.get(1).x = width/27*17;
    sonars.get(1).y = height/5*3;
    
    sonars.get(2).c = color(50, 50, 200);
    // sonars.get(2).x = width/27*13.5;
    // sonars.get(2).y = height/2;
    
    sonars.get(3).c = color(100, 50, 0);
    // sonars.get(3).x = width/27*10;
    sonars.get(3).y = height/5*2;
    
    sonars.get(4).c = color(50, 150, 50);
    // sonars.get(4).x = width/27*5;
    sonars.get(4).y = height/5;
    
    pointLight(255, 255, 255, 0, height/2, 0);
    pointLight(255, 255, 255, width, height/2, 0);
  }
  
  // Disable depth testing before drawing transparent objects
  hint(DISABLE_DEPTH_TEST);
  
  for (int i = ripples.size()-1; i >= 0; i--) {
    Ripple r = ripples.get(i);
    r.grow();
    r.show();
    if (r.a <= 0) {
      ripples.remove(i);
    }
  }
  
  // Re-enable depth testing after drawing transparent objects
  hint(ENABLE_DEPTH_TEST);

  for (Sonar s : sonars) {
    s.update();
    s.show();
  }
  
  if (xr) spout.sendTexture();
  else syphon.sendScreen();
}

void mousePressed() {
  for (Sonar s : sonars) {
    if (dist(mouseX, mouseY, s.x, s.y) < s.r) {
      s.pulse();
      ripples.add(new Ripple(s.x, s.y, 40, s.c));
    }
  }
}

void keyPressed() {
  if (key == '1') {
    scene = 1;
  }
  if (key == '2') {
    scene = 2;
  }
  if (key == '3') {
    scene = 3;
  }
}

void oscEvent(OscMessage message) {
  if(message.checkAddrPattern("/pulse") == true) {
    if(message.checkTypetag("i")) {
      int player = message.get(0).intValue();
      Sonar s = sonars.get(player);
      s.pulse();
      ripples.add(new Ripple(s.x, s.y, 40, s.c));
    }
    if(message.checkTypetag("s")) {
      int player = parseInt(message.get(0).stringValue());
      Sonar s = sonars.get(player);
      s.pulse();
      ripples.add(new Ripple(s.x, s.y, 40, s.c));
    }  
  } 
}

class Ripple {
  float x, y, r;
  int c;
  float a;
  
  Ripple(float x, float y, float r, int c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    this.a = 200;
  }

  void grow() {
    this.r += 10;
    this.a -= 4;
  }

  void show() {
    fill(red(this.c), green(this.c), blue(this.c), this.a);
    ellipse(this.x, this.y, this.r, this.r);
  }
}

class Sonar {
  float x, y, r;
  int c;
  String dir;
  boolean pulsing;
  
  Sonar(float x, float y, float r, int c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    this.dir = "out";
    this.pulsing = false;
  }
  
  void show() {
    pushMatrix();
    translate(this.x, this.y, 0);
    fill(this.c);
    sphere(this.r / 2); // Use sphere instead of ellipse
    popMatrix();
  }
  
  void pulse() {
    this.pulsing = true;
  }
  
  void update() {
    if (this.pulsing) {
      if (this.dir.equals("out")) {
        this.r += 20;
        if (this.r >= 80) {
          this.dir = "in";
        }
      } else if (this.dir.equals("in")) {
        this.r -= 4;
        if (this.r <= 60) {
          this.r = 60;
          this.dir = "out";
          this.pulsing = false;
        }
      }
    }
  }
}
