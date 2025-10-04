# CMake generated Testfile for 
# Source directory: /home/kevinfreshman/桌面/second_assignments/firstCMake/tests
# Build directory: /home/kevinfreshman/桌面/second_assignments/firstCMake/build/firstCMake/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(TestPower_Basic_2_3 "/home/kevinfreshman/桌面/second_assignments/firstCMake/build/firstCMake/tests/calculator_test" "2" "3")
set_tests_properties(TestPower_Basic_2_3 PROPERTIES  _BACKTRACE_TRIPLES "/home/kevinfreshman/桌面/second_assignments/firstCMake/tests/CMakeLists.txt;21;add_test;/home/kevinfreshman/桌面/second_assignments/firstCMake/tests/CMakeLists.txt;0;")
add_test(TestPower_Zero_Exponent "/home/kevinfreshman/桌面/second_assignments/firstCMake/build/firstCMake/tests/calculator_test" "5" "0")
set_tests_properties(TestPower_Zero_Exponent PROPERTIES  _BACKTRACE_TRIPLES "/home/kevinfreshman/桌面/second_assignments/firstCMake/tests/CMakeLists.txt;23;add_test;/home/kevinfreshman/桌面/second_assignments/firstCMake/tests/CMakeLists.txt;0;")
add_test(TestPower_Negative_Base "/home/kevinfreshman/桌面/second_assignments/firstCMake/build/firstCMake/tests/calculator_test" "-2" "3")
set_tests_properties(TestPower_Negative_Base PROPERTIES  _BACKTRACE_TRIPLES "/home/kevinfreshman/桌面/second_assignments/firstCMake/tests/CMakeLists.txt;25;add_test;/home/kevinfreshman/桌面/second_assignments/firstCMake/tests/CMakeLists.txt;0;")
add_test(TestPower_Fractional_Base "/home/kevinfreshman/桌面/second_assignments/firstCMake/build/firstCMake/tests/calculator_test" "2.5" "2")
set_tests_properties(TestPower_Fractional_Base PROPERTIES  _BACKTRACE_TRIPLES "/home/kevinfreshman/桌面/second_assignments/firstCMake/tests/CMakeLists.txt;27;add_test;/home/kevinfreshman/桌面/second_assignments/firstCMake/tests/CMakeLists.txt;0;")
