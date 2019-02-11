


class Spring {

  PVector anchor;
  
  float len;
  float k = 0.1;
  
  Spring(float x, float y, float l) {
    anchor = new PVector(x, y);
    len = l;
  }
  
  void connect(Mover b) {
   
    PVector force = PVector.sub(b.location, anchor);
    float d = force.mag();
    float stretch = d - len;
    
    force.normalize();
    force.mult(-1*k*stretch);
    
    b.applyForce(force);
  }
  
  void display() {
    fill(100);
    rectMode(CENTER);
    rect(anchor.x, anchor.y, 50, 50);
  }
  
  void displayLine(Mover b) {
    stroke(255);
    line(b.location.x + 200, b.location.y + 100, anchor.x, anchor.y);
  }
  
}
