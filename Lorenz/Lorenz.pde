float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 10.0/3.0;
float dt = 0.01;

float theta = 0;
  
ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(800, 600, P3D);
  colorMode(HSB);
}

void draw() {
  background(0);
  
  // a = abs(sin(theta)) * 10; 
  // theta += 0.1;
  
  float dx = (a * (y - x))*dt;
  float dy = (x * (b - z) - y)*dt;
  float dz = (x * y - c * z)*dt;
  
  x += dx;
  y += dy;
  z += dz;
  
  float s = sin(theta)*80;
  theta += 0.1;

  points.add(new PVector(x+s, y+s, z+s));

  translate(width/2, height/2, -width/2);
  scale(10);
  stroke(255);
  noFill();

  float hue = 0;
  beginShape();
  for (PVector v : points) {
    stroke(hue, 255, 255);
    vertex(v.x, v.y,v.z);

    hue += 0.1;
    if (hue > 255)
      hue = 0;
  }
  endShape();

  println(x ,y ,z);
}
