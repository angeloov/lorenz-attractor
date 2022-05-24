class LorenzAttractor {
  float a, b, c;
  float x, y, z;
  ArrayList<PVector> points;

  LorenzAttractor() {
    a = 10;
    b = 28;
    c = 10.0/3.0;
    
    x = 0.01;
    y = 0;
    z = 0;
    
    points = new ArrayList<>();
  }
  
  void update() {
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;
    
    x += dx;
    y += dy;
    z += dz;

    points.add(new PVector(x, y, z));
  }
  
}
