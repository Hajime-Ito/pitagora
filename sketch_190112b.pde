import processing.serial.*;

Bsyuki[]a1 = new Bsyuki[550];
Bsyuki[]a2 = new Bsyuki[a1.length];
Mover m1[] = new Mover[a1.length] ;
Mover []u1 = new Mover[8];
Mover spr;
Mover []m2 = new Mover[a1.length];
Spring s;
Attractor a;
float timecount = 0;

int start = 0;
float x = 0, x1 = 0, y=0, y1=0;
void setup() {
  
  
   if(arduinoOn){
    printArray(Serial.list()); // 使用可能なシリアルポート一覧の出力。デバッグ用
    String portName = Serial.list()[2]; // 使用するシリアルポート名
    serialPort = new Serial(this, portName, 9600);
    serialPort.buffer(inByte.length); // 読み込むバッファの長さをの指定
    initServo();
  }
  
  
  
  size(1366, 768, JAVA2D);

  for (int i = 0; i < a1.length; i++) {
    //  a1[i] = new Bsyuki(0.6, 0, 0, abc[int(random(0, 26))], 0);
    a1[i] = new Bsyuki(0.6, 0, 0, yuki[int(random(0, 3))], 0);
    a2[i] = new Bsyuki(0.6, 0, 0, yuki[int(random(0, 3))], 2);
    m1[i] = new Mover(20, 0, 0);    
    m2[i] = new Mover(20, 0, 0);

    //   font = loadFont("Meiryo-Bold-10.vlw");
    //   textFont(font, 10);
  }
  spr = new Mover(80, 57, -13);
  /*  for(int j = 0; j < u1.length; j++) {
   u1[j] = new Mover(j*4 + 10,width/2 + j*50+ 50, height/2 +j*50 + 50);
   } */
  /*  u1[0] = new Mover(3, width/2+80, height/2 + 50);
   u1[1] = new Mover(48, width/2+160, height/2 + 100);
   u1[2] = new Mover(59, width/2+80*3, height/2 + 150);
   u1[3] = new Mover(6, width/2+80*4, height/2 + 200);
   u1[4] = new Mover(18993, width/2+80*5, height/2 + 250);
   u1[5] = new Mover(5680, width/2+80*6, height/2 + 300);
   u1[6] = new Mover(86, width/2+80*7, height/2 + 350);  
   u1[7] = new Mover(19891000, width/2, height/2);
   */
  s = new Spring(width/2, 0, 150);
  a = new Attractor(width/2-60, 100);
}


void draw() {
  background(28, 31, 63);
  if (mousePressed == true) { 
    start = 1;
  }
  if (start == 1) {
    timecount +=0.01;
    if (timecount < 5) {
      PVector yuki1 = new PVector(0, 0.07);
      PVector wind = new PVector(0.005, 0);
      for (int i = 0; i < a1.length; i++) { 
        if (a1[i].location.y > height || a1[i].location.x > width|| a1[i].location.x < 0) {
          a1[i].checkEdgesyuki();
        }


        a1[i].drawTree(a1[i], 10, 0, 1, 0, 0);
        a1[i].drawTree1(a1[i], 270, 0, 1, 0, 0);
        a1[i].drawTree2(a1[i], 1200, 0, 1, 0, 0);
        a1[i].drawTree3(a1[i], 1000, 0, 1, 0, 0);
        a1[i].drawTree(a1[i], 800, 0, 1, 0, 0);
        a1[i].drawdentou(a1[i], 780, 0, 1, 0, 0); 
        a1[i].drawbigtree(a1[i], 0, -60, 1, 0, 0); 
        a1[i].drawel(a1[i], 240, 150, 1, 0, 0);

        a1[i].applyForce(yuki1);  
        a1[i].applyForce(wind);  

        a1[i].update();
        a1[i].displayABC();
      }
      /* tint(timecount*16, timecount*16);
       image(moon, 57,-13, 380, 330);*/
    } else if (timecount < 80) {
    
      PVector gravity = new PVector(0, 5);
      PVector gravityYuki = new PVector(0, 0.1);

      PVector wind11 = new PVector(0.9, - 0.09);

      for (int i = 0; i < a1.length; i++) {
        PVector force = a.attract(a2[i]);

        //   m1[i].applyForce(wind);
        m1[i].applyForce(gravity);

        m1[i].update();
        int down = int(m1[i].location.y);
  //      int slide = int(m1[i].location.x);
        if (timecount < 15) { 
          a1[i].drawTree(a1[i], 10, 0, 3, 0, down);
          a1[i].drawTree1(a1[i], 270, 0, 3, 0, down);
          a1[i].drawTree2(a1[i], 1200, 0, 3, 0, down);
          a1[i].drawTree3(a1[i], 1000, 0, 3, 0, down);
          a1[i].drawTree(a1[i], 800, 0, 3, 0, down);
          a1[i].drawdentou(a1[i], 780, 0, 3, 0, down); 
          a1[i].drawbigtree(a1[i], 0, -60, 3, 0, down); 
          //  a1[i].drawel(a1[i], 240, 150, 3, 0, down);

          a1[i].applyForce(gravityYuki);

          //  m1[i].checkEdgesEL(a1[i]);
          a1[i].update();

          a1[i].displayABC();
        }
        m2[i].update();
        a1[i].drawel(a1[i], 240, 150, 3, int(m2[i].location.x), int(m2[i].location.y));

        if (m2[i].location.x >  width/2 - 300) {
          //    a2[i].applyForce(gravityYuki);
          m2[i].velocity.mult(0);
          a2[i].applyForce(force);

          if (timecount < 10) {
            a2[i].drawel1(a2[i], width/2 - 60, height - 100, 1, 0, 0);
            a2[i].drawel2(a2[i], width/2 - 60, height - 200, 1, 0, 0);
          } else {

            a2[i].drawel1(a2[i], width/2 - 60, height - 100, 3, int(x), int(y));
            a2[i].drawel2(a2[i], width/2 - 60, height - 200, 3, int(x1), int(y1));
          }
        } else {
          m2[i].applyForce(wind11);
        }

        //    a.display();        


        if (a2[i].location.y > 100 && timecount > 7) {
          a2[i].update();
          a2[i].displayABC();
        }
      }

      if (timecount > 10) {
        x+= 8;
        x1+=6;
        y1-=8;
        y-=8;
        
         if(y < - 780) {
        moveServo1();
      }
      
      if(y1 < -700) {
        moveServo2();
      }
      
      }
      
      
    } else {
    }
    /*else if(timecount < 60){
     PVector gravity = new PVector(0, 0.9);
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
     */
  }
}
