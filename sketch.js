let template;
let quilt;
let MIN_PATCH_WIDTH = 20;
let patchWidth = 16;
let patchHeight = 9;
let patchDelta = 0;
let templates = ["coast.jpg", "fire.jpg", "flowers.jpg", "falls.jpg", "dog.jpg", "mountains.jpg"];
let showQuilt = true;

function canvasClicked() {
    showQuilt = !showQuilt;
    if (!showQuilt) {
        image(template, 0, 0);
    } else {
        image(quilt, 0, 0);
    }
    // redraw();
}

function preload() {
    template=loadImage("images/templates/" + templates[int(random(templates.length))]);
}

function setup(){
    let cnv = createCanvas(640, 480);
    cnv.mouseClicked(canvasClicked);
    cnv.parent("sketch");
    quilt=createImage(640, 640);
    background(0);
    noLoop();
}

function draw(){
    
    quilt.loadPixels();
    template.loadPixels();

    for(let x = 0;x < template.width;x+=patchWidth) {
        for(let y = 0;y < template.height;y+=patchHeight) {
            let loc = (x + y * template.width) * 4;
            let r = template.pixels[loc];
            let g = template.pixels[loc+1];
            let b = template.pixels[loc+2];
            let xM = int(random(template.width));
            let yM = int(random(template.height));
            for(let i = x;i < x + patchWidth;i++) {
                for(let j = y;j < y + patchHeight;j++) {
                    let offset = (((i * xM) + (j * yM)) * 4) % template.pixels.length;
                    let rF = template.pixels[offset] || 0;
                    let gF = template.pixels[offset+1] || 0;
                    let bF = template.pixels[offset+2] || 0;
                    if(i < quilt.width && j < quilt.height) quilt.set((i + j * quilt.width)%width, (i + j * quilt.width)/width, color((r + r + rF) / 3, (g + g + gF) / 3, (b + b + bF) / 3));
                }
            }
        }
    }
    quilt.updatePixels();
    image(quilt, 0, 0);
}


function delay( milliseconds){
   var start = new Date().getTime();
   var stop=false;
   while(!stop) {
      if ((new Date().getTime() - start) > milliseconds){
         stop=true;
    }
  }
}