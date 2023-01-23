// Benjamin Michael Taylor (bentaylorhk)
// 2023

final String nums = "0123456789";

final int cellSize = 40;

final int threshold = 400;

final int gridWidth = 2400;

float xOffset = 0.0;
float yOffset = 100.0;

final int fontSize = 30;

void render()
{
    xOffset = xOffset + 0.01;
    yOffset = yOffset + 0.01;
    
    float bumpX = noise(xOffset) * width;
    float bumpY = noise(yOffset) * width;
    
    for (int y = -gridWidth; y < gridWidth; y += cellSize) {
        for (int x  = -gridWidth; x < gridWidth; x += cellSize) {
            float distance = dist(x, y, bumpX, bumpY);
            
            int value = 0;
            
            float thresholdDistance = threshold - distance;
            
            if (thresholdDistance > 0) {
                value = round((thresholdDistance / threshold) * (nums.length()));
                value = constrain(value, 0, nums.length() - 1);
            }
            
            textSize(fontSize + (value));
            
            text(nums.charAt(value), x, y, -pow(distance, 0.9));
        }
    }
    
    return;
}

void setup()
    {
    size(1200, 1000, P3D);
    
    
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