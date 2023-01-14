/**
 * Benjamin Michael Taylor (bentaylorhk)
 * 2023
 */

#include <iostream>
#include <opencv2/core/core.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/highgui.hpp>

int main(int argc, char *argv[]) {
    printf("ASDBJU");
    printf(argv[0]);
    cv::VideoCapture cap = cv::VideoCapture(argv[0]);

    if (!cap.isOpened()) {
        printf("Failed to open file\n");
        return -1;
    }
    printf("SADBNUO");
    cv::Mat frame;

    while (true) {
        cap.read(frame);

        if (frame.empty()) {
            break;
        }

        cv::imshow("Dither", frame);

        if (cv::waitKey(5) >= 0) {
            break;
        }
    }

    return 0;
}
