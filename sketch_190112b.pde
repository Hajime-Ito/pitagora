Bsyuki[]a1 = new Bsyuki[700];
Mover []m1 = new Mover[700];
Mover []u1 = new Mover[8];
Mover spr;
Spring s;
Attractor a;
float timecount = 0;

PImage moon;

String[] abc = {"q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "a", "s", "d", "f", "g", "h", "j"
  , "k", "l", "z", "x", "c", "v", "b", "n", "m"}; 
  int start = 0;
void setup() {
size(1366, 768, JAVA2D);
 moon = loadImage("moon.png");
 for(int i = 0; i < a1.length; i++) {
    a1[i] = new Bsyuki(0.6, 0,0, abc[int(random(0, 26))], 0);
    m1[i] = new Mover(20, 0, 0);
  }
    spr = new Mover(80,57,-13);
/*  for(int j = 0; j < u1.length; j++) {
    u1[j] = new Mover(j*4 + 10,width/2 + j*50+ 50, height/2 +j*50 + 50);
  } */
  u1[0] = new Mover(3, width/2+80, height/2 + 50);
  u1[1] = new Mover(48, width/2+160, height/2 + 100);
  u1[2] = new Mover(59, width/2+80*3, height/2 + 150);
  u1[3] = new Mover(6, width/2+80*4, height/2 + 200);
  u1[4] = new Mover(18993,width/2+80*5, height/2 + 250);
  u1[5] = new Mover(5680, width/2+80*6, height/2 + 300);
  u1[6] = new Mover(86, width/2+80*7, height/2 + 350);  
  u1[7] = new Mover(19891000, width/2, height/2);
  
  s = new Spring(width/2, 0, 150);
}


void draw() {
  background(0,0,120);
if(mousePressed == true){ 
  start = 1; 
}
if(start == 1) {
  timecount +=0.01;
if (timecount < 13) {
      PVector yuki1 = new PVector(0, 0.003);
      PVector rightwind = new PVector(0.04, 0.001);
      PVector leftwind = new PVector(-0.008, 0.0005);
      int use, use1;
      for (int i = 0; i < a1.length; i++) { 
        if (a1[i].location.y > height || a1[i].location.x > width || a1[i].location.x < 0 ) {
          a1[i].checkEdgesyuki();
        }

        
          use = 1;
          use1 = 1;
        
        if (timecount > 24) {
          use1 = 0;
        }
        if (timecount > 10 && timecount < 15) {
          a1[i].applyForce(leftwind);
        } else if (timecount > 40&& timecount < 56) {
          a1[i].applyForce(rightwind);
        }

        a1[i].drawTree(a1[i], 10, 0, use,0,0);
        a1[i].drawTree1(a1[i], 270, 0, use1,0,0);
        a1[i].drawTree2(a1[i], 1200, 0, use1,0,0);
        a1[i].drawTree3(a1[i], 1000, 0, use,0,0);
        a1[i].drawTree(a1[i], 800, 0, use1,0,0);
        a1[i].drawdentou(a1[i], 780, 0, use,0,0); 
        a1[i].drawbigtree(a1[i], 0, -60, use1,0,0); 
        a1[i].drawel(a1[i], 240, 150, use, 0, 0);

        a1[i].applyForce(yuki1);  

        a1[i].update();
        a1[i].displayABC();
      }
     /* tint(timecount*16, timecount*16);
      image(moon, 57,-13, 380, 330);*/
    } else if(timecount < 22) {
      PVector wind = new PVector(0.4, 0.05);
      PVector gravity = new PVector(0, 0.3);
      PVector gravityYuki = new PVector(0,0.001);
      
      for (int i = 0; i < a1.length; i++) {
      m1[i].applyForce(wind);
      m1[i].applyForce(gravity);
      
      m1[i].update();
      int down = int(m1[i].location.y);
        a1[i].drawel(a1[0], 240, 150, 3, 0, 0);
        
        a1[i].drawTree(a1[i], 10, 0, 3,0,down);
        a1[i].drawTree1(a1[i], 270, 0, 3,0,down);
        a1[i].drawTree2(a1[i], 1200, 0, 3,0,down);
        a1[i].drawTree3(a1[i], 1000, 0, 3,0,down);
        a1[i].drawTree(a1[i], 800, 0, 3,0,down);
        a1[i].drawdentou(a1[i], 780, 0, 3,0,down); 
        a1[i].drawbigtree(a1[i], 0, -60, 3,0,down); 
      //  a1[i].drawel(a1[i], 240, 150, 3, 0, down);
        
        a1[i].applyForce(gravityYuki);
       
        m1[i].checkEdgesEL(a1[i]);
        a1[i].update();
        a1[i].displayABC();
      }
    /*  tint(timecount*16, timecount*16);
      image(moon, 57,-13, 380, 330); */
    } else if(timecount < 60){
      PVector gravity = new PVector(0, 0.5);
      spr.applyForce(gravity);      
      spr.update();
      s.displayLine(spr);
      s.connect(spr);
     
      for(int i = 0; i < a1.length; i++) {   
      a1[i].drawel(a1[0], 240, 150, 3, int(spr.location.x), int(spr.location.y));     
      }
    }else{
     // a = new Attractor(width/2, height/2);
     // a.display();
      
      for(int i = 0; i < u1.length; i++) {
        for(int j = 0; j < u1.length; j++) {
          if(i != j) {
            PVector force = u1[j].attract(u1[i]);
            u1[i].applyForce(force);
       //     PVector sun = a.attract(u1[i]);
        //    u1[i].applyForce(sun);
          }
        }
        
       
        u1[i].update();
        u1[i].display();
        stroke(200);
        line(width/2, height/2, u1[i].location.x, u1[i].location.y);
      }
    }
}
}
