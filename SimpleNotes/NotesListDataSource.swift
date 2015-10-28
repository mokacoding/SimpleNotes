//
//  NotesDataSource.swift
//  SimpleNotes
//
//  Created by Giovanni on 27/10/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import Foundation

struct NotesDataSource {
  private let notes: [Note]

  init(notes: [Note]) {
    self.notes = notes
  }

  func numberOfNotes() -> Int {
    return notes.count
  }

  func noteAtIndexPath(indexPath: NSIndexPath) -> Note {
    return notes[indexPath.row]
  }
}
