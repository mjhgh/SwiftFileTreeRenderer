import FileTreeRenderer
import Foundation
import Testing

@Suite
struct FileTreeTests {
  @Test("FileTreeRendererTest tests")
  func example() throws {
    class MockFileManager: FileManager {
      var createdFiles: [String: String] = [:]
      var createdDirectories: [String] = []

      override func createFile(
        atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey: Any]? = nil
      ) -> Bool {
        createdFiles[path] = String(data: data ?? Data(), encoding: .utf8)
        return true
      }

      override func createDirectory(
        atPath path: String, withIntermediateDirectories createIntermediates: Bool,
        attributes attr: [FileAttributeKey: Any]? = nil
      ) throws {
        createdDirectories.append(path)
      }
    }

    let mockFileManager = MockFileManager()
    let tree = FileTree {
      Dir("Tmp") {
        Dir("FileTreeRenderer") {
          File("FileTreeRenderer.swift", content: "import Foundation")
          File("What.swift", content: "What")
        }
        File("README.md", content: "README.md Stuff")
      }
    }
    try tree.render(fileManager: mockFileManager, at: "/mock/path")

    // Check directories
    #expect(mockFileManager.createdDirectories.contains("/mock/path/Tmp"))
    #expect(mockFileManager.createdDirectories.contains("/mock/path/Tmp/FileTreeRenderer"))

    // Check files
    #expect(
      mockFileManager.createdFiles["/mock/path/Tmp/FileTreeRenderer/FileTreeRenderer.swift"]
        == "import Foundation")
    #expect(mockFileManager.createdFiles["/mock/path/Tmp/FileTreeRenderer/What.swift"] == "What")
    #expect(mockFileManager.createdFiles["/mock/path/Tmp/README.md"] == "README.md Stuff")
  }
}
