//
//  Services.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/16/22.
//

import Foundation

public let IDX_ERR_NONE  = 0        // Ok
public let IDX_ERR_WARN  = 1        // Warning
public let IDX_ERR_ERROR = 2        // Error


//
//MARK: String Extension
//

extension String {

    public func trimRight() -> String {
        String(reversed().drop { $0.isWhitespace }.reversed())
    }

    public var cString: UnsafeMutablePointer<Int8> {
        get {
            let count = self.utf8.count + 1
            let result = UnsafeMutablePointer<Int8>.allocate(capacity: count)
            self.withCString { (baseAddress) in
                result.initialize(from: baseAddress, count: count)
            }
            return result
        }
    }

    public func toCcharArray(size: Int = 512) -> [Int8] {
        assert(!self.isEmpty)
        assert(self.count < size+1)

        let arrayBase = Array(repeating: CChar(0), count: Int(size)+1 - self.count)
        let arrayChar = self.utf8.map { Int8(bitPattern: $0) }
        return arrayChar + arrayBase

    }

    public init(fromCcharArray array: [Int8], size: Int) {
        var _array = array
        _array[size] = 0
        self = String(cString: _array).trimRight()
    }

}

public func emptyCcharArray(size: Int) -> [Int8] {

    Array(repeating: Int8(0), count: size+1)

}
