PImage fabric, template;
int max_patch_size = 32;
int min_patch_size = 4;
int patch_size = 0;

String[] seedImages = {"blue.jpg", "rplace.png", "ice.jpg", "fire.jpg"};
String[] templates = {"coast.jpg", "fire.jpg", "pajero.jpg"};

PImage stitch(PImage seedImage, int xMult, int yMult) {
  
  PImage fabric = createImage(640, 480, RGB);
  fabric.loadPixels();
  
  xMult %= seedImage.width;
  yMult %= seedImage.height;
  
  for (int x = 0; x < seedImage.width; x++) {
    for (int y = 0; y < seedImage.height; y++) {
      int offset = (x * xMult) + (y * yMult);
      color c = color(seedImage.pixels[offset % seedImage.pixels.length]);
      fabric.pixels[(x + (y*fabric.width)) % fabric.pixels.length] = c;     
    }
  } 
  fabric.updatePixels();
  return fabric;
}

void reset() { 
  PImage seed = loadImage("images/seeds/" + seedImages[(int)random(seedImages.length)]);
  seed.loadPixels();
  
  fabric = stitch(seed, int(random(seed.width)), int(random(seed.height)));
  image(fabric, 0, 0);
  
  template = loadImage("images/templates/" + templates[(int)random(templates.length)]);
  template.loadPixels();
  
  image(template, 640, 0);
  
  patch_size = max_patch_size;
  
}

void setup() {
  size(1280, 480); 
  reset();
}

void draw() {
  
  if (frameCount == 1) delay(2000);
  
  if (frameCount % 120 == 0) {
    // decrease patch size every so often. This will make the drawing appear more closly to the original with time.
    patch_size = max(min_patch_size, --patch_size);
  }
  
  if (patch_size == min_patch_size) {
      reset();
      delay(2000);
  }
  
  int x = int(random(template.width));
  int y = int(random(template.height));
  int loc = x + y*template.width;
  
  int patchSpan = int(random(min_patch_size, patch_size));
  
  float r = red(template.pixels[loc]);    // red value on template image @ x,y
  float g = green(template.pixels[loc]);  // green value on template image @ x,y
  float b = blue(template.pixels[loc]);  // blue value on template image @ c,y
  
  for (int i = (x - patchSpan); i < (x + patchSpan); i++) {
    for (int j = (y - patchSpan); j < (y + patchSpan); j++) {
      
      if (i >= 0 && i < fabric.width && j >= 0 && j < fabric.height) {
        int offset = i + j*fabric.width;
      
        float rF = red(fabric.pixels[offset]);    // red value on fabric image @ i,j
        float gF = green(fabric.pixels[offset]);  // green value on fabric image @ i,j 
        float bF = blue(fabric.pixels[offset]);  // blue vaue on fabric image @ i,j
        
        stroke((r+r+rF)/3, (g+g+gF)/3, (b+b+bF)/3);    // stroke color will have more weight to the template image
        strokeWeight(4);
        point(i, j); 
      }
      
    }
  }
  
  
}
