let rplace;
function stitch(){
    let serape = createImage(640, 640);
    serape.loadPixels();
    let m = int(pow(2, int(random(5, 9))));
    let angle = int(pow(2, int(random(4, 11))));

    for(let i = 0;i < rplace.width;i++) {
        for(let j = 0;j < rplace.height;j++) {
            let x = i;
            let y = rplace.height - j - 1;
            let offset = (x * m) + (y * angle);
            let c = color(rplace.pixels[offset], rplace.pixels[offset+1], rplace.pixels[offset+2], 255);
            serape.set((i + (j * serape.width))%width, (i + (j * serape.width))/width, c);
        }
    }
    serape.updatePixels();
    return serape;
}

function preload(){
    rplace=loadImage("rplace640.png");
}

function setup(){
    createCanvas(640, 480);
    rplace.loadPixels();
    noLoop();
}

function draw(){
    let serape = stitch();
    image(serape, 0, 0);
}

