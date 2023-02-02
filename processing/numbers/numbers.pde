// Benjamin Michael Taylor (bentaylorhk)
// 2023

// Constants
final String nums = "0123456789";

final int CELL_SIZE = 40;

final int GRID_WIDTH = 2400;

final int FONT_SIZE = 30;

final float STD_DEV = 100000;

final float MEAN = 0;

// Simple switch for if it should be rendered in
// interactive mode
final boolean INTERACTIVE = true;

// Global variables
float xOffset = 0.0;
float yOffset = 100.0;

float guassian(float x, float stdDev, float mean) {
    return exp( -sq((x - mean) / stdDev) / 2) / (stdDev * sqrt(TWO_PI));
}

void render()
    {
    float bumpX, bumpY;
    
    if (INTERACTIVE) {
        bumpX = mouseX;
        bumpY = mouseY;
    } else {
        xOffset = xOffset + 0.01;
        yOffset = yOffset + 0.01;
        
        bumpX = noise(xOffset) * width;
        bumpY = noise(yOffset) * width;
    }
    
    for (int y = -GRID_WIDTH; y < GRID_WIDTH; y += CELL_SIZE) {
        for (int x  = -GRID_WIDTH; x < GRID_WIDTH; x += CELL_SIZE) {
            float distance = dist(x, y, bumpX, bumpY);
            
            float thresholdDistance = THRESHOLD - distance;
            
            //float height = guassian(distance, STD_DEV, MEAN);
            
            //println(height);
            // TODO this is broken
            //int value = round(height * nums.length());
            value = constrain(value, 0, nums.length() - 1);
            
            textSize(FONT_SIZE + (value));
            
            text(nums.charAt(value), x, y, -pow(distance, 0.9));
        }
    }
    
    return;
}

void setup()
    {
    size(1200, 1000, P3D);
    
    
    PFont font = createFont("slkscr.ttf", FONT_SIZE);
    
    textFont(font);
    
    textSize(FONT_SIZE);
    
    textAlign(CENTER, CENTER);
    return;
}

void draw()
    {
    background(color(0,0,0));
    render();
    return;
}