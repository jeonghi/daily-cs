```swift
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

```

실행환경: M1 Max (Apple 실리콘)
예상결과: Little-endian
실행결과: Little-endian

- Little-endian의 장점
일반적인 인간의 읽기 쓰기 방식에는 불편하지만, 컴퓨터 연산에 유리

- UInt32 타입으로 정의한 이유
32비트 크기의 부호 없는 정수형이라 엔디안 검사에 적합

- 내 CPU가 메모리에 쓰는 word 단위
arm64 아키텍쳐로 64비트(=8바이트)로 저장함.


- LLDB로 디버깅 하기
1. swift 파일 컴파일
`swiftc -g -o endian endian.swift`
2. lldb 실행
`lldb ./endian`
3. 브레이크 포인트 걸고 실행 (5번 라인 포인터 읽어오는 코드)
`breakpoint set --file endian.swift --line 5`
`run`
4. bytes 메모리에서 읽어오기 (얘를 들어 0x10008000에 word단위로 1이 저장되어있음.)
`memory read 0x10008000`

5.
0x100008000: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
0x100008010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

위에서 
0x100008000: 01 00 00 00 <- 여기까지만 봐도 무방 4*8 = 32비트
리틀엔디안 방식으로 0x100008000에 0x01(=1) 이 저장된 걸 알 수 있음.