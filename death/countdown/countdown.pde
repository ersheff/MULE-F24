int rawSeconds = 420;
int lastOneMillis, lastTenMillis;

void setup() {
  size(1280, 720);
  textAlign(CENTER, CENTER);
  textSize(640);
  lastOneMillis = millis();
  lastTenMillis = lastOneMillis;
  background(0);
  fill(255);
  text("7:00", width/2, height/2);
}

void draw() {
    fill(0);
    for (int i = 0; i < 200; i++) {
      rect(random(width), random(height), random(10)+1, random(10)+1);
    }
  
  if (millis()-lastOneMillis >= 1000) {
    //fill(0);
    //for (int i = 0; i < 200; i++) {
    //  rect(random(width), random(height), random(50)+10, random(50)+10);
    //}
    lastOneMillis = millis();
  }
  
  if (millis()-lastTenMillis >= 10000) {
    rawSeconds-=10;
    int minutes = rawSeconds/60;
    int seconds = rawSeconds%60;
    String timeReadout;
    if (seconds < 10) {
      timeReadout = minutes + ":0" + seconds;
    }
    else timeReadout = minutes + ":" + seconds;
    fill(255);
    text(timeReadout, width/2, height/2);
    lastTenMillis = millis();
    //fill(0);
    //for (int i = 0; i < 200; i++) {
    //  rect(random(width), random(height), random(50)+10, random(50)+10);
    //}
  }
  fill(0,0,0,3);
  rect(0, 0, 1280, 720);
}
