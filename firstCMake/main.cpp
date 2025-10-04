#include <iostream>
#include <string>
#include <stdexcept>
#include <config.h>

#ifdef USE_MYMATH
    #include <MathFunctions.h>
#else
    #include <cmath>
#endif

#ifdef USE_IMAGE_PROC
    #include <ImageProcessor.h>
#endif

class Calculator {
public:
    static double calculatePower(double base, int exponent) {
    #ifdef USE_MYMATH
        std::cout << "Using custom Math library.\n";
        return power(base, exponent);
    #else
        std::cout << "Using standard library.\n";
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

            // 进行图像处理
            cv::Mat blurred = ImageProcessor::blurImage(image, 5);
            cv::Mat edges = ImageProcessor::edgeDetection(image);

            // 保存处理后的图像
            cv::imwrite("blurred.jpg", blurred);
            cv::imwrite("edges.jpg", edges);
            
            std::cout << "Image processing completed. Results saved as 'blurred.jpg' and 'edges.jpg'\n";
        } catch (const cv::Exception& e) {
            throw std::runtime_error("OpenCV error: " + std::string(e.what()));
        }
    }
#endif
};

void printUsage(const std::string& programName) {
    std::cout << "Usage:\n"
              << programName << " power <base> <exponent>\n"
    #ifdef USE_IMAGE_PROC
              << "  or\n"
              << programName << " image <image_path>\n"
    #endif
              << std::endl;
}

int main(int argc, char *argv[]) {
    try {
        if (argc < 2) {
            printUsage(argv[0]);
            return 1;
        }

        std::string command(argv[1]);

        if (command == "power" && argc == 4) {
            double base = std::stod(argv[2]);
            int exponent = std::stoi(argv[3]);
            
            double result = Calculator::calculatePower(base, exponent);
            std::cout << base << " ^ " << exponent << " = " << result << std::endl;
        }
    #ifdef USE_IMAGE_PROC
        else if (command == "image" && argc == 3) {
            Calculator::processImage(argv[2]);
        }
    #endif
        else {
            printUsage(argv[0]);
            return 1;
        }

        return 0;
    }
    catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
}