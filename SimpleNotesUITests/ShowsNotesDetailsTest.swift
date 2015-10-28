//
//  ShowsNotesDetailsTest.swift
//  SimpleNotes
//
//  Created by Giovanni on 27/10/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import XCTest

class ShowsNotesDetailsTest: XCTestCase {

  override func setUp() {
    super.setUp()

    continueAfterFailure = false
    XCUIApplication().launch()
  }

  func testShowsNotesDetails() {
    // From the notes list screen
    let app = XCUIApplication()

    XCTAssertTrue(app.anyViewWithIdentifier("notes_list_screen").exists)

    // When tapping on a note
    app.cells.elementBoundByIndex(1).tap()

    // It goes to the note details screen
    XCTAssertFalse(app.anyViewWithIdentifier("notes_list_screen").exists)
    XCTAssertTrue(app.anyViewWithIdentifier("note_screen").exists)

    // Go back
    app.backButton().tap()
  }

}

extension XCUIApplication {
  func anyViewWithIdentifier(identifier: String) -> XCUIElement {
    return self.descendantsMatchingType(.Any)
      .elementMatchingType(.Any, identifier: identifier)
  }

  func backButton() -> XCUIElement {
    return self.navigationBars.childrenMatchingType(.Button)
      .matchingIdentifier("Back")
      .elementBoundByIndex(0)
  }
}
