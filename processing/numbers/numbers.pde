// Benjamin Michael Taylor (bentaylorhk)
// 2023

final String nums = "0123456789";

final int cellSize = 40;

final int threshold = 400;

void render()
{
    for (int y = cellSize / 2; y < height; y += cellSize) {
        for (int x  = cellSize / 2; x < width; x += cellSize) {
            float distance = dist(x, y, mouseX, mouseY);
            
            int value = 0;
            
            float thresholdDistance = threshold - distance;
            
            if (thresholdDistance > 0) {
                value = round((thresholdDistance / threshold) * (nums.length() - 1));
            }
            
            text(nums.charAt(value), x, y, distance);
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