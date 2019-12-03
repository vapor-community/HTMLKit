import NIO
import Dispatch

@inlinable func _toCapacity(_ value: Int) -> UInt32 {
    return UInt32(truncatingIfNeeded: value)
}

@inlinable func _toIndex(_ value: Int) -> UInt32 {
    return UInt32(truncatingIfNeeded: value)
}

public struct UnsafeByteBuffer {
    @usableFromInline let _storage: UnsafeRawPointer
    @usableFromInline var _readerIndex: UInt32 = 0
    @usableFromInline var _capacity: UInt32
    
    @inlinable
    public init(pointer: UnsafeRawPointer, size: Int) {
        self._storage = pointer
        self._capacity = _toCapacity(size)
    }
    
    @inlinable
    mutating func _moveReaderIndex(to newIndex: UInt32) {
        assert(newIndex >= 0 && newIndex <= _capacity)
        self._readerIndex = newIndex
    }

    @inlinable
    mutating func _moveReaderIndex(forwardBy offset: Int) {
        let newIndex = self._readerIndex + _toIndex(offset)
        self._moveReaderIndex(to: newIndex)
    }
    
    public mutating func moveReaderIndex(forwardBy offset: Int) {
        let newIndex = self._readerIndex + _toIndex(offset)
        precondition(newIndex >= 0 && newIndex <= _capacity, "new readerIndex: \(newIndex), expected: range(0, \(_capacity))")
        self._moveReaderIndex(to: newIndex)
    }
    
    public mutating func moveReaderIndex(to offset: Int) {
        let newIndex = _toIndex(offset)
        precondition(newIndex >= 0 && newIndex <= _capacity, "new readerIndex: \(newIndex), expected: range(0, \(_capacity))")
        self._moveReaderIndex(to: newIndex)
    }
    
    public var readerIndex: Int {
        return Int(self._readerIndex)
    }
    
    public var capacity: Int {
        return Int(_capacity)
    }
    
    public var readableBytes: Int { return Int(self._capacity - self._readerIndex) }
    
    public func getUnsafeSlice(at index: Int, length: Int) -> UnsafeByteBuffer? {
        guard index >= 0 && length >= 0 && index >= self.readerIndex && index <= capacity - length else {
            return nil
        }
        
        return UnsafeByteBuffer(pointer: _storage + index, size: length)
    }
    
    public mutating func readUnsafeSlice(length: Int) -> UnsafeByteBuffer? {
        return getUnsafeSlice(at: self.readerIndex, length: length).map {
            self._moveReaderIndex(forwardBy: length)
            return $0
        }
    }
    
    @inlinable
    public func withUnsafeReadableBytes<T>(_ body: (UnsafeRawBufferPointer) throws -> T) rethrows -> T {
        return try body(.init(start: _storage + readerIndex, count: self.readableBytes))
    }
    
    public func getString(at index: Int, length: Int) -> String? {
        guard let range = self.rangeWithinReadableBytes(index: index, length: length) else {
            return nil
        }
        
        return self.withUnsafeReadableBytes { pointer in
            assert(range.lowerBound >= 0 && (range.upperBound - range.lowerBound) <= pointer.count)
            return String(decoding: UnsafeRawBufferPointer(rebasing: pointer[range]), as: Unicode.UTF8.self)
        }
    }
    
    public mutating func readString(length: Int) -> String? {
        return self.getString(at: self.readerIndex, length: length).map {
            self._moveReaderIndex(forwardBy: length)
            return $0
        }
    }
    
    public func getDispatchData(at index: Int, length: Int) -> DispatchData? {
        guard let range = self.rangeWithinReadableBytes(index: index, length: length) else {
            return nil
        }
        return self.withUnsafeReadableBytes { pointer in
            return DispatchData(bytes: UnsafeRawBufferPointer(rebasing: pointer[range]))
        }
    }
    
    public mutating func readDispatchData(length: Int) -> DispatchData? {
        return self.getDispatchData(at: self.readerIndex, length: length).map {
            self._moveReaderIndex(forwardBy: length)
            return $0
        }
    }
    
    @discardableResult
    @inlinable
    public mutating func readWithUnsafeReadableBytes(_ body: (UnsafeRawBufferPointer) throws -> Int) rethrows -> Int {
        let bytesRead = try self.withUnsafeReadableBytes(body)
        self._moveReaderIndex(forwardBy: bytesRead)
        return bytesRead
    }
    
