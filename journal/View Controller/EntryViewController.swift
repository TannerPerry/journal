//
//  EntryViewController.swift
//  journal
//
//  Created by Tanner Perry on 11/17/21.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet weak var entryTitleTextField: UILabel!
    @IBOutlet weak var entryBodyTextField: UILabel!
    
    var entry: Entry?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        print(entry ?? "no data")

    }
    
    private func updateViews() {
        guard let entry = entry, isViewLoaded else { return }
        entryTitleTextField.text = entry.title
        entryBodyTextField.text = entry.body
    }
    

    
}
