//
//  Logger.swift
//  MovieDB
//
//  Created by 60156720 on 12/9/25.
//

public class Logger {
    public enum enumLogEventType: String {
        case Error  = "‼️ "
        case Info   = "ℹ️ "
        case Trace  = "💬 "
        case Hot    = "🔥 "
    }
    
    public
    class func log(_ message: String, logType: enumLogEventType = .Trace,
                   fileName: String = #file,
                   line: Int = #line,
                   funcName: String = #function) {
#if DEBUG
        print("\(logType.rawValue)[\(sourceFileName(filePath: fileName))]:\(line) \(funcName) -> \(message)")
#endif
    }
    
    private
    class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}
