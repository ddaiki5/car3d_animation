PImage car;
void setup(){
  size(400, 300, P3D);
  noStroke();
  car = loadImage("car1.png");
  
  textureMode(NORMAL);
  //img.resize(800, 800);
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


int xx=0;
void draw(){
  background(255);
  
  directionalLight(255, 255, 255, 0.5,0.5, -1); 
  camera(255,100,255 , 200, 200, 100, 0, 1, 0);
  
  ambientLight(0, 128,128);
  shininess(400);
  //emissive(128, 128, 128);
  specular(200, 200, 200);
  pushMatrix();
    translate(200, 200,100);
    //scale(-1, 0, 0);
    rotateX(radians(180));
    rotateY(radians(xx));
    drawCar(50);
  popMatrix();
xx++;
  
}
