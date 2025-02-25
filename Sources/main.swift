import Foundation

@_cdecl("LLVMFuzzerTestOneInput") public func fuzzMe(data: UnsafePointer<CChar>, size: CInt) -> CInt {
    let buffer = UnsafeBufferPointer(start: data, count: Int(size))
    guard buffer.count >= 7 else {
	 return 1
    }
    if
	buffer[0] == 0x46,
	buffer[1] == 0x55,
	buffer[2] == 0x5a,
	buffer[3] == 0x5a,
	buffer[4] == 0x49,
	buffer[5] == 0x4e,
	buffer[6] == 0x47
    {
	fatalError()
    }
    return 0
}

// #if !FUZZ
// @main
// enum SVGFuzzer {
//     static func main() {
//         print("You should not run SVGFuzzer.main")
//     }
// }
// #endif