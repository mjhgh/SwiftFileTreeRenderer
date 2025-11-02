import Foundation

public struct FileSymbolLink: FileTreeItem {
  public let name: String
  public let destination: String

  public init(_ name: String, destination: String) {
    self.name = name
    self.destination = destination
  }

  public func render(fileManager: FileManager, at path: String) throws {
    let linkPath = (path as NSString).appendingPathComponent(name)
    try fileManager.createSymbolicLink(atPath: linkPath, withDestinationPath: destination)
  }
}
