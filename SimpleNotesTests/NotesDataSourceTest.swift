//
//  NotesDataSourceTest.swift
//  SimpleNotes
//
//  Created by Giovanni on 27/10/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import XCTest
@testable import SimpleNotes

class NotesDataSourceTest: XCTestCase {

  // it sorts the notes by updated date
  func testSortsNotesByUpdatesDate() {
    let firstNote = Note(name: "any name", content: "any content", lastUpdated: NSDate().dateByAddingTimeInterval(60))
    let secondNote = Note(name: "any other name", content: "any content", lastUpdated: NSDate())
    let thirdNote = Note(name: "yet another name", content: "any content", lastUpdated: NSDate().dateByAddingTimeInterval(-60))

    let sut = NotesDataSource(notes: [thirdNote, firstNote, secondNote])

    assert(sut.noteAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)), isEqualTo: firstNote)
    assert(sut.noteAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)), isEqualTo: secondNote)
    assert(sut.noteAtIndexPath(NSIndexPath(forRow: 2, inSection: 0)), isEqualTo: thirdNote)
  }

  private func assert(note: Note, isEqualTo otherNote: Note) {
    XCTAssertEqual(note.name, otherNote.name)
  }
}
