//
//  FNVHash.swift
//
//  Created by Mauricio Santos on 3/9/15.
//  Copyright (c) 2015 Mauricio Santos. All rights reserved.
//

// A Swift implementation of the Fowler–Noll–Vo FNV hash function
// See http://www.isthe.com/chongo/tech/comp/fnv/

import Foundation

// Int size in bytes
private let IntSize = sizeof(UInt8)

// FNV parameters

private let OffsetBasis: UInt = (IntSize == 4) ? 2166136261: 14695981039346656037
private let FNVPrime: UInt = (IntSize == 4) ? 16777619: 1099511628211


public func fnv1(bytes: [UInt8]) -> UInt {
    var hash = OffsetBasis
    for byte in bytes {
        hash = hash &* FNVPrime // &* means multiply with overflow
        hash ^= UInt(byte)
    }
    return hash
}

public func fnv1a(bytes: [UInt8]) -> UInt {
    var hash = OffsetBasis
    for byte in bytes {
        hash ^= UInt(byte)
        hash = hash &* FNVPrime
    }
    return hash
}

public func fnv1(str: String) -> UInt {
    return fnv1(bytesFromString(str))
}

public func fnv1a(str: String) -> UInt {
    return fnv1a(bytesFromString(str))
}

public func fnv1<T: IntegerType>(value: T) -> UInt {
    return fnv1(bytesFromNumber(value))
}

public func fnv1a<T: IntegerType>(value: T) -> UInt {
    return fnv1a(bytesFromNumber(value))
}

public func fnv1<T: FloatingPointType>(value: T) -> UInt {
    return fnv1(bytesFromNumber(value))
}

public func fnv1a<T: FloatingPointType>(value: T) -> UInt {
    return fnv1a(bytesFromNumber(value))
}

// Private helper functions

private func bytesFromString(str: String) -> [UInt8] {
    var byteArray = [UInt8]()
    for codeUnit in str.utf8 {
        byteArray.append(codeUnit)
    }
    return byteArray
}

private func bytesFromNumber<T>(var value: T) -> [UInt8] {
    return withUnsafePointer(&value) {
        Array(UnsafeBufferPointer(start: UnsafePointer<UInt8>($0), count: sizeof(T)))
    }
}