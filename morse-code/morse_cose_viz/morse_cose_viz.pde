ArrayList<Sonar> sonars = new ArrayList<Sonar>();
ArrayList<Ripple> ripples = new ArrayList<Ripple>();

void setup() {
  size(3840, 2160);
  sonars.add(new Sonar(width / 4, height / 4, 60, color(255)));
  sonars.add(new Sonar(width / 4 * 3, height / 4, 60, color(255)));
  sonars.add(new Sonar(width / 2, height / 2, 60, color(255)));
  sonars.add(new Sonar(width / 4, height / 4 * 3, 60, color(255)));
  sonars.add(new Sonar(width / 4 * 3, height / 4 * 3, 60, color(255)));
  
  noStroke();
  fullScreen(P3D);
}

void draw() {
  background(0);
  lights();
  
  // Apply transformations to skew the plane
  // translate(width / 2, height / 2, 0);
  rotateX(PI/5.2); // Rotate around X-axis
  // rotateY(PI / 6); // Rotate around Y-axis
  // translate(-width / 2, -height / 2, 0);
  
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
}

void mousePressed() {
  for (Sonar s : sonars) {
    if (dist(mouseX, mouseY, s.x, s.y) < s.r) {
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
    this.a -= 5;
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
    // fill(this.c);
    // ellipse(this.x, this.y, this.r, this.r);
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
