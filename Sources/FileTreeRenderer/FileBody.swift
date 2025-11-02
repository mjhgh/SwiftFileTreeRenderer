import Foundation

/// A struct representing the body/content for File(name, content: FileBody).
/// convenient struct for making Extension
/// ```swift
/// extension FileBody {
///  static func packageJson(name: String, version: String) -> FileBody { """{"name": "\(name)", "version": "\(version)"}""" }
/// }
/// // Then used
/// File("package.json", content: .packageJson(name: "MyApp", version: "1.0.0"))
///
/// ````
public struct FileBody: ExpressibleByStringLiteral {
  public let data: Data

  public init(stringLiteral value: String) {
    self.data = value.data(using: .utf8) ?? Data()
  }
}
