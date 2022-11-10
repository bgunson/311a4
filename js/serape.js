let rplace;

function preload() {
    rplace = loadImage("images/seeds/rplace.png");
}

function setup() {
    const serapeCanvas = createCanvas(640, 480);
    serapeCanvas.parent("serape");
    rplace.loadPixels();
    noLoop();
}

function draw() {
    let serape = stitch(rplace, 64, 64);
    image(serape, 0, 0);
}

