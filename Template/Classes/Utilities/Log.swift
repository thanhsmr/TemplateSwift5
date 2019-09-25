import Foundation

class Log {
    class func debug<T>(_ object: @autoclosure () -> T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        #if DEBUG
            let value = object()
            let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
            let queue = Thread.isMainThread ? "Main Thread" : "Background Thread"
            
            print("<\(queue)> \(fileURL) \(function)[\(line)]: " + String(reflecting: value))
        #endif
    }
}
