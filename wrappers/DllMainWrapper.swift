// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libdllmain.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("DllMain.dll")
#else
fileprivate let libHandle = loadDll("libdllmain.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes DllMain program (host of Astro Standards libraries) for use in any Astro Standards applications
public func DllMainInit(  ) -> Int64 {

    typealias FunctionSignature = @convention(c) (  ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "DllMainInit"), to: FunctionSignature.self)

    return function()
}

// Tests different input/output data types that are supported by the Astrodynamic Standards library.
public func TestInterface( _ cIn: CChar,
                           _ cOut: UnsafeMutablePointer<CChar>,
                           _ intIn: Int32,
                           _ intOut: UnsafeMutablePointer<Int32>,
                           _ longIn: Int64,
                           _ longOut: UnsafeMutablePointer<Int64>,
                           _ realIn: Double,
                           _ realOut: UnsafeMutablePointer<Double>,
                           _ strIn: UnsafeMutablePointer<CChar>,
                           _ strOut: UnsafeMutablePointer<CChar>,
                           _ int1DIn: UnsafeMutablePointer<Int32>,
                           _ int1DOut: UnsafeMutablePointer<Int32>,
                           _ long1DIn: UnsafeMutablePointer<Int64>,
                           _ long1DOut: UnsafeMutablePointer<Int64>,
                           _ real1DIn: UnsafeMutablePointer<Double>,
                           _ real1DOut: UnsafeMutablePointer<Double>,
                           _ int2DIn: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ int2DOut: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ long2DIn: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                           _ long2DOut: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                           _ real2DIn: UnsafeMutablePointer<(Double, Double, Double)>,
                           _ real2DOut: UnsafeMutablePointer<(Double, Double, Double)> ) {

    let _int2DIn = UnsafeMutableRawPointer(int2DIn).bindMemory(to: Int32.self, capacity: 6)
    let _int2DOut = UnsafeMutableRawPointer(int2DOut).bindMemory(to: Int32.self, capacity: 6)
    let _long2DIn = UnsafeMutableRawPointer(long2DIn).bindMemory(to: Int64.self, capacity: 6)
    let _long2DOut = UnsafeMutableRawPointer(long2DOut).bindMemory(to: Int64.self, capacity: 6)
    let _real2DIn = UnsafeMutableRawPointer(real2DIn).bindMemory(to: Double.self, capacity: 6)
    let _real2DOut = UnsafeMutableRawPointer(real2DOut).bindMemory(to: Double.self, capacity: 6)

    typealias FunctionSignature = @convention(c) ( CChar,
                                                   UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   UnsafeMutablePointer<Int32>,
                                                   Int64,
                                                   UnsafeMutablePointer<Int64>,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Int64>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "TestInterface"), to: FunctionSignature.self)

    function(cIn, cOut, intIn, intOut, longIn, longOut, realIn, realOut, strIn, strOut, int1DIn, int1DOut, long1DIn, long1DOut, real1DIn, real1DOut, _int2DIn, _int2DOut, _long2DIn, _long2DOut, _real2DIn, _real2DOut)
}


public let INPUTCARDLEN = 512
