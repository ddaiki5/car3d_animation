PImage car, kabe, yane, miti, haikei;
void setup(){
  size(400, 300, P3D);
  noStroke();
  car = loadImage("car1.png");
  kabe = loadImage("kabe.jpg");
  yane = loadImage("yane.jpg");
  miti = loadImage("asp4.jpg");
  haikei = loadImage("haikei.jpg");
  textureMode(NORMAL);
  //img.resize(800, 800);
}

void leaf(int r, int g, int b){
  fill(r, g, b);
  beginShape(TRIANGLES);
    vertex(0, .5, 0); vertex(-.5, 0, -.5); vertex(.5, 0, -.5);
    vertex(0, .5, 0); vertex(.5, 0, -.5); vertex(.5, 0, .5);
    vertex(0, .5, 0); vertex(.5, 0, .5); vertex(-.5, 0, .5);
    vertex(0, .5, 0); vertex(-.5, 0, .5); vertex(-.5, 0, -.5);
    vertex(-.5, 0, -.5); vertex(.5, 0, .5); vertex(.5, 0, -.5);
    vertex(-.5, 0, -.5); vertex(-.5, 0, .5); vertex(.5, 0, .5);
  endShape();
}

void leaves(){
  pushMatrix(); translate(0, .5, 0); scale(.6, .6, .6); leaf(0, 224, 0);popMatrix();
  pushMatrix(); translate(0, .25, 0); scale(.8, .8, .8); leaf(0, 192, 0); popMatrix();
  leaf(0, 128, 0);
}

void trunk(){
  fill(128, 64, 0);
  pushMatrix();
    scale(.2, .4, .2);
    translate(0, .5, 0);
    box(1);
  popMatrix();
}

void drawTree(float s){
  pushMatrix();
    scale(s, s, s);
    trunk();
    translate(0, .4, 0);
    leaves();
   popMatrix();
}

void car(){
  beginShape(QUADS);
    texture(car);
    //side
    vertex(-1, 0, 0.5, 0, 0); vertex(-1, -.5, 0.5, 0, 1f/6); vertex(1, -.5, 0.5, 1, 1f/6); vertex(1, 0, 0.5, 1, 0);
    vertex(-.7, 0, .5, 0, 1f/6); vertex(-.5, .5, .5, 0, 1f/3); vertex(.3, .5, .5, 1, 1f/3); vertex(.6, 0, .5, 1, 1f/6);
    //side
    vertex(-1, 0, -0.5, 0, 0); vertex(-1, -.5, -0.5, 0, 1f/6); vertex(1, -.5, -0.5, 1, 1f/6); vertex(1, 0, -0.5, 1, 0);
    vertex(-.7, 0, -.5, 0, 1f/6); vertex(-.5, .5, -.5, 0, 1f/3); vertex(.3, .5, -.5, 1, 1f/3); vertex(.6, 0, -.5, 1, 1f/6);
    
    vertex(-1, 0, 0.5, 0, 1f/3); vertex(-1, -0.5, 0.5, 0, 1f/2); vertex(-1, -0.5, -0.5, 1, 1f/2); vertex(-1, 0, -0.5, 1, 1f/3);
    vertex(1, 0, 0.5, 0, 1f/2); vertex(1, -0.5, 0.5, 0, 2f/3); vertex(1, -0.5, -0.5, 1, 2f/3); vertex(1, 0, -0.5, 1, 1f/2);
    
    vertex(-1, 0, .5, 0, 5f/6); vertex(-.7, 0, .5, 0, 1); vertex(-.7, 0, -.5, 1,1); vertex(-1, 0, -.5, 1, 5f/6);
    vertex(1, 0, .5, 0, 5f/6); vertex(.6, 0, .5, 0, 1); vertex(.6, 0, -.5, 1,1); vertex(1, 0, -.5, 1, 5f/6);
    
    vertex(-.7, 0, .5, 0, 2f/3 ); vertex(-.5, .5, .5, 0, 5f/6); vertex(-.5, .5, -.5, 1, 5f/6); vertex(-.7, 0, -.5, 1, 2f/3);
    vertex(.3, .5, -.5 ,0, 2f/3); vertex(.6, 0, -.5, 0, 5f/6); vertex(.6, 0, .5, 1, 5f/6); vertex(.3, .5, .5, 1, 2f/3);
    
    vertex(.3, .5, -.5, 0, 5f/6); vertex(-.5, .5, -.5, 0, 1); vertex(-.5, .5, .5, 1,1); vertex(.3, .5, .5, 1, 5f/6);
    vertex(1, -.5, -.5, 0, 5f/6); vertex(-1, -.5, -.5, 0, 1); vertex(-1, -.5, .5, 1,1); vertex(1, -.5, .5, 1, 5f/6);
    
  endShape();
}

