//float yoff = 0.0; // 2nd dimension of perlin noise //<>// //<>// //<>//
int num = 4;
color a, b, c, d;
color[] colorstack;
PImage photo;
int flag=0;
WaveObject[] ws = new WaveObject[num];
void setup() {
  photo = loadImage("Kamino.png");
  randomSeed(0);
  frameRate(20);
  size(500, 500);
  colorMode(RGB, 255, 255, 255, 1);

  a = color(116, 108, 115);
  b = color(94, 190, 179);
  c = color(87, 222, 209);
  d = color(110, 228, 211);
  color[] colorstack = {d, c, b, a};
  for (int i =0; i<num; i++) {
    ws[i] = new WaveObject(colorstack[i], i);
    ws[i].make();
  }
}

void draw() {
  background(255, 1);
  flag=0;
  for (WaveObject w : ws) {  
    println(flag);
    w.update();
    w.make();
    if(flag<1)
    {
      flag++;
    }
    else if(flag==1){
      image(photo, width/2, height/2+10, 200, 150);
      imageMode(CENTER);
      flag++;
    }
    
  }
  drawmask();
}

void drawmask() {

  stroke(255);
  strokeWeight(210);
  fill(255, 0);
  int rad = 500;
  ellipse(250, 250, rad, rad);
}