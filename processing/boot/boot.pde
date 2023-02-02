// Benjamin Michael Taylor (bentaylorhk)
// 2023

PShape boot;

float rz;

public void setup() {
    size(1200, 1200, P3D);
    
    boot = loadShape("boot.obj");
}

public void draw() {
    background(0);
    lights();
    
    int widthIncrement = width / 4;
    int heightIncrement = height / 3;
    
    for (int w = widthIncrement; w < width; w += widthIncrement) {
        for (int h = heightIncrement; h < height; h += heightIncrement) {
            pushMatrix();
            translate(w, h, 0);
            rotateX(HALF_PI);
            rotateZ(rz);
            shape(boot);
            popMatrix();
        }
    }
    
    rz += 0.02;
}