[Swift-FNV-Hash](github.com/mauriciosantos/Swift-FNV-Hash)
====================
**A Swift implementation of the Fowler–Noll–Vo (FNV) hash function**

This code provides platform independent implementations of the FNV-1 and FNV-1a hash functions in pure Swift. Computes 64-bit hashes on 64-bit devices and 32 bit hashes on 32 bit devices.

How to use
--------------------

```swift
// Strings

let fnv1Hash = fnv1("test")
let fnv1aHash = fnv1a("test")

// Integers, Floats, Doubles

let fnv1Hash = fnv1(5)
let fnv1aHash = fnv1a(5.5)

// Raw bytes

let bytes: [UInt8] = [10, 20, 30]

let fnv1Hash = fnv1(bytes)
let fnv1aHash = fnv1a(bytes)
});
```
 
Additional information
--------------------

[Fowler–Noll–Vo hash function](http://en.wikipedia.org/wiki/Fowler%E2%80%93Noll%E2%80%93Vo_hash_function)

Contact
--------------------

Mauricio Santos, [mauriciosantoss@gmail.com](mailto:mauriciosantoss@gmail.com)
