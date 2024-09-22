# C언어와 Swift Bridge 하기

1. C코드와 C헤더 파일 작성 (`hello.c`, `hello.h` 참고)
2. 브릿징 헤더 파일 작성 (링킹하려는 C 헤더들 몽땅 때려박기)
3. swift 소스와 c 파일 함께 컴파일 & 링킹하기 & 실행하기
```bash
swiftc -import-objc-header Bridging-Header.h main.swift hello.c -o BridgeTestingApp
./BridgeTestingApp
```