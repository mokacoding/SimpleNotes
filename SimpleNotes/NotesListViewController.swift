//
//  ViewController.swift
//  SimpleNotes
//
//  Created by Giovanni on 27/10/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit

class NotesListViewController: UITableViewController {

  let dataSource = NotesDataSource(notes: [
    Note(name: "First note", content: "Lorem ipsum", lastUpdated: NSDate().dateByAddingTimeInterval(-60*60*24)),
    Note(name: "Second note", content: "Lorem ipsum", lastUpdated: NSDate()),
    Note(name: "Third note", content: "Lorem ipsum", lastUpdated: NSDate().dateByAddingTimeInterval(-3*60*60*24)),
  ])

  let cellIdentifier = "cell"
  let showNoteSegueIdentifier = "showNote"

  lazy var dateFormatter: NSDateFormatter = {
    let f = NSDateFormatter()
    f.dateStyle = .LongStyle
    return f
  }()

  // MARK: View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "📝"

    tableView.tableFooterView = UIView()

    view.accessibilityIdentifier = "notes_list_screen"
  }

  // MARK: Segue

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let identifier = segue.identifier {
      switch identifier {
      case showNoteSegueIdentifier:
        guard let boxedNote = sender as? Box<Note> else {
          preconditionFailure("Expecting a valid boxed note")
        }

        guard let viewController = segue.destinationViewController as? NoteViewController else {
          preconditionFailure("Expecting destination view controller to be a NoteViewController")
        }

        viewController.note = boxedNote.value
        break
      default:
        break
      }
    }
  }

  // MARK: UITableViewDataSource

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.numberOfNotes()
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

    let note = dataSource.noteAtIndexPath(indexPath)

    cell.textLabel?.text = note.name
    cell.detailTextLabel?.text = dateFormatter.stringFromDate(note.lastUpdated)
    cell.accessoryType = .DisclosureIndicator

    return cell
  }
}
