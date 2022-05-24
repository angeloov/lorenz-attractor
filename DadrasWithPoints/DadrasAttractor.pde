class DadrasAttractor {
  float a, b, c, d, e;
  float x, y, z;
  ArrayList<PVector> points;
  
  DadrasAttractor() {
    a = 3;
    b = 2.7;
    c = 1.7;
    d = 2;
    e = 9;
    
    x = 1.1;
    y = 2.1;
    z = -2;
    
    points = new ArrayList<>();
  }
  
  void update() {
    float dx = (y - a*x + b*y*z) * dt;
    float dy = (c*y - x*z + z) * dt;
    float dz = (d*x*y - e*z) * dt;
    
    x += dx;
    y += dy;
    z += dz;

    points.add(new PVector(x, y, z));
    println(x, y, z);
  }
  
}
