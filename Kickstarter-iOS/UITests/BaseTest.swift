import XCTest
import UIKit

internal class BaseTest: TestCase {

  internal let app = XCUIApplication()

  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    self.app.launch()
  }

  override func tearDown() {
    super.tearDown()
    let screenshot = XCUIScreen.main.screenshot()
    let fullScreenshotAttachment = XCTAttachment(screenshot: screenshot)
    fullScreenshotAttachment.lifetime = .deleteOnSuccess
    add(fullScreenshotAttachment)
    app.terminate()
  }

  func findAll(_ type: XCUIElement.ElementType) -> XCUIElementQuery {
    return self.app.descendants(matching: type)
  }

  func testTst() {
    _ = RootTabBar.init()
      .tapActivity()
      .tapSearch()
      .tapProfile()
      .tapExplore()
  }
}

extension XCTestCase {
  func wait(for element: XCUIElement, timeout: TimeInterval) {
    let predicate = NSPredicate(format: "exists == 1")
    expectation(for: predicate, evaluatedWith: element)
    waitForExpectations(timeout: timeout)
  }
}
