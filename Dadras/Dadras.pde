import peasy.*;

PeasyCam cam;

float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 10.0/3.0;
float dt = 0.01;

float theta = 0;
  
DadrasAttractor attractor;

void setup() {
  size(800, 600, P3D);
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(80);
  cam.setMaximumDistance(1000);
  
  attractor = new DadrasAttractor();
}

void draw() {
  background(0);

  translate(0, 0, -100);
  scale(10);
  strokeWeight(0.3);
  noFill();
  
  attractor.update();

  // Draw attractor
  colorMode(HSB);
  float hue = 0;

  beginShape();
  
  for (PVector v : attractor.points) {
    stroke(hue, 255, 255);
    vertex(v.x, v.y, v.z);
    
    hue += 1;
    if (hue > 255)
      hue = 0;
  }

  endShape();
}
