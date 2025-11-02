import Foundation

public struct Dir: FileTreeItem {
  public let name: String
  public let children: [FileTreeItem]

  public init(_ name: String, @FileTree _ content: () -> [FileTreeItem] = { [] }) {
    self.name = name
    self.children = content()
  }

  public func render(fileManager: FileManager, at path: String) throws {
    let dirPath = (path as NSString).appendingPathComponent(name)
    try fileManager.createDirectory(
      atPath: dirPath, withIntermediateDirectories: true, attributes: nil)
    for child in children {
      try child.render(fileManager: fileManager, at: dirPath)
    }
  }
}
