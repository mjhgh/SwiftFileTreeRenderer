import Foundation

@resultBuilder
public struct FileTree: FileTreeItem {
  struct FileCreatedError: Error {
    let path: String
  }

  public static func buildArray(_ components: [[any FileTreeItem]]) -> [any FileTreeItem] {
    components.flatMap { $0 }
  }
  public static func buildBlock(_ components: FileTreeItem...) -> [FileTreeItem] {
    return components
  }
  public static func buildOptional(_ component: [any FileTreeItem]?) -> [any FileTreeItem] {
    component ?? []
  }

  public static func buildEither(first component: [any FileTreeItem]) -> [any FileTreeItem] {
    component
  }

  public static func buildEither(second component: [any FileTreeItem]) -> [any FileTreeItem] {
    component
  }

  @discardableResult
  public init(@FileTree _ content: () -> [FileTreeItem]) {
    self.content = content()
  }
  public let content: [FileTreeItem]

  public func render(
    fileManager: FileManager = .default,
    at path: String = FileManager.default.currentDirectoryPath
  ) throws {
    for child in content {
      try child.render(fileManager: fileManager, at: path)
    }
  }
}
