///
/// Test the Tests ..
///
@main
public struct TestInterfaces {

    public static func main() {

    	// --------------------------------------------------------------------------------
        //  TEST_INTERFACE_1 (SERVICE VERSION)
        //

        do {
            let char_In = "A"
            let int32_In: Int32 = 3
            let int64_In: Int64 = 5
            let real_In = 7.0
            let str_In = "qazqazqaz"

            var int1D_In: [Int32] = [9, 10, 11]
            var long1D_In: [Int64] = [15, 16, 17]
            var real1D_In: [Double] = [12.3, 45.6, 78.9]

            var int2D_In: [(Int32, Int32, Int32)] = [(27, 28, 29), (30, 31, 32)]
            var long2D_In: [(Int64, Int64, Int64)] = [(39, 40, 41), (42, 43, 44)]
            var real2D_In: [(Double, Double, Double)] = [(1.23, 4.56, 7.89), (9.87, 6.54, 3.21)]

            var char_Out = ""
            var int32_Out = Int32()
            var int64_Out = Int64()
            var real_Out = 0.0
            var str_Out = ""

            var int1D_Out: [Int32] = [0, 0, 0]
            var long1D_Out: [Int64] = [0, 0, 0]
            var real1D_Out: [Double] = [0.0, 0.0, 0.0]

            var int2D_Out: [(Int32, Int32, Int32)] = [(0, 0, 0), (0, 0, 0)]
            var long2D_Out: [(Int64, Int64, Int64)] = [(0, 0, 0), (0, 0, 0)]
            var real2D_Out: [(Double, Double, Double)] = [(0.0, 0.0, 0.0), (0.0, 0.0, 0.0)]

            testInterface1(char_In, &char_Out,
                           int32_In, &int32_Out,
                           int64_In, &int64_Out,
                           real_In, &real_Out,
                           str_In, &str_Out,

                           &int1D_In, &int1D_Out,
                           &long1D_In, &long1D_Out,
                           &real1D_In, &real1D_Out,

                           &int2D_In, &int2D_Out,
                           &long2D_In, &long2D_Out,
                           &real2D_In, &real2D_Out)

            print("TestInterface 1 .. input transfered to output\n")

            print(char_In, terminator: " == ")
            print(char_Out)
            print(int32_In, terminator: " == ")
            print(int32_Out)
            print(int64_In, terminator: " == ")
            print(int64_Out)
            print(real_In, terminator: " == ")
            print(real_Out)
            print(str_In, terminator: " == ")
            print(str_Out, terminator: "\n\n")

            print(int1D_In, terminator: " == ")
            print(int1D_Out)
            print(long1D_In, terminator: " == ")
            print(long1D_Out)
            print(real1D_In, terminator: " == ")
            print(real1D_Out, terminator: "\n\n")

            print(int2D_In, terminator: " == ")
            print(int2D_Out)
            print(long2D_In, terminator: " == ")
            print(long2D_Out)
            print(real2D_In, terminator: " == ")
            print(real2D_Out, terminator: "\n\n")
        }
    }
}
