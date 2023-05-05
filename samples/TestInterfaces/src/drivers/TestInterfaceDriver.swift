//
//  TestInterfaceDriver.swift
//
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation

public func testInterface1(_ char_In: String, _ char_Out: inout String,
                           _ int_In: Int32, _ int_Out: UnsafeMutablePointer<Int32>,
                           _ long_In: Int64, _ long_Out: UnsafeMutablePointer<Int64>,
                           _ real_In: Double, _ real_Out: UnsafeMutablePointer<Double>,
                           _ str_In: String, _ str_Out: inout String,
                           _ int1D_In: UnsafeMutablePointer<Int32>, _ int1D_Out: UnsafeMutablePointer<Int32>,
                           _ long1D_In: UnsafeMutablePointer<Int64>, _ long1D_Out: UnsafeMutablePointer<Int64>,
                           _ real1D_In: UnsafeMutablePointer<Double>, _ real1D_Out: UnsafeMutablePointer<Double>,
                           _ int2D_In: UnsafeMutablePointer<(Int32, Int32, Int32)>, _ int2D_Out: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ long2D_In: UnsafeMutablePointer<(Int64, Int64, Int64)>, _ long2D_Out: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                           _ real2D_In: UnsafeMutablePointer<(Double, Double, Double)>, _ real2D_Out: UnsafeMutablePointer<(Double, Double, Double)>) {

    let _char_In = char_In.utf8CString[0]
    var _char_Out = CChar(0)
    let _str_In = str_In.cString
    var _str_Out = emptyCcharArray(size: INPUTCARDLEN)            //[INPUTCARDLEN = 512]

    TestInterface(_char_In, &_char_Out,
                  int_In, int_Out,
                  long_In, long_Out,
                  real_In, real_Out,
                  _str_In, &_str_Out,
                  int1D_In, int1D_Out,
                  long1D_In, long1D_Out,
                  real1D_In, real1D_Out,
                  int2D_In, int2D_Out,
                  long2D_In, long2D_Out,
                  real2D_In, real2D_Out)

    char_Out = String(UnicodeScalar(UInt8(bitPattern: _char_Out)))
    str_Out = String(fromCcharArray: _str_Out, size: INPUTCARDLEN)

}
