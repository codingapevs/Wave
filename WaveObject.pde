class WaveObject{
int offset;
color c;
float yn;
 WaveObject(color ic, int x){
   c = ic;
   offset = x* 25;
   yn = random(0,1);
 } 
 
 void update(){ //<>// //<>// //<>//
 //yoff += 0.01;
 yn += 0.01;
 }
  
void make(){
  
  //yoff = iy; //<>//
  
  pushMatrix();
 
  noStroke();
  fill(c);
  // We are going to draw a polygon out of the wave points
  beginShape(); 
 
  //float xoff = 0;       // Option #1: 2D Noise
   float xoff = yn; // Option #2: 1D Noise //<>// //<>// //<>//
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 50) {
    // Calculate a y value according to noise, map to 
    //float y = map(noise(xoff, yoff), 0, 1, 200,300); // Option #1: 2D Noise
     float y = map(noise(xoff), 0, 1, 200,270);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y + offset); 
    // Increment x dimension for noise
    xoff += 0.2;
  }
  // increment y dimension for noise
  //yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape();
  popMatrix();
}  
  
}