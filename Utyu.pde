class Attractor {
  float mass;
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float G;
  
  Attractor(float x, float y) {
    location = new PVector(x, y);
    mass = 40;
    G = 0.4;
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();
    float strength = (G * mass * m.mass)/(distance*distance);
    force.mult(strength);
    
    return force;
  }
  
  
  
  
  void display() {
  
    stroke(0);
    fill(250);
    ellipse(location.x, location.y, 20, 20);
  }
}
