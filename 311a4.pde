PImage template, quilt;

int MIN_PATCH_WIDTH = 10;
int patchWidth, patchHeight;
float patchDelta;

String[] templates = {"coast.jpg", "fire.jpg", "flowers.jpg", "falls.jpg", "dog.jpg", "mountains.jpg"};

void reset() {   
  template = loadImage("images/templates/" + templates[(int)random(templates.length)]);
  template.loadPixels();
  
  patchWidth = template.width;
  patchHeight = template.height;
  
  patchDelta = 0.5;
 
  frameCount = 0;  
}

void setup() {
  size(640, 480); 
  reset();
  quilt = createImage(640, 480, RGB);
  //noSmooth();
  background(0);
}


void draw() {
  
  quilt.loadPixels();
      
  for (int x = 0; x < template.width; x+=patchWidth) {
    for (int y = 0; y < template.height; y+=patchHeight) {
      
      int loc = x + y*template.width;
        
      float r = red(template.pixels[loc]);    // red value on template image @ x,y
      float g = green(template.pixels[loc]);  // green value on template image @ x,y
      float b = blue(template.pixels[loc]);  // blue value on template image @ c,y
      
      int xM = int(random(template.width));
      int yM = int(random(template.height));
      
      for (int i = x; i < x+patchWidth; i++) {
        for (int j = y; j < y+patchHeight; j++) {
       
          int offset = ((i*xM) + (j*yM)) % template.pixels.length;
          float rF = red(template.pixels[offset]);    // red value on fabric image @ i,j
          float gF = green(template.pixels[offset]);  // green value on fabric image @ i,j 
          float bF = blue(template.pixels[offset]);  // blue vaue on fabric image @ i,j
          
          if (i < quilt.width && j < quilt.height)
            quilt.pixels[i + j*quilt.width] = color((r+r+rF)/3, (g+g+gF)/3, (b+b+bF)/3);
        }
      }
    }
  }
  
  quilt.updatePixels();
  image(quilt, 0, 0);
  delay(1000);
  
  if (patchWidth <= MIN_PATCH_WIDTH) {
    patchDelta = 2;
  } else if (patchWidth == template.width) {
    reset();
  }
  
  patchWidth *= patchDelta;
  patchHeight *= patchDelta;
  
}
