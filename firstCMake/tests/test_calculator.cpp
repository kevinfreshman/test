#include <iostream>
#include <string>
#include <stdexcept>
#include <cmath>
#include <config.h>

#ifdef USE_MYMATH
    #include <MathFunctions.h>
#else
    #include <cmath>
#endif

#ifdef USE_IMAGE_PROC
    #include <ImageProcessor.h>
    #include <opencv2/opencv.hpp>
#endif

// 复制 Calculator 类
class Calculator {
public:
    static double calculatePower(double base, int exponent) {
    #ifdef USE_MYMATH
        std::cout << "Using custom Math library." << std::endl;
        return power(base, exponent);
    #else
        std::cout << "Using standard library." << std::endl;
        return std::pow(base, exponent);
    #endif
    }

#ifdef USE_IMAGE_PROC
    static void processImage(const std::string& imagePath) {
        try {
            cv::Mat image = cv::imread(imagePath);
            if (image.empty()) {
                throw std::runtime_error("Failed to load image: " + imagePath);
            }
            std::cout << "Image loaded successfully: " << imagePath << std::endl;
        } catch (const cv::Exception& e) {
            throw std::runtime_error("OpenCV error: " + std::string(e.what()));
        }
    }
#endif
};

int main(int argc, char *argv[]) {
    // 在 Debug 模式下输出调试信息
#ifdef DEBUG
    std::cout << "=== Debug Build ===" << std::endl;
#endif
    
    try {
        if (argc == 3) {
            // 命令行测试模式: ./calculator_test <base> <exponent>
            double base = std::stod(argv[1]);
            int exponent = std::stoi(argv[2]);
            
            double result = Calculator::calculatePower(base, exponent);
            std::cout << base << " ^ " << exponent << " = " << result << std::endl;
            return 0;
        }
#ifdef USE_IMAGE_PROC
        else if (argc == 3 && std::string(argv[1]) == "image") {
            // 图像处理测试模式
            Calculator::processImage(argv[2]);
            return 0;
        }
#endif
        else {
            std::cerr << "Usage:" << std::endl;
            std::cerr << "  " << argv[0] << " <base> <exponent>  - Test power calculation" << std::endl;
#ifdef USE_IMAGE_PROC
            std::cerr << "  " << argv[0] << " image <image_path> - Test image processing" << std::endl;
#endif
            return 1;
        }
    }
    catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
}