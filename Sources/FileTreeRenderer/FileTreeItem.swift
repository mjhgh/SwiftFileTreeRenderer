import Foundation

public protocol FileTreeItem {
  func render(fileManager: FileManager, at path: String) throws
}

extension FileTreeItem {
  public var asDir: Dir? {
    return self as? Dir
  }
  public var asFile: File? {
    return self as? File
  }
  public var asFileSymbolLink: FileSymbolLink? {
    return self as? FileSymbolLink
  }
}