void wheel(){
  fill(0);
  beginShape(TRIANGLE);
    for(int i=0;i<12;i++){
      vertex(0, 0, .3); vertex(.5*cos(PI*2*i/12), .5*sin(PI*2*i/12), .3); vertex(.5*cos(PI*2*(i+1)/12), .5*sin(PI*2*(i+1)/12), .3);
    }
    for(int i=0;i<12;i++){
      vertex(0, 0, -.3); vertex(.5*cos(PI*2*i/12), .5*sin(PI*2*i/12), -.3); vertex(.5*cos(PI*2*(i+1)/12), .5*sin(PI*2*(i+1)/12), -.3);
    }
    for(int i=0;i<12;i++){
      vertex(.5*cos(PI*2*i/12), .5*sin(PI*2*i/12), .3); vertex(.5*cos(PI*2*i/12), .5*sin(PI*2*i/12), -.3); vertex(.5*cos(PI*2*(i+1)/12), .5*sin(PI*2*(i+1)/12), -.3);
      vertex(.5*cos(PI*2*i/12), .5*sin(PI*2*i/12), .3); vertex(.5*cos(PI*2*(i+1)/12), .5*sin(PI*2*(i+1)/12), .3); vertex(.5*cos(PI*2*(i+1)/12), .5*sin(PI*2*(i+1)/12), -.3);
    }
  endShape();
  
}



void drawCar(float s){
  scale(s, s, s);

  translate(0, .4, 0);
  car();
  scale(0.4, 0.4, 0.4);
  pushMatrix();
    translate(-1, -1, -1);
    wheel();
  popMatrix();
  pushMatrix();
    translate(-1, -1, 1);
    wheel();
  popMatrix();
  pushMatrix();
    translate(1, -1, -1);
    wheel();
  popMatrix();
  pushMatrix();
    translate(1, -1, 1);
    wheel();
  popMatrix();
}

void house(){
  beginShape(TRIANGLE);
    
    texture(kabe);
    //fill(240);
    vertex(.5, 0, .5, 0, 0); vertex(-.5, 0, .5, 0, 1); vertex(.5, .5, .5, 1, 0);
    //vertex(.5, .5, .5, 1, 0); vertex(-.5, .5, .5, 1, 1); vertex(-.5, .5, .5, 0, 1);
    vertex(.5, .5, .5, 1, 0); vertex(-.5, .5, .5, 1, 1); vertex(-.5, 0, .5, 0, 1);
    
    vertex(.5, 0, -.5, 0, 0); vertex(-.5, 0, -.5, 0, 1); vertex(.5, .5, -.5, 1, 0);
    vertex(.5, .5, -.5, 1, 0); vertex(-.5, .5, -.5, 1, 1); vertex(-.5, 0, -.5, 0, 1);
    
    vertex(.5, 0, .5, 0, 0); vertex(.5, 0, -.5, 0, 1); vertex(.5, .5, .5, 1, 0);
    vertex(.5, .5, .5, 1, 0); vertex(.5, .5, -.5, 1, 1); vertex(.5, 0, -.5, 0, 1);
    
    vertex(-.5, 0, .5, 0, 0); vertex(-.5, 0, -.5, 0, 1); vertex(-.5, .5, .5, 1, 0);
    vertex(-.5, .5, .5, 1, 0); vertex(-.5, .5, -.5, 1, 1); vertex(-.5, 0, -.5, 0, 1);
    
    vertex(.5, .5, .5, 1, 0); vertex(-.5, .5, .5, 0, 0); vertex(0, 1, .5, 0.5, 1);
    vertex(.5, .5, -.5, 1, 0); vertex(-.5, .5, -.5, 0, 0); vertex(0, 1, -.5, 0.5, 1);
    
    vertex(.5, 0, .5, 0, 0); vertex(.5, 0, -.5, 0, 1); vertex(-.5, 0, .5, 1, 0);
    vertex(-.5, 0, .5, 0, 0); vertex(-.5, 0, -.5, 0, 1); vertex(.5, 0, -.5, 1, 0);
  endShape();
  
  beginShape(TRIANGLES);
    texture(yane);
    vertex(.6, .4, .5, 0, 0); vertex(.6, .4, -.5, 0, 1); vertex(0, 1, .5, 1, 0);
    vertex(0, 1, .5, 1, 0); vertex(0, 1, -.5, 1, 1); vertex(.6, .4, -.5, 0, 1);
    
    vertex(-.6, .4, .5, 0, 0); vertex(-.6, .4, -.5, 0, 1); vertex(0, 1, .5, 1, 0);
    vertex(0, 1, .5, 1, 0); vertex(0, 1, -.5, 1, 1); vertex(-.6, .4, -.5, 0, 1);
    
  endShape();
  
  beginShape(TRIANGLES);   
    fill(193, 119, 21);
    vertex(.1, 0, .51); vertex(-.1, 0, .51); vertex(.1, .4, .51);
    vertex(.1, .4, .51); vertex(-.1, .4, .51); vertex(-.1, 0, .51);
    fill(183, 255, 253);
    vertex(.52, .2, .4); vertex(.52, .2, .2); vertex(.52, .4, .2);
    vertex(.52, .4, .4); vertex(.52, .4, .2); vertex(.52, .2, .4);
    
    vertex(.51, .2, -.4); vertex(.51, .2, -.2); vertex(.51, .4, -.2);
    vertex(.51, .4, -.4); vertex(.51, .4, -.2); vertex(.51, .2, -.4);
    
    vertex(-.51, .2, .4); vertex(-.51, .2, .2); vertex(-.51, .4, .2);
    vertex(-.51, .4, .4); vertex(-.51, .4, .2); vertex(-.51, .2, .4);
    
    vertex(-.51, .2, -.4); vertex(-.51, .2, -.2); vertex(-.51, .4, -.2);
    vertex(-.51, .4, -.4); vertex(-.51, .4, -.2); vertex(-.51, .2, -.4);   
  endShape();
}

