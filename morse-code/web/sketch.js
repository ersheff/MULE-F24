const ws = new WebSocket("ws://localhost:3000?role=visuals");
const sonars = [];
let ripples = [];

function setup() {
  createCanvas(1280, 720);
  sonars[0] = new Sonar(width / 4, height / 4, 40, color(255, 0, 0));
  sonars[1] = new Sonar((width / 4) * 3, height / 4, 40, color(0, 255, 0));
  sonars[2] = new Sonar(width / 2, height / 2, 40, color(0, 0, 255));
  sonars[3] = new Sonar(width / 4, (height / 4) * 3, 40, color(255, 255, 0));
  sonars[4] = new Sonar(
    (width / 4) * 3,
    (height / 4) * 3,
    40,
    color(0, 255, 255)
  );
}

function draw() {
  background(0);
  for (r of ripples) {
    r.grow();
    r.show();
  }
  ripples = ripples.filter((r) => r.a > 0);

  for (s of sonars) {
    s.update();
    s.show();
  }
}

function mousePressed() {
  for (s of sonars) {
    if (dist(mouseX, mouseY, s.x, s.y) < s.r) {
      s.pulse();
      ripples.push(new Ripple(s.x, s.y, 40, s.c));
    }
  }
}

class Ripple {
  constructor(x, y, r, c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    this.a = 255;
  }

  grow() {
    this.r += 8;
    this.a -= 4;
  }

  show() {
    const c = color(red(this.c), green(this.c), blue(this.c), this.a);
    fill(c);
    circle(this.x, this.y, this.r);
  }
}

class Sonar {
  constructor(x, y, r, c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    this.dir = "out";
    this.pulsing = false;
  }
  show() {
    fill(this.c);
    circle(this.x, this.y, this.r);
  }
  pulse() {
    this.pulsing = true;
  }
  update() {
    if (this.pulsing) {
      if (this.dir === "out") {
        this.r += 10;
        if (this.r >= 80) {
          this.dir = "in";
        }
      } else if (this.dir === "in") {
        this.r -= 2;
        if (this.r <= 40) {
          this.r = 40;
          this.dir = "out";
          this.pulsing = false;
        }
      }
    }
  }
}

ws.onmessage = (event) => {
  const data = JSON.parse(event.data);
  const player = data.player;
  const sonar = sonars[player];
  sonar.pulse();
  ripples.push(new Ripple(sonar.x, sonar.y, 40, sonar.c));
};
