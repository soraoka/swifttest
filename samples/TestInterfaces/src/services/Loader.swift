//===-------------------------  Loader.swift  -----------------------------===//
//
// This source file is based on part of the Swift.org open source project
//
//===----------------------------------------------------------------------===//

#if os(Windows)
import WinSDK
#elseif os(iOS) || os(macOS) || os(tvOS) || os(watchOS)
import Darwin
#else
import Glibc
#endif

#if os(Windows)
public typealias LibHandle = HMODULE
public typealias FunctionPtr = FARPROC
#else
public typealias LibHandle = UnsafeMutableRawPointer
public typealias FunctionPtr = UnsafeMutableRawPointer
#endif

var libHandles = [LibHandle]()               // keep the handles in an array

//
//MARK: Dynamic Library Services
//
public func loadAllDlls() {
}

public func loadDll(_ dllName: String) -> LibHandle {
    guard let libHandle = Loader.load(getDylibPath() + dllName, mode: 1) else {
        fatalError("Could not open '\(getDylibPath() + dllName)' ..")
    }

    libHandles.append(libHandle)                   // put another handle in the pile

    return libHandle
}

/// Use an empty `enum` to create the `Loader` namespace
enum Loader { }

extension Loader {
    static func load(_ path: String?, mode: Int32) -> LibHandle? {
#if os(Windows)
        guard let libHandle = path?.withCString(encodedAs: UTF16.self, LoadLibraryW) else {
            print("LoadLibraryW failure: \(GetLastError())")
            return nil
        }
#else
        guard let libHandle = dlopen(path, mode) else {
            print("dlopen failure")
            return nil
        }
#endif
        return libHandle
    }

    static func lookup(_ functionName: String, in libHandle: LibHandle) -> FunctionPtr {
#if os(Windows)
        guard let functionPointer = GetProcAddress(libHandle, functionName) else {
            fatalError("GetProcAddress failure:")
        }
#else
        guard let functionPointer = dlsym(libHandle, functionName) else {
            fatalError("dlsym failure:")
        }
#endif
        return functionPointer
    }

    static func unload(_ libHandle: LibHandle) {
#if os(Windows)
        guard FreeLibrary(libHandle) else {
            fatalError("FreeLibrary failure: \(GetLastError())")
        }
#else
        guard dlclose(libHandle) == 0 else {
            fatalError("dlclose failure")
        }
#endif
    }

}

func getDylibPath() -> String { "" }

func getFunctionPointer(_ libHandle: LibHandle,
                        _ functionName: String) -> FunctionPtr {

    Loader.lookup(functionName, in: libHandle)

}

public func unsafeFunctionSignatureCast<U>(_ value: FunctionPtr,
                                           to type: U.Type) -> U {

    return unsafeBitCast(value, to: type)

}
