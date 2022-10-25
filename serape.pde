PImage seedImage;

PImage stitch() {
  
  PImage serape = createImage(640, 480, RGB);
  serape.loadPixels();
  
  int m = (int)pow(2, (int)random(5, 9));
  int angle = (int)pow(2, (int)random(4, 11));
      
  for (int i = 0; i < seedImage.width; i++) {
    for (int j = 0; j < seedImage.height; j++) {
      int x = i;
      int y = seedImage.height - j - 1;
      
      int offset = (x * m) + (y * angle);
      
      color c = color(seedImage.pixels[offset % seedImage.pixels.length]);
      serape.pixels[(i + (j*serape.width)) % serape.pixels.length] = c;     
    }
  } 
  serape.updatePixels();
  return serape;
}

void setup() {
  size(640, 480);
  seedImage = loadImage("images/blue.jpg");
  seedImage.loadPixels();
 
  noLoop();
}

void draw() {
  PImage serape = stitch();
  image(serape, 0, 0);
}
