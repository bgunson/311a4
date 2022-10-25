let mosaic;

function preload() {
    mosaic = loadImage("images/blue.jpg");
}

function setup() {
    createCanvas(640, 480);
    mosaic.loadPixels();
    noLoop();
}

function draw() {
    let denim = stitch(mosaic);
    image(denim, 0, 0);
}

