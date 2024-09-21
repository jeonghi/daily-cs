import Foundation

var number: UInt32 = 1
let isLittleEndian = withUnsafeBytes(of: &number) { bytes -> Bool in
    return bytes[0] == 1
}

if isLittleEndian {
    print("Little-endian")
} else {
    print("Big-endian")
}
