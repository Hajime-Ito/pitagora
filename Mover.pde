class Mover{
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass; 
  float G = 0.0000008;
  Mover(float m, float x, float y){
   mass = m + random(0, 140);
   location = new PVector(x, y);
   velocity = new PVector(0, 0);
   acceleration = new PVector(0, 0);
 }

 void applyForce(PVector force){
   PVector f = PVector.div(force, mass);
   acceleration.add(f);
 }
 
 void update(){
   velocity.add(acceleration);
   velocity.limit(5);
   location.add(velocity);
   acceleration.mult(0);
 }
 float eliX[] = new float[10];
 float eliY[]  = new float[10];
 void display(){   
  // imageMode(CENTER);
 //  noFill();
   noStroke();
  // image(PPlogo,location.x, location.y, 60, 60);
   ellipse(location.x, location.y, 20, 20);
 //  imageMode(CORNER);
 }
 
 void checkEdges(){
 
     if(location.x > width){
      location.x = width;
      velocity.x *= -1 ;

      
    }else if(location.x < 0){
       location.x = 0;
      velocity.x *= -1 ;
      
    }

      if(location.y > height){
       location.y = height;
       velocity.y *= -1 ;   
    
      }else if(location.y < 0){
       velocity.y *= -1 ;
       location.y = 0;
      
      }
     
 }
 

 
 void checkEdgesEL(Bsyuki a1){

      if(a1.location.y> height -5){
       a1.velocity.mult(0);
      }
      
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


}
