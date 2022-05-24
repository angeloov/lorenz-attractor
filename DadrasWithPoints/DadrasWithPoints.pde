import peasy.*;

PeasyCam cam;

float dt = 0.01;
  
DadrasAttractor attractor;
ArrayList<Particle> particles;

void addParticle() {
  particles.add( new Particle(random(-5, 5), random(-5, 5), random(-5, 5)) ); 
}

void setup() {
  size(800, 600, P3D);
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(1000);
  
  attractor = new DadrasAttractor();
  particles = new ArrayList<>();
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
  
  // Draw particles
  for (Particle p : particles) {
    p.update();
    p.display();
  }
  
  // Add/remove particles from simulation
  if (particles.size() < 2000) 
    addParticle();
    
  println("# of particles: " + particles.size());
}