void drawHouse(float s){
  pushMatrix();
    scale(s, s, s);
    house();
  popMatrix();
}

void drawBackground(){
  pushMatrix();
    scale(1, 1500, 1000000);
    translate(-500+xx*0.2, 0, 0);
    //fill(250,141, 58);
    //scale(-1, 0, 0);
    beginShape(QUADS);
      texture(haikei);
      vertex(0, 0, 1, 0, 1); vertex(0, 0, -1, 1, 1); vertex(0, 1, -1, 1, 0); vertex(0, 1, 1, 0, 0);
    endShape();
  popMatrix();
}

void drawRoadTile(color c){
  fill(c);
  beginShape(QUADS);
    texture(miti);
    vertex(.5, 0, .5, 0, 0); vertex(-.5, 0, .5, 1, 0); vertex(-.5, 0, -.5, 1, 1); vertex(.5, 0, -.5, 0, 1);
  endShape();
  
}

void drawGround(){
  pushMatrix();
    fill(113, 68, 8);
    scale(100000, 1, 1000000);
    translate(0, -1, 0);
    beginShape(QUADS);
      vertex(1, 0, 1); vertex(1, 0, -1); vertex(-1, 0, -1); vertex(-1, 0, 1);
    endShape();
  popMatrix();
}

int xx=0;
void draw(){
  background(255);
  drawGround();
  drawBackground();
  //drawMountain();
  //lights();
  directionalLight(255, 100, 100, -1, -0.5, 0); 
  camera(200+xx*1.2, 180, 180-xx/10f, 0, 50, 0, 0, -1, 0);
  //動く車
  pushMatrix();
    translate(xx, 10, 100);
    //scale(-1, 0, 0);
    rotateY(110);
    drawCar(50);
  popMatrix();
  //設置する車
  for(int i=0;i<15;i++){
    pushMatrix();
      translate(i*500, 10, 0);
      //rotateY(10);
      drawCar(50);
    popMatrix();
  }
  
  for(int i=-10;i<25;i++){
    //木
    pushMatrix();
      translate(100*i, 0, -100);
      drawTree(100);
      scale(100, 1, 100);
      //drawGround();
    popMatrix();
    
    pushMatrix();
      translate(150*i, 0, 300);
      drawTree(100);
      scale(100, 1, 100);
      //drawRoadTile(color(113, 68, 8));
    popMatrix();
    //家
    pushMatrix();
      translate(300*i, 0, 200);
      drawHouse(100);
      scale(200, 1, 100);
      //drawRoadTile(color(113, 247, 100));
    popMatrix();
     
  }
  //道路
  pushMatrix();
    scale(5000, .5, 100);
    drawRoadTile(color(128));
  popMatrix();
  pushMatrix();
    translate(0, 0, 100);
    scale(5000, .5, 100);
    drawRoadTile(color(128));
  popMatrix();
  xx++;
  
  if(xx>1800){
    xx=0;
  }
}
