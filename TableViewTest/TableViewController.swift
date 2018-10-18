//
//  TableViewController.swift
//  TableViewTest
//
//  Created by Sujit Molleti on 10/17/18.
//  Copyright © 2018 Sujit Molleti. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

 //   var names: [String] = ["Salman", "Vineeth", "Shashank"]
    var names: [String: [String]] = [
        "A": ["Andi", "Ayush"],
        "S": ["Salman", "Shashank", "Sujit"],
        "B": ["Ben", "Benjamin"]
    ]
    
    
    var sectionNames: [String]{
        return names.keys.sorted() //["A", "B", "S"]
        //option then click on function to see doumentation of method
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionNames.count
        //right-click --> refactor: renames all variables or anything
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let currentSection = sectionNames[section] // "A"
        guard let currNames = names[currentSection] // "Andi", "Ayush"
            else{ return 0 }
        return currNames.count // 2
        //count == .length in java
    }
 
//returns section name
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section] // A, B, or S
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //only use guard for optional variables
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell")
            else{ return UITableViewCell() } //else is for if the function fails
        // dequeueReusableCells --> reusing cells that are already made bc it would take a lot of memory ie Instagram
        //takes cell out, edits it, and then replaces it
        
        let currentSection = sectionNames[indexPath.section] // "A"
        guard let currNames = names[currentSection] // "Andi", "Ayush"
            else{ return UITableViewCell() }
        //code stops at question mark if nothing returns for textLabel
        cell.textLabel?.text = currNames[indexPath.row]
        return cell
        
    }



}
