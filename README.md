# swift-fuzzer

## Build the project

xcrun --toolchain swift swift build -v -c debug -Xswiftc -DFUZZ -Xswiftc -sanitize=fuzzer -Xswiftc -parse-as-library -Xswiftc Sources/main.swift

## Run libFuzzer

./.build/release/example-swift
