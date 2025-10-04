#include "ImageProcessor.h"

cv::Mat ImageProcessor::blurImage(const cv::Mat& input, int kernelSize) {
    cv::Mat output;
    cv::GaussianBlur(input, output, cv::Size(kernelSize, kernelSize), 0);
    return output;
}

cv::Mat ImageProcessor::edgeDetection(const cv::Mat& input) {
    cv::Mat output;
    cv::Canny(input, output, 100, 200);
    return output;
}
