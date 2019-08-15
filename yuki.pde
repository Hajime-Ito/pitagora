int pointtreeC = 0;
String yuki[] = {"+", "*", "x" };

class Bsyuki {
  int time = 0;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass; 
  String txt;
  int Abc;
  

  Bsyuki(float m, float x, float y, String BSstr, int abc) {
    Abc = abc;
    mass = m + random(1.5, 4.7);

    if (abc == 1) {
      location = new PVector(x, y);
    } else if (abc ==0) {
      location = new PVector(int(random(0, 1367)), random(-130, 0));
    } else if(abc == 2) {
     
      location = new PVector(int(random(0,width)), int(random(height+5,height+30)) );
    }
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    txt = BSstr;
    textSize(10);
  }
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);

    location.add(velocity);
    acceleration.mult(0);
  }
  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }
    if (location.y > height) {
      location.y = height ;
      velocity.y *= -1;
    }
    velocity.mult(0.9992);
  }

  void checkEdges2() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }
    if (location.y > height) {
      location.y = height ;
      velocity.mult(0.01);
    }
    velocity.mult(0.9992);
  }

  void checkEdgesEL(Mover m) {

   
    if (m.location.y> height -5) {
      m.velocity.mult(0);
    }
  }

  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  void displayABC() {
    fill(250);
    textSize(11.5);
    if(Abc == 2){
    fill(250);
    }else{
    
    fill(random(255),random(255),random(255));
    
    }
    text(txt, location.x, location.y);
    fill(250);
  }

  void checkEdgesyuki() {
  if (location.x > width +2) {
      location.x = 0;
    } else if (location.x < -2) {
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    }
    
  }
  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  boolean checkTree(Bsyuki s1, int x, int y, float stop) { 
    if (stop == 1) {
      if (s1.location.x > x - 5 && s1.location.x < x + 5 && s1.location.y > y  - 1 && s1.location.y < y + 1) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  boolean checkEli(Bsyuki s1, float x, float y, float stop) { 
    if (stop == 1) {
      if (s1.location.x > x - 6 && s1.location.x < x + 6 && s1.location.y > y  - 1 && s1.location.y < y + 1) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }



  int pointtreeX[] = new int[145];
  int pointtreeY[] = new int[145];

  void BCtree(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {

    for (int i = 0; i < 25; i++) {          //木の幹
      if (checkTree(s1, 100+X, height-i*10+Y, use)) {
        pointtreeX[i] =  100+X;
        pointtreeY[i] = height- i*10+Y;
      }
    }
    for (int i = 25; i < 40; i++) {      //右へ生えてる枝
      int a = i -25;
      if (checkTree(s1, (100)+a*10+X, (height-24*10) - a*10+Y, use)) {
        pointtreeX[i] =  (100)+a*10+X;
        pointtreeY[i] = (height-24*10) - a*10+Y;
      }
    }
    for (int i = 40; i < 55; i++) {    //左へ生えてる枝
      int a = i -40;
      if (checkTree(s1, (100)-a*10+X, (height-24*10) - a*10+Y, use)) {
        pointtreeX[i] =  (100)-a*10+X;
        pointtreeY[i] = (height-24*10) - a*10+Y;
      }
    }
    for (int i = 55; i < 70; i++) {     //右から生えてる枝から左上に生えてる枝
      int a = i -55;
      if (checkTree(s1, (100+50)-a*5+X, (height-24*10-50) - a*10+Y, use)) {
        pointtreeX[i] =  (100+50)-a*5+X;
        pointtreeY[i] = (height-24*10-50) - a*10+Y;
      }
    }
    for (int i = 70; i < 85; i++) {   //左から生えてる枝から右上へ生えてる枝
      int a = i - 70;
      if (checkTree(s1, (100-40)+a*5+X, (height-24*10-40) - a*10+Y, use)) {
        pointtreeX[i] =  (100-40)+a*5+X;
        pointtreeY[i] = (height-24*10-40) - a*10+Y;
      }
    }
    for (int i = 85; i < 95; i++) {  //右から生えてる枝から右下へ生えてる枝
      int a = i - 85;
      if (checkTree(s1, (100+70)+a*12+X, (height-24*10-70) + a*8+Y, use)) {
        pointtreeX[i] =  (100+70)+a*12+X;
        pointtreeY[i] = (height-24*10-70) + a*8+Y;
      }
    }
    for (int i = 95; i < 105; i++) {   //左から生えてる枝から左下へ生えてる枝
      int a = i - 95;
      if (checkTree(s1, (100-60)-a*7+X, (height-24*10-60) + a*7+Y, use)) {
        pointtreeX[i] =  (100-60)-a*7+X;
        pointtreeY[i] = (height-24*10-60) + a*7+Y;
      }
    }
    for (int i = 105; i < 115; i++) {     //左から生えてる枝から左上に生えてる枝
      int a = i - 105;
      if (checkTree(s1, (100-60)-a*6+X, (height-24*10-60) - a*10+Y, use)) {
        pointtreeX[i] =  (100-60)-a*6+X;
        pointtreeY[i] = (height-24*10-60) - a*10+Y;
      }
    }
    for (int i = 115; i < 125; i++) {   //左から生えてる枝から右上へ生えてる枝から左上に生えてる枝
      int a = i - 115;
      if (checkTree(s1, (100-40+20)-a*5+X, (height-24*10-40-40) - a*10+Y, use)) {
        pointtreeX[i] =  (100-40+20)-a*5+X;
        pointtreeY[i] = (height-24*10-40-40) - a*10+Y;
      }
    }
    for (int i = 125; i < 135; i++) {     //右から生えてる枝から右上に生えてる枝
      int a = i -125;
      if (checkTree(s1, (100+50+35)+a*5+X, (height-24*10-50-50) - a*10+Y, use)) {
        pointtreeX[i] =  (100+50+35)+a*5+X;
        pointtreeY[i] = (height-24*10-50-50) - a*10+Y;
      }
    }
    for (int i = 135; i < 145; i++) {     //右から生えてる枝から左上に生えてる枝
      int a = i -135;
      if (checkTree(s1, (100+50-10)+a*7+X, (height-24*10-50-30) - a*10+Y, use)) {
        pointtreeX[i] =  (100+50-10)+a*7+X;
        pointtreeY[i] = (height-24*10-50-30) - a*10+Y;
      }
    }
    for (int j = 0; j < pointtreeX.length; j++) {
      if (pointtreeX[j] != 0 && pointtreeY[j] != 0) {
       //  fill(random(255),random(255),random(255));
        text(txt, pointtreeX[j] + locaX, pointtreeY[j]+locaY);
      }
    }
  
  }


  void drawTree(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
    if (use == 3) {
      BCtree(s1, X, Y, 0, int(locaX), int(locaY));
    } else {
      if (s1.location.x > -40 + X && s1.location.x  < 340 + X && s1.location.y > height - 430 - Y &&
        s1.location.y < (height-24*10-60) + 9*7+Y || s1.location.x > 96 + X && s1.location.x < 105 + X && 
        s1.location.y > height- 24*10+Y && s1.location.y < height + Y) {
        BCtree(s1, X, Y, use, 0, 0);
      } else {
        BCtree(s1, X, Y, 0, 0, 0);
      }
    }
  }
  int pointtreeX1[] = new int[145];
  int pointtreeY1[] = new int[145];

  void BCtree1(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
    //  PVector upwind = new PVector(0, -0.008);
    //     s1.applyForce(upwind);

    for (int i = 0; i < 25; i++) {          //木の幹
      if (checkTree(s1, 100+X, height-i*10+Y, use)) {
        pointtreeX1[i] =  100+X;
        pointtreeY1[i] = height- i*10+Y;
      }
    }
    for (int i = 25; i < 40; i++) {      //右へ生えてる枝
      int a = i -25;
      if (checkTree(s1, (100)+a*10+X, (height-24*10) - a*10+Y, use)) {
        pointtreeX1[i] =  (100)+a*10+X;
        pointtreeY1[i] = (height-24*10) - a*10+Y;
      }
    }
    for (int i = 40; i < 55; i++) {    //左へ生えてる枝
      int a = i -40;
      if (checkTree(s1, (100)-a*10+X, (height-24*10) - a*10+Y, use)) {
        pointtreeX1[i] =  (100)-a*10+X;
        pointtreeY1[i] = (height-24*10) - a*10+Y;
      }
    }
    for (int i = 55; i < 70; i++) {     //右から生えてる枝から左上に生えてる枝
      int a = i -55;
      if (checkTree(s1, (100+50)-a*5+X, (height-24*10-50) - a*10+Y, use)) {
        pointtreeX1[i] =  (100+50)-a*5+X;
        pointtreeY1[i] = (height-24*10-50) - a*10+Y;
      }
    }
    for (int i = 70; i < 85; i++) {   //左から生えてる枝から右上へ生えてる枝
      int a = i - 70;
      if (checkTree(s1, (100-40)+a*5+X, (height-24*10-40) - a*10+Y, use)) {
        pointtreeX1[i] =  (100-40)+a*5+X;
        pointtreeY1[i] = (height-24*10-40) - a*10+Y;
      }
    }
    for (int i = 85; i < 95; i++) {  //右から生えてる枝から右下へ生えてる枝
      int a = i - 85;
      if (checkTree(s1, (100+70)+a*12+X, (height-24*10-70) + a*8+Y, use)) {
        pointtreeX1[i] =  (100+70)+a*12+X;
        pointtreeY1[i] = (height-24*10-70) + a*8+Y;
      }
    }
    for (int i = 95; i < 105; i++) {   //左から生えてる枝から左下へ生えてる枝
      int a = i - 95;
      if (checkTree(s1, (100-60)-a*7+X, (height-24*10-60) + a*7+Y, use)) {
        pointtreeX1[i] =  (100-60)-a*7+X;
        pointtreeY1[i] = (height-24*10-60) + a*7+Y;
      }
    }
    for (int i = 105; i < 115; i++) {     //左から生えてる枝から左上に生えてる枝
      int a = i - 105;
      if (checkTree(s1, (100-60)-a*6+X, (height-24*10-60) - a*10+Y, use)) {
        pointtreeX1[i] =  (100-60)-a*6+X;
        pointtreeY1[i] = (height-24*10-60) - a*10+Y;
      }
    }
    for (int i = 115; i < 125; i++) {   //左から生えてる枝から右上へ生えてる枝から左上に生えてる枝
      int a = i - 115;
      if (checkTree(s1, (100-40+20)-a*5+X, (height-24*10-40-40) - a*10+Y, use)) {
        pointtreeX1[i] =  (100-40+20)-a*5+X;
        pointtreeY1[i] = (height-24*10-40-40) - a*10+Y;
      }
    }
    for (int i = 125; i < 135; i++) {     //右から生えてる枝から右上に生えてる枝
      int a = i -125;
      if (checkTree(s1, (100+50+35)+a*5+X, (height-24*10-50-50) - a*10+Y, use)) {
        pointtreeX1[i] =  (100+50+35)+a*5+X;
        pointtreeY1[i] = (height-24*10-50-50) - a*10+Y;
      }
    }
    for (int i = 135; i < 145; i++) {     //右から生えてる枝から左上に生えてる枝
      int a = i -135;
      if (checkTree(s1, (100+50-10)+a*7+X, (height-24*10-50-30) - a*10+Y, use)) {
        pointtreeX1[i] =  (100+50-10)+a*7+X;
        pointtreeY1[i] = (height-24*10-50-30) - a*10+Y;
      }
    }
    for (int j = 0; j < pointtreeX.length; j++) {
      if (pointtreeX1[j] != 0 && pointtreeY1[j] != 0) {
        text(txt, pointtreeX1[j] + locaX, pointtreeY1[j] + locaY);
      }
    }
  }
  void drawTree1(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
    if (use == 3) {
      BCtree1(s1, X, Y, 0, int(locaX), int(locaY));
    } else {
      if (s1.location.x > -40 + X && s1.location.x  < 340 + X && s1.location.y > height - 430 - Y &&
        s1.location.y < (height-24*10-60) + 9*7+Y || s1.location.x > 96 + X && s1.location.x < 105 + X && 
        s1.location.y > height- 24*10+Y && s1.location.y < height + Y) {
        BCtree1(s1, X, Y, use, 0, 0);
      } else {
        BCtree1(s1, X, Y, 0, 0, 0);
      }
    }
  }

  int pointtreeX2[] = new int[145];
  int pointtreeY2[] = new int[145];

  void BCtree2(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
    //  PVector upwind = new PVector(0, -0.008);
    //     s1.applyForce(upwind);

    for (int i = 0; i < 25; i++) {          //木の幹
      if (checkTree(s1, 100+X, height-i*10+Y, use)) {
        pointtreeX2[i] =  100+X;
        pointtreeY2[i] = height- i*10+Y;
      }
    }
    for (int i = 25; i < 40; i++) {      //右へ生えてる枝
      int a = i -25;
      if (checkTree(s1, (100)+a*10+X, (height-24*10) - a*10+Y, use)) {
        pointtreeX2[i] =  (100)+a*10+X;
        pointtreeY2[i] = (height-24*10) - a*10+Y;
      }
    }
    for (int i = 40; i < 55; i++) {    //左へ生えてる枝
      int a = i -40;
      if (checkTree(s1, (100)-a*10+X, (height-24*10) - a*10+Y, use)) {
        pointtreeX2[i] =  (100)-a*10+X;
        pointtreeY2[i] = (height-24*10) - a*10+Y;
      }
    }
    for (int i = 55; i < 70; i++) {     //右から生えてる枝から左上に生えてる枝
      int a = i -55;
      if (checkTree(s1, (100+50)-a*5+X, (height-24*10-50) - a*10+Y, use)) {
        pointtreeX2[i] =  (100+50)-a*5+X;
        pointtreeY2[i] = (height-24*10-50) - a*10+Y;
      }
    }
    for (int i = 70; i < 85; i++) {   //左から生えてる枝から右上へ生えてる枝
      int a = i - 70;
      if (checkTree(s1, (100-40)+a*5+X, (height-24*10-40) - a*10+Y, use)) {
        pointtreeX2[i] =  (100-40)+a*5+X;
        pointtreeY2[i] = (height-24*10-40) - a*10+Y;
      }
    }
    for (int i = 85; i < 95; i++) {  //右から生えてる枝から右下へ生えてる枝
      int a = i - 85;
      if (checkTree(s1, (100+70)+a*12+X, (height-24*10-70) + a*8+Y, use)) {
        pointtreeX2[i] =  (100+70)+a*12+X;
        pointtreeY2[i] = (height-24*10-70) + a*8+Y;
      }
    }
    for (int i = 95; i < 105; i++) {   //左から生えてる枝から左下へ生えてる枝
      int a = i - 95;
      if (checkTree(s1, (100-60)-a*7+X, (height-24*10-60) + a*7+Y, use)) {
        pointtreeX2[i] =  (100-60)-a*7+X;
        pointtreeY2[i] = (height-24*10-60) + a*7+Y;
      }
    }
    for (int i = 105; i < 115; i++) {     //左から生えてる枝から左上に生えてる枝
      int a = i - 105;
      if (checkTree(s1, (100-60)-a*6+X, (height-24*10-60) - a*10+Y, use)) {
        pointtreeX2[i] =  (100-60)-a*6+X;
        pointtreeY2[i] = (height-24*10-60) - a*10+Y;
      }
    }
    for (int i = 115; i < 125; i++) {   //左から生えてる枝から右上へ生えてる枝から左上に生えてる枝
      int a = i - 115;
      if (checkTree(s1, (100-40+20)-a*5+X, (height-24*10-40-40) - a*10+Y, use)) {
        pointtreeX2[i] =  (100-40+20)-a*5+X;
        pointtreeY2[i] = (height-24*10-40-40) - a*10+Y;
      }
    }
    for (int i = 125; i < 135; i++) {     //右から生えてる枝から右上に生えてる枝
      int a = i -125;
      if (checkTree(s1, (100+50+35)+a*5+X, (height-24*10-50-50) - a*10+Y, use)) {
        pointtreeX2[i] =  (100+50+35)+a*5+X;
        pointtreeY2[i] = (height-24*10-50-50) - a*10+Y;
      }
    }
    for (int i = 135; i < 145; i++) {     //右から生えてる枝から左上に生えてる枝
      int a = i -135;
      if (checkTree(s1, (100+50-10)+a*7+X, (height-24*10-50-30) - a*10+Y, use)) {
        pointtreeX2[i] =  (100+50-10)+a*7+X;
        pointtreeY2[i] = (height-24*10-50-30) - a*10+Y;
      }
    }
    for (int j = 0; j < pointtreeX.length; j++) {
      if (pointtreeX2[j] != 0 && pointtreeY2[j] != 0) {
        text(txt, pointtreeX2[j] + locaX, pointtreeY2[j] + locaY);
      }
    }
  }


  void drawTree2(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
    if (use == 3) {
      BCtree2(s1, X, Y, 0, int(locaX), int(locaY));
    } else {
      if (s1.location.x > -40 + X && s1.location.x  < 340 + X && s1.location.y > height - 430 - Y &&
        s1.location.y < (height-24*10-60) + 9*7+Y || s1.location.x > 96 + X && s1.location.x < 105 + X && 
        s1.location.y > height- 24*10+Y && s1.location.y < height + Y) {
        BCtree2(s1, X, Y, use, 0, 0);
      } else {
        BCtree2(s1, X, Y, 0, 0, 0);
      }
    }
  }

  int pointtree3X[] = new int[145];
  int pointtree3Y[] = new int[145];

  void BCtree3(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
    //  PVector upwind = new PVector(0, -0.008);
    //     s1.applyForce(upwind);

    for (int i = 0; i < 25; i++) {          //木の幹
      if (checkTree(s1, 100+X, height-i*10+Y, use)) {
        pointtree3X[i] =  100+X;
        pointtree3Y[i] = height- i*10+Y;
      }
    }
    for (int i = 25; i < 40; i++) {      //右へ生えてる枝
      int a = i -25;
      if (checkTree(s1, (100)+a*10+X, (height-24*10) - a*10+Y, use)) {
        pointtree3X[i] =  (100)+a*10+X;
        pointtree3Y[i] = (height-24*10) - a*10+Y;
      }
    }
    for (int i = 40; i < 55; i++) {    //左へ生えてる枝
      int a = i -40;
      if (checkTree(s1, (100)-a*10+X, (height-24*10) - a*10+Y, use)) {
        pointtree3X[i] =  (100)-a*10+X;
        pointtree3Y[i] = (height-24*10) - a*10+Y;
      }
    }
    for (int i = 55; i < 70; i++) {     //右から生えてる枝から左上に生えてる枝
      int a = i -55;
      if (checkTree(s1, (100+50)-a*5+X, (height-24*10-50) - a*10+Y, use)) {
        pointtree3X[i] =  (100+50)-a*5+X;
        pointtree3Y[i] = (height-24*10-50) - a*10+Y;
      }
    }
    for (int i = 70; i < 85; i++) {   //左から生えてる枝から右上へ生えてる枝
      int a = i - 70;
      if (checkTree(s1, (100-40)+a*5+X, (height-24*10-40) - a*10+Y, use)) {
        pointtree3X[i] =  (100-40)+a*5+X;
        pointtree3Y[i] = (height-24*10-40) - a*10+Y;
      }
    }
    for (int i = 85; i < 95; i++) {  //右から生えてる枝から右下へ生えてる枝
      int a = i - 85;
      if (checkTree(s1, (100+70)+a*12+X, (height-24*10-70) + a*8+Y, use)) {
        pointtree3X[i] =  (100+70)+a*12+X;
        pointtree3Y[i] = (height-24*10-70) + a*8+Y;
      }
    }
    for (int i = 95; i < 105; i++) {   //左から生えてる枝から左下へ生えてる枝
      int a = i - 95;
      if (checkTree(s1, (100-60)-a*7+X, (height-24*10-60) + a*7+Y, use)) {
        pointtree3X[i] =  (100-60)-a*7+X;
        pointtree3Y[i] = (height-24*10-60) + a*7+Y;
      }
    }
    for (int i = 105; i < 115; i++) {     //左から生えてる枝から左上に生えてる枝
      int a = i - 105;
      if (checkTree(s1, (100-60)-a*6+X, (height-24*10-60) - a*10+Y, use)) {
        pointtree3X[i] =  (100-60)-a*6+X;
        pointtree3Y[i] = (height-24*10-60) - a*10+Y;
      }
    }
    for (int i = 115; i < 125; i++) {   //左から生えてる枝から右上へ生えてる枝から左上に生えてる枝
      int a = i - 115;
      if (checkTree(s1, (100-40+20)-a*5+X, (height-24*10-40-40) - a*10+Y, use)) {
        pointtree3X[i] =  (100-40+20)-a*5+X;
        pointtree3Y[i] = (height-24*10-40-40) - a*10+Y;
      }
    }
    for (int i = 125; i < 135; i++) {     //右から生えてる枝から右上に生えてる枝
      int a = i -125;
      if (checkTree(s1, (100+50+35)+a*5+X, (height-24*10-50-50) - a*10+Y, use)) {
        pointtree3X[i] =  (100+50+35)+a*5+X;
        pointtree3Y[i] = (height-24*10-50-50) - a*10+Y;
      }
    }
    for (int i = 135; i < 145; i++) {     //右から生えてる枝から左上に生えてる枝
      int a = i -135;
      if (checkTree(s1, (100+50-10)+a*7+X, (height-24*10-50-30) - a*10+Y, use)) {
        pointtree3X[i] =  (100+50-10)+a*7+X;
        pointtree3Y[i] = (height-24*10-50-30) - a*10+Y;
      }
    }
    for (int j = 0; j < pointtreeX.length; j++) {
      if (pointtree3X[j] != 0 && pointtree3Y[j] != 0) {
        text(txt, pointtree3X[j] + locaX, pointtree3Y[j]+ locaY);
      }
    }
  }


  void drawTree3(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
    if (use == 3) {
      BCtree3(s1, X, Y, 0, int(locaX), int(locaY));
    } else {
      if (s1.location.x > -40 + X && s1.location.x  < 340 + X && s1.location.y > height - 430 - Y &&
        s1.location.y < (height-24*10-60) + 9*7+Y || s1.location.x > 96 + X && s1.location.x < 105 + X && 
        s1.location.y > height- 24*10+Y && s1.location.y < height + Y) {
        BCtree3(s1, X, Y, use, 0, 0);
      } else {
        BCtree3(s1, X, Y, 0, 0, 0);
      }
    }
  }


  int pointdentouX[] = new int[48];
  int pointdentouY[] = new int[48];

  void BCdentou(Bsyuki s1, int X, int Y, int use, int locaX, int locaY  ) {
    for (int i = 0; i < 24; i++) {
      int a = i;
      if (checkTree(s1, 0+X, height - 10*a+Y, use)) { // 柱
        pointdentouX[i] =  X;
        pointdentouY[i] = height - a*10+Y;
      }
    }
    for (int i = 24; i < 28; i++) {
      int a = i - 24;
      if (checkTree(s1, 0+X - 20 + a*10, height - 10*23+Y, use)) { // 電灯の下
        pointdentouX[i] =  X -20 + a*10 ;
        pointdentouY[i] = height - 23*10+Y;
      }
    }
    for (int i = 28; i < 31; i++) {
      int a = i - 28;
      if (checkTree(s1, 0+X - 20, height - 10*23+ - a*10 +Y, use)) { // 電灯の左
        pointdentouX[i] =  X -20 ;
        pointdentouY[i] = height - 23*10 - a*10+Y;
      }
    }
    for (int i = 31; i < 34; i++) {
      int a = i - 31;
      if (checkTree(s1, 0+X + 20, height - 10*23+ - a*10 +Y, use)) { // 電灯の右
        pointdentouX[i] =  X + 20 ;
        pointdentouY[i] = height - 23*10 - a*10+Y;
      }
    }
    for (int i = 34; i < 39; i++) {
      int a = i - 34;
      if (checkTree(s1, 0+X - 35 + a*10, height - 23*10-2*10 - a*12 +Y+5, use)) { // 電灯の上の左半分
        pointdentouX[i] =  X - 35 + a*10 ;
        pointdentouY[i] = height - 23*10 - 2*10 - a*12+Y+5;
      }
    }
    for (int i = 39; i < 44; i++) {
      int a = i - 39;
      if (checkTree(s1, 0+X + 35 - a*10, height - 10*23-2*10 -a*12 +Y+5, use)) { // 柱
        pointdentouX[i] =  X + 35 - a*10 ;
        pointdentouY[i] = height - 23*10 - 2*10 - a*12+Y+5;
      }
    }

    for (int j = 0; j < pointdentouX.length; j++) {

      if (pointdentouX[j] != 0 && pointdentouY[j] != 0 ) {
        text(txt, pointdentouX[j] + locaX, pointdentouY[j] + locaY);
      }
    }
  }
  void drawdentou(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
    if (use == 3) {
      BCdentou(s1, X, Y, 0, int(locaX), int(locaY));
    } else { 
      if (s1.location.x > -40 + X && s1.location.x  < 40 + X && s1.location.y > height - 300 - Y && s1.location.y < height -Y) {
        BCdentou(s1, X, Y, use, 0, 0);
      } else {
        BCdentou(s1, X, Y, 0, 0, 0);
      }
    }
  }

  int bigtreeX[] = new int[390];
  int bigtreeY[] = new int[390];
  void bigtree(Bsyuki s1, int X, int Y, int use, int locaX, int locaY  ) {
    for (int i = 0; i < 55; i++) {
      if (checkTree(s1, width - i*10 + X, 350 - i*3+ Y, use)) { //右から生えてくる枝の幹の一番上の段
        bigtreeX[i] = width - i*10 + X;
        bigtreeY[i] = 350 - i*3 + Y;
      }
    }
    for (int i = 55; i < 100; i++) {
      int a = i -55;
      if (checkTree(s1, width - a*10 + X, 360 - a*3+ Y, use)) { 
        bigtreeX[i] = width - a*10 + X;
        bigtreeY[i] = 360 - a*3 + Y;
      }
    }
    for (int i = 100; i < 135; i++) {
      int a = i - 100;
      if (checkTree(s1, width - a*10 + X, 370 - a*3+ Y, use)) { 
        bigtreeX[i] = width - a*10 + X;
        bigtreeY[i] = 370 - a*3 + Y;
      }
    }
    for (int i = 135; i < 160; i++) {
      int a = i - 135;
      if (checkTree(s1, width - a*10 + X, 370 - a*3+ Y, use)) { 
        bigtreeX[i] = width - a*10 + X;
        bigtreeY[i] = 380 - a*3 + Y;
      }
    }
    for (int i = 160; i < 190; i++) {   //下の枝の一番下の段
      int a = i - 160;
      if (checkTree(s1, width - 24*10 - a * 10+ X, 370 - 24*3+ a*5+ Y, use)) { 
        bigtreeX[i] = width - 24*10 - a*10+ X;
        bigtreeY[i] = 370 - 24*3 + a*5 + Y;
      }
    }
    for (int i = 190; i < 210; i++) {//それの真ん中の段
      int a = i - 190;
      if (checkTree(s1, width - 25*10 - a * 10+ X, 360 - 23*3+ a*5+ Y, use)) { 
        bigtreeX[i] = width - 25*10 - a*10+ X;
        bigtreeY[i] = 360 - 23*3 + a*5 + Y;
      }
    }
    for (int i = 210; i < 220; i++) {//それの一番下の段
      int a = i - 210;
      if (checkTree(s1, width - 26*10 - a*10+ X, 350 - 22*3+ a*5+ Y, use)) { 
        bigtreeX[i] = width - 26*10 - a*10+ X;
        bigtreeY[i] = 350 - 22*3 + a*5 + Y;
      }
    }
    for (int i = 220; i < 230; i++) {
      int a = i -220;
      if (checkTree(s1, width - 40*10 - a*10+ X, 350 - 40*3 - a*10+Y, use)) { //幹の先端あたりから左上に向けて生えてる枝
        bigtreeX[i] = width - 40*10 - a*10+ X;
        bigtreeY[i] = 350 - 40*3 - a*10 + Y;
      }
    }
    for (int i = 230; i < 240; i++) {
      int a = i -230;
      if (checkTree(s1, width - 40*10 + 20 - a*10+ X, 360 - 40*3 - a*10+Y, use)) { //幹の先端あたりから左上に向けて生えてる枝
        bigtreeX[i] = width - 40*10+20 - a*10+ X;
        bigtreeY[i] = 360 - 40*3 - a*10 + Y;
      }
    }
    for (int i = 240; i < 260; i++) {   //幹から生える上の枝の一番下の段
      int a = i - 240;
      if (checkTree(s1, width - 22*10 - a * 10+ X, 350 - 22*3 - a*9+ Y, use)) { 
        bigtreeX[i] = width - 22*10 - a*10+ X;
        bigtreeY[i] = 350 - 23*3 - a*9+ Y;
      }
    }
    for (int i = 260; i < 270; i++) {//それの真ん中の段
      int a = i - 260;
      if (checkTree(s1, width - 21*10 - a * 10+ X, 350 - 22*3 - a*9+ Y, use)) { 
        bigtreeX[i] = width - 21*10 - a*10+ X;
        bigtreeY[i] = 350 - 23*3 - a*9 + Y;
      }
    }
    for (int i = 270; i < 275; i++) {//それの一番下の段
      int a = i - 270;
      if (checkTree(s1, width - 20*10 - a*10+ X, 350 - 23*3 - a*9+ Y, use)) { 
        bigtreeX[i] = width - 20*10 - a*10+ X;
        bigtreeY[i] = 350 - 23*3 - a*9+ Y;
      }
    }
    for (int j = 0; j < bigtreeX.length; j++) {
      if (bigtreeX[j] != 0 && bigtreeY[j] != 0 ) {
        text(txt, bigtreeX[j] + locaX, bigtreeY[j] + locaY);
      }
    }
  }
  void drawbigtree(Bsyuki s1, int X, int Y, int use, int locaX, int locaY  ) {
    if (use == 3) {
      bigtree(s1, X, Y, 0, int(locaX), int(locaY));
    } else {
      if (s1.location.x > width - 22*10 + X && s1.location.x < width &&
        s1.location.y >  350 - 23*3 + Y && s1.location.y <  380  + Y ||
        s1.location.x <  width - 22*10 +X && s1.location.x > width-540 +X && s1.location.y > 120 +Y && s1.location.y < 440 + Y) {
        bigtree(s1, X, Y, use, 0, 0);
      } else {
        bigtree(s1, X, Y, 0, 0, 0);
      }
    }
  }

  float eliX[] = new float[100] ;
  float eliY[] = new float[100] ;
  

  void ellip(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
    for (int i = 0; i < 100; i++) { 
      if (checkEli(s1, cos(i*0.1)*100 + X, sin(i*0.1)*100  + Y, use)) { 
        eliX[i] =  cos(i*0.1)*100 + X;
        eliY[i] =  sin(i*0.1)*100 + Y;
      }
    }

    for (int j = 0; j < eliX.length; j++) {
      if (eliX[j] != 0 && eliY[j] != 0 ) {
        fill(234, 232, 96);
        text(txt, eliX[j] + locaX, eliY[j] + locaY);
        fill(250);
      }
    }

  }

   void drawel(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
      if (use == 3) {
        ellip(s1, X, Y, 0, int(locaX), int(locaY));
      } else {
        if (s1.location.x < 101+X && location.x > -101+X && s1.location.y < 101+Y  && s1.location.y > -101+Y ) {
          ellip(s1, X, Y, use, 0, 0 );
        } else if (s1.location.x < 99+X && location.x > -99+X && s1.location.y < 99+Y  && s1.location.y > -99+Y ) {
          ellip(s1, X, Y, 0, 0, 0);
        } else {
          ellip(s1, X, Y, 0, 0, 0);
        }
      }
    }
    
    float eliX1[] = new float[100];
    float eliY1[] = new float[100];
    
    void ellip1(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
    for (int i = 0; i < 100; i++) { 
      if (checkEli(s1, (cos(i*0.1)*60) + X, (sin(i*0.1)*60) + Y, use)) { 
        eliX1[i] =  (cos(i*0.1)*60) + X;
        eliY1[i] =  (sin(i*0.1)*60) + Y;
      }
    }

    for (int j = 0; j < eliX1.length; j++) {
      if (eliX1[j] != 0 && eliY1[j] != 0 ) {
    
        text(txt, eliX1[j] + locaX, eliY1[j] + locaY);
        
      }
    }
  } 
   
  
   
   void drawel1(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
      if (use == 3) {
        ellip1(s1, X, Y, 0, int(locaX), int(locaY));
      } else {
        if (s1.location.x < 101+X && location.x > -101+X && s1.location.y < 101+Y  && s1.location.y > -101+Y ) {
          ellip1(s1, X, Y, use, 0, 0 );
        } else if (s1.location.x < 99+X && location.x > -99+X && s1.location.y < 99+Y  && s1.location.y > -99+Y ) {
          ellip1(s1, X, Y, 0, 0, 0);
        } else {
          ellip1(s1, X, Y, 0, 0, 0);
        }
      }
    }
    
     float eliX2[] = new float[100] ;
  float eliY2[] = new float[100] ;
    
     void ellip2(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
    for (int i = 0; i < 100; i++) { 
      if (checkEli(s1, (cos(i*0.1)*40) + X, (sin(i*0.1)*40) + Y, use)) { 
        eliX2[i] =  (cos(i*0.1)*40) + X;
        eliY2[i] =  (sin(i*0.1)*40) + Y;
      }
    }

    for (int j = 0; j < eliX1.length; j++) {
      if (eliX2[j] != 0 && eliY2[j] != 0 ) {
    
        text(txt, eliX2[j] + locaX, eliY2[j] + locaY);
        
      }
    }
  } 
   
   void drawel2(Bsyuki s1, int X, int Y, int use, int locaX, int locaY ) {
      if (use == 3) {
        ellip2(s1, X, Y, 0, int(locaX), int(locaY));
      } else {
        if (s1.location.x < 101+X && location.x > -101+X && s1.location.y < 101+Y  && s1.location.y > -101+Y ) {
          ellip2(s1, X, Y, use, 0, 0 );
        } else if (s1.location.x < 99+X && location.x > -99+X && s1.location.y < 99+Y  && s1.location.y > -99+Y ) {
          ellip2(s1, X, Y, 0, 0, 0);
        } else {
          ellip2(s1, X, Y, 0, 0, 0);
        }
      }
    }
    
  }
