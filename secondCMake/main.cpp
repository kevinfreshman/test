#include <iostream>
#include <cmath>
#include <iomanip>
#include <sstream>  // 添加这个头文件

class Vector2D {
public:
    double x, y;
    
    Vector2D(double x = 0, double y = 0) : x(x), y(y) {}
    
    double norm() const {
        return std::sqrt(x*x + y*y);
    }
    
    Vector2D operator-(const Vector2D& other) const {
        return Vector2D(x - other.x, y - other.y);
    }
    
    Vector2D operator*(double scalar) const {
        return Vector2D(x * scalar, y * scalar);
    }
    
    // 输出向量的字符串表示
    std::string toString() const {
        std::ostringstream oss;
        oss << "(" << std::fixed << std::setprecision(6) << x << ", " << y << ")";
        return oss.str();
    }
};

class Matrix2D {
public:
    double a, b, c, d;
    
    Matrix2D(double a = 1, double b = 0, double c = 0, double d = 1) 
        : a(a), b(b), c(c), d(d) {}
    
    Matrix2D inverse() const {
        double det = a * d - b * c;
        if (std::abs(det) < 1e-10) {
            std::cerr << "错误: 矩阵不可逆!" << std::endl;
            return Matrix2D();
        }
        return Matrix2D(d/det, -b/det, -c/det, a/det);
    }
    
    Vector2D operator*(const Vector2D& v) const {
        return Vector2D(a * v.x + b * v.y, c * v.x + d * v.y);
    }
    
    // 输出矩阵的字符串表示
    std::string toString() const {
        std::ostringstream oss;
        oss << "[" << a << ", " << b << ";\n " << c << ", " << d << "]";
        return oss.str();
    }
};

int main() {
    // 设置输出精度
    std::cout << std::fixed << std::setprecision(6);

    const int student_id = 2253310176; 
    Vector2D x0(student_id % 827, student_id % 1709);
    const double lambda = 0.5;
    const double delta_threshold = 0.01;
    
    std::cout << "=== 牛顿下降法优化开始 ===" << std::endl;
    std::cout << "目标函数: f(x, y) = x^2 + y^2" << std::endl;
    std::cout << "初始点 x0 = " << x0.toString() << std::endl;
    std::cout << "步长 λ = " << lambda << std::endl;
    std::cout << "阈值 δ = " << delta_threshold << std::endl;
    
    // Hessian矩阵是常数 [[2,0],[0,2]]
    Matrix2D H(2, 0, 0, 2);
    Matrix2D H_inv = H.inverse();  // [[0.5,0],[0,0.5]]
    
    Vector2D x_current = x0;
    Vector2D x_previous;
    int iteration = 0;
    double delta_norm;
    
    std::cout << "Hessian矩阵: " << H.toString() << std::endl;
    std::cout << "Hessian逆矩阵: " << H_inv.toString() << std::endl;
    
    do {
        iteration++;
        x_previous = x_current;
        
        // 计算梯度 ∇f = [2x, 2y]
        Vector2D grad(2.0 * x_current.x, 2.0 * x_current.y);
        
        // 牛顿下降法迭代: x_{k+1} = x_k - λ * H^{-1} * ∇f(x_k)
        Vector2D step = H_inv * grad;
        x_current = x_current - step * lambda;
        
        // 计算下降程度
        delta_norm = (x_current - x_previous).norm();
        
        // 计算函数值
        double f_value = x_current.x * x_current.x + x_current.y * x_current.y;
        
        // 输出当前状态
        std::cout << "迭代 " << iteration << ": x = " << x_current.toString() 
                  << ", f(x) = " << f_value << ", ||Δx|| = " 
                  << delta_norm << std::endl;
        
    } while (delta_norm > delta_threshold && iteration < 1000);
    
    std::cout << "=== 优化完成 ===" << std::endl;
    std::cout << "总迭代次数: " << iteration << std::endl;
    std::cout << "极小值点: x* = " << x_current.toString() << std::endl;
    std::cout << "极小值: f(x*) = " << (x_current.x * x_current.x + x_current.y * x_current.y) << std::endl;
    std::cout << "理论最小值点: (0, 0), f(0,0) = 0" << std::endl;
    std::cout << "误差: ||x* - (0,0)|| = " << x_current.norm() << std::endl;
    
    return 0;
}