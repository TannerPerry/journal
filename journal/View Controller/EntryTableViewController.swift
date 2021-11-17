//
//  EntryTableViewController.swift
//  journal
//
//  Created by Tanner Perry on 11/16/21.
//

import UIKit

class EntryTableViewController: UITableViewController {
    
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryBodyTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadInputViews()
        EntryController.shared.loadFromPersistanceStore()
    }

    @IBAction func addEntryButtonTapped(_ sender: Any) {
        guard let entryTitle = entryTitleTextField.text, !entryTitle.isEmpty,
              let entryBody = entryBodyTextField.text, !entryBody.isEmpty else { return }
        EntryController.shared.createEntry(title: entryTitle, body: entryBody, time: Date())
        entryBodyTextField.text = ""
        entryTitleTextField.text = ""
        print(EntryController.shared.entries)
        tableView.reloadData()
        
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count

    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        let entry = EntryController.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        print(cell)
        return cell
    }



    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entryToDelete = EntryController.shared.entries[indexPath.row]
            EntryController.shared.deleteEntry(entry: entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toJournalEntry" {
                print("correct identifier")
                guard let indexPath = tableView.indexPathForSelectedRow,
                      let destination = segue.destination as? EntryViewController else { return }
                
                let entry = EntryController.shared.entries[indexPath.row]
                destination.entry = entry
            }
    }
    

}


