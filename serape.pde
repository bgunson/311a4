PImage rplace;

PImage stitch() {
  
  PImage serape = createImage(640, 480, RGB);
  serape.loadPixels();
  
  int m = (int)pow(2, (int)random(5, 9));
  int angle = (int)pow(2, (int)random(4, 11));
      
  for (int i = 0; i < rplace.width; i++) {
    for (int j = 0; j < rplace.height; j++) {
      int x = i;
      int y = rplace.height - j - 1;
      
      int offset = (x * m) + (y * angle);
      
      color c = color(rplace.pixels[offset % rplace.pixels.length]);
      serape.pixels[i + (j*serape.width)] = c;     
    }
  } 
  serape.updatePixels();
  return serape;
}

void setup() {
  size(640, 480);
  rplace = loadImage("rplace640.png");
  rplace.loadPixels();
  noLoop();
}

void draw() {
  PImage serape = stitch();
  image(serape, 0, 0);
  //save("serape.png");
}
