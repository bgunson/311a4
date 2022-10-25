

function stitch(seedImage){
    let fabric = createImage(640, 640);
    fabric.loadPixels();
    let m = int(pow(2, int(random(5, 9))));
    let angle = int(pow(2, int(random(4, 11))));

    for(let x = 0; x < seedImage.width; x++) {
        for(let y = 0; y < seedImage.height; y++) {
            let offset = (x * m) + (y * angle);
            let c = color(seedImage.pixels[offset], seedImage.pixels[offset+1], seedImage.pixels[offset+2], 255);
            fabric.set((x + (y * fabric.width))%width, (x + (y * fabric.width))/width, c);
        }
    }
    fabric.updatePixels();
    return fabric;
}