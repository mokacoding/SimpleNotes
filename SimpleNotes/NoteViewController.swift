//
//  Copyright © 2015 mokacoding. All rights reserved.

import UIKit

class NoteViewController: UIViewController {

  var note: Note?

  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var contentLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    guard let note = note else {
      preconditionFailure("Loaded view without a note model")
    }

    nameLabel.text = note.name
    contentLabel.text = note.content

    view.accessibilityIdentifier = "note_screen"
  }
}
