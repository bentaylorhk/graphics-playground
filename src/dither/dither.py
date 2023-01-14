import cv2
import numpy as np

BOOT_PATH = 'C:/Users/Peter/repos/graphics-playground/input/mp4/boot.mp4'


def dither(img):
    h = img.shape[0]
    w = img.shape[1]

    grey_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    for y in range(h - 1):
        for x in range(1, w - 1):
            old_pixel = grey_img[y, x]
            new_pixel = np.round(old_pixel / 255.0) * 255
            grey_img[y, x] = new_pixel
            err = old_pixel - new_pixel
            grey_img[y,x+1] = grey_img[y,x+1] + ((err * 7) / 16.0)
            grey_img[y+1,x-1] = grey_img[y+1,x-1] + ((err * 3) / 16.0)
            grey_img[y+1,x] = grey_img[y+1,x] + ((err * 5) / 16.0)
            grey_img[y+1,x+1] = grey_img[y+1,x+1] + ((err * 1) / 16.0)

    return grey_img


def main():
    cap = cv2.VideoCapture(BOOT_PATH)

    while cap.isOpened():
        ret, frame = cap.read()

        dithered_img = dither(frame)

        if ret:
            cv2.imshow("Dither", dithered_img)
            cv2.waitKey(2)
        else:
            break


if __name__ == '__main__':
    main()
