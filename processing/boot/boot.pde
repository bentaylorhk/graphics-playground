// Benjamin Michael Taylor (bentaylorhk)
// 2023

PShape boot;

float ry;

public void setup() {
    size(1000, 1000, P3D);
    
    boot = loadShape("boot.obj");
}

public void draw() {
    background(0);
    lights();
    
    translate(width / 2, height / 2, 0);
    rotateY(ry);
    shape(boot);
    
    ry += 0.02;
}