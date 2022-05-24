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
  
LorenzAttractor attractor;
ArrayList<Particle> particles;

void addParticle() {
  particles.add( new Particle(random(-width, width), random(-width, width), random(-width, width)) ); 
}

void removeParticles() {
  for (int i = 0; i < 15; i++)
    particles.remove(0); // Remove first
}

void setup() {
  size(800, 600, P3D);
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(80);
  cam.setMaximumDistance(1000);
  
  attractor = new LorenzAttractor();
  particles = new ArrayList<>();
  
  for (int i = 0; i < 5; i++)
    addParticle(); 
}

void draw() {
  background(0);

  translate(0, 0, -100);
  scale(10);
  stroke(255);
  strokeWeight(0.3);
  noFill();
  
  attractor.update();

  // Draw attractor
  colorMode(HSB);

  beginShape();

  for (PVector v : attractor.points) {
    vertex(v.x, v.y, v.z);
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
    
  println("# of particles: " + particles.size())
}
