// Benjamin Michael Taylor (bentaylorhk)
// 2023

final String nums = "0123456789";

final int cellSize = 40;

final int threshold = 400;

void render()
{
    for (int y = -2000; y < 2000; y += cellSize) {
        for (int x  = -2000; x < 2000; x += cellSize) {
            float distance = dist(x, y, mouseX, mouseY);
            
            int value = 0;
            
            float thresholdDistance = threshold - distance;
            
            if (thresholdDistance > 0) {
                value = round((thresholdDistance / threshold) * (nums.length()));
                value = constrain(value, 0, nums.length() - 1);
            }
            
            text(nums.charAt(value), x, y, -pow(distance, 0.9));
        }
    }
    
    return;
}

void setup()
    {
    size(1200, 1000, P3D);
    
    int fontSize = 30;
    
    PFont font = createFont("slkscr.ttf", fontSize);
    
    textFont(font);
    
    textSize(fontSize);
    
    textAlign(CENTER, CENTER);
    return;
}

void draw()
    {
    background(color(0,0,0));
    render();
    return;
}