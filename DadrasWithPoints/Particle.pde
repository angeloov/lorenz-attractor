final float speed = 0.35;

float componentFX(float x, float y, float z) {  
  return speed * (y - attractor.a*x + attractor.b*y*z);
}

float componentFY(float x, float y, float z) {  
  return speed * (attractor.c*y - x*z + z);
}
float componentFZ(float x, float y, float z) {  
  return speed * (attractor.d*x*y - attractor.e*z);
}

class Particle {
  float x, y, z;
  float r, g, b;
  float h;
  
  Particle(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    
    this.h = 0.01;
    
    this.r = random(0, 255);
    this.g = 0;
    this.b = random(0, 255);
  }
  
  void update() {
    this.x += this.h * componentFX(this.x, this.y, this.z);
    this.y += this.h * componentFY(this.x, this.y, this.z);
    this.z += this.h * componentFZ(this.x, this.y, this.z);
  }
  
  void display() {
    colorMode(RGB);
    stroke(r, g, b);
    point(x, y, z);
  }
}
