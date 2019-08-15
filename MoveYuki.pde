class MoveYuki {
  String txt;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass; 
  
  MoveYuki(String BSstr) {
   txt = BSstr;
   
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  
  
}
