function stitch(seedImage, xMult, yMult){
    let fabric = createImage(640, 640);
    fabric.loadPixels();

    xMult %= fabric.width;
    yMult %= fabric.height;

    for(let x = 0; x < seedImage.width; x++) {
        for(let y = 0; y < seedImage.height; y++) {
            let offset = (x * xMult) + (y * yMult);
            let c = color(seedImage.pixels[offset], seedImage.pixels[offset+1], seedImage.pixels[offset+2], 255);
            fabric.set((x + (y * fabric.width))%width, (x + (y * fabric.width))/width, c);
        }
    }
    fabric.updatePixels();
    return fabric;
}