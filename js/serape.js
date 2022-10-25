let rplace;

function preload() {
    rplace = loadImage("images/rplace.png");
}

function setup() {
    createCanvas(640, 480);
    rplace.loadPixels();
    noLoop();
}

function draw() {
    let serape = stitch(rplace);
    image(serape, 0, 0);
}

