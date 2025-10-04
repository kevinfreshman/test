#ifndef IMAGE_PROCESSOR_H
#define IMAGE_PROCESSOR_H

#include <opencv2/opencv.hpp>

class ImageProcessor {
public:
    static cv::Mat blurImage(const cv::Mat& input, int kernelSize);
    static cv::Mat edgeDetection(const cv::Mat& input);
};

#endif
