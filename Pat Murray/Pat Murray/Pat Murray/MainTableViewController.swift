//
//  MainTableViewController.swift
//  Pat Murray
//
//  Created by Patrick Murray on 16/04/2015.
//  Copyright (c) 2015 Patrick Murray. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    enum CellType {
        case Header
        case Text
        case Photo
    }

// MARK: - Declarations
    
    let array = ["About Me","intro2","bgImage1","intro2","intro"]
    let array2 : [(type: CellType, content: String)] = [(.Header, "Patrick Murray"), (.Text, "intro"), (.Photo, "bgImage"), (.Photo, "Profile"), (.Text, "intro2"), (.Photo, "Profile")]
    
    let headerIdentifier = "headerCell"
    let textIdentifier = "textCell"
    let imageIdentifier = "photoCell"
    
// MARK: - View lifescycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// MARK: - Table View
    // MARK: Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array2.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let typeOfCell : CellType = array2[indexPath.row].type
        let content : String = array2[indexPath.row].content
        
        switch typeOfCell {
        case .Header:
            return headerCellAtIndexPath(indexPath, content: content)
        case .Text:
            return textCellAtIndexPath(indexPath, content: content)
        case .Photo:
            return photoCellAtIndexPath(indexPath, content: content)
        }
        
    }
    
    
    // MARK: Cell setup
    
    func headerCellAtIndexPath(indexPath: NSIndexPath, content: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(headerIdentifier, forIndexPath: indexPath) as! HeaderTableViewCell
        cell.loadItem(content, image: "Profile")
        return cell
    }
    
    func textCellAtIndexPath(indexPath: NSIndexPath, content: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textIdentifier, forIndexPath: indexPath) as! TextTableViewCell
        cell.loadItem(content)
        return cell
    }
    
    func photoCellAtIndexPath(indexPath: NSIndexPath, content: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(imageIdentifier, forIndexPath: indexPath) as! ImageTableViewCell
        cell.loadItem(content)
        return cell
    }

}
