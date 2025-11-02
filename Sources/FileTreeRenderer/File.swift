import Foundation

public struct File: FileTreeItem {
  public let name: String
  public let content: Data
  public init(_ name: String, data: Data) {
    self.name = name
    self.content = data
  }
  public init(_ name: String, content: FileBody) {
    self.init(name, data: content.data)
  }

  public func render(fileManager: FileManager, at path: String) throws {
    let filePath = (path as NSString).appendingPathComponent(name)
    let created = fileManager.createFile(
      atPath: filePath, contents: content, attributes: nil)
    if !created {
      throw FileTree.FileCreatedError(path: filePath)
    }
  }
}