    @inlinable
    public mutating func readWithUnsafeReadableBytes<T>(_ body: (UnsafeRawBufferPointer) throws -> (Int, T)) rethrows -> T {
        let (bytesRead, ret) = try self.withUnsafeReadableBytes(body)
        self._moveReaderIndex(forwardBy: bytesRead)
        return ret
    }
    
    @inlinable
    func _toEndianness<T: FixedWidthInteger> (value: T, endianness: Endianness) -> T {
        switch endianness {
        case .little:
            return value.littleEndian
        case .big:
            return value.bigEndian
        }
    }

    /// Read an integer off this `ByteBuffer`, move the reader index forward by the integer's byte size and return the result.
    ///
    /// - parameters:
    ///     - endianness: The endianness of the integer in this `ByteBuffer` (defaults to big endian).
    ///     - as: the desired `FixedWidthInteger` type (optional parameter)
    /// - returns: An integer value deserialized from this `ByteBuffer` or `nil` if there aren't enough bytes readable.
    @inlinable
    public mutating func readInteger<T: FixedWidthInteger>(endianness: Endianness = .little, as: T.Type = T.self) -> T? {
        if readerIndex + MemoryLayout<T>.size >= capacity {
            return nil
        }
        
        return self.getInteger(at: self.readerIndex, endianness: endianness, as: T.self).map {
            self._moveReaderIndex(forwardBy: MemoryLayout<T>.size)
            return $0
        }
    }

    /// Get the integer at `index` from this `ByteBuffer`. Does not move the reader index.
    /// The selected bytes must be readable or else `nil` will be returned.
    ///
    /// - parameters:
    ///     - index: The starting index of the bytes for the integer into the `ByteBuffer`.
    ///     - endianness: The endianness of the integer in this `ByteBuffer` (defaults to big endian).
    ///     - as: the desired `FixedWidthInteger` type (optional parameter)
    /// - returns: An integer value deserialized from this `ByteBuffer` or `nil` if the bytes of interest are not
    ///            readable.
    @inlinable
    public func getInteger<T: FixedWidthInteger>(at index: Int, endianness: Endianness = .little, as: T.Type = T.self) -> T? {
        let value = self._storage.advanced(by: index).bindMemory(to: T.self, capacity: 1).pointee
        return _toEndianness(value: value, endianness: endianness)
    }
}

extension UnsafeByteBuffer {
    @inlinable
    func rangeWithinReadableBytes(index: Int, length: Int) -> Range<Int>? {
        let indexFromReaderIndex = index - self.readerIndex
        guard indexFromReaderIndex >= 0 && length >= 0 && indexFromReaderIndex <= self.readableBytes - length else {
            return nil
        }
        return indexFromReaderIndex ..< (indexFromReaderIndex+length)
    }
}

extension UnsafeByteBuffer {
    @inlinable
    mutating func parseSlice() throws -> UnsafeByteBuffer {
        guard
            let length = readInteger(as: UInt32.self),
            let slice = readUnsafeSlice(length: Int(length))
        else {
            throw TemplateError.internalCompilerError
        }
        
        return slice
    }
    
    @inlinable
    mutating func skipSlice() throws {
        guard
            let length = readInteger(as: UInt32.self)
        else {
            throw TemplateError.internalCompilerError
        }
        
        moveReaderIndex(forwardBy: Int(length))
    }
    
    @inlinable
    mutating func parseString() throws -> String {
        guard
            let length = readInteger(as: UInt32.self),
            let string = readString(length: Int(length))
        else {
            throw TemplateError.internalCompilerError
        }
        
        return string
    }
}

extension ByteBuffer {
    @inlinable
    mutating func parseSlice() throws -> ByteBuffer {
        guard
            let length = readInteger(as: UInt32.self),
            let slice = readSlice(length: Int(length))
        else {
            throw TemplateError.internalCompilerError
        }
        
        return slice
    }
}

extension ByteBuffer {
    @inlinable
    mutating func writeBytes(_ buffer: UnsafeByteBuffer) {
        _ = buffer.withUnsafeReadableBytes { buffer in
            _ = self.writeBytes(buffer)
        }
    }
}
