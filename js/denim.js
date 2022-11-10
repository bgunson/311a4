let mosaic;

function preload() {
    mosaic = loadImage("images/seeds/blue.jpg");
}

function setup() {
    const denimCanvas = createCanvas(640, 480);
    denimCanvas.parent("denim");
    mosaic.loadPixels();
    noLoop();
}

function draw() {
    let denim = stitch(mosaic, 600, 16);
    image(denim, 0, 0);
}

