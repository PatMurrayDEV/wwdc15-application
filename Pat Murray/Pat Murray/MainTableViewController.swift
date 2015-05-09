//
//  MainTableViewController.swift
//  Pat Murray
//
//  Created by Patrick Murray on 16/04/2015.
//  Copyright (c) 2015 Patrick Murray. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    // MARK: - Declarations
    
    // Table view cell identifiers
    let headerIdentifier = "headerCell"
    let textIdentifier = "textCell"
    let imageIdentifier = "imageCell"

    // Singleton instance of ContentObject and its content
    let contentObject = ContentObject.sharedInstance
    var currentObjContent = ContentObject.sharedInstance.currentContent
    
    // MARK: - View lifescycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up visual appearance of table view
        tableView.backgroundColor = .clearColor()
        view.backgroundColor = .clearColor()
        tableView.estimatedRowHeight = 60.0;
        tableView.rowHeight = UITableViewAutomaticDimension; // Ensure tableview knows to expect dynamic row heights
        tableView.contentInset = UIEdgeInsetsMake(60, 0, 50, 0) // Add padding to scrollview
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        if contentObject.currentContent != currentObjContent {
            // If CurrentObject.currentContent changes (from menu) reload tableview and scroll to top
            tableView.reloadData()
            tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            currentObjContent = contentObject.currentContent // set local instance of currentObjContent to match shared instance
        }
    }
    
    // MARK: - Table View
    // MARK: Table view delegate
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // Determine the type of cell and if it should have a fixed height
        let object = contentObject.getArray()
        let array = object.array
        let typeOfCell : ContentObject.CellType = array[indexPath.row].type
        
        switch typeOfCell {
        case .Header:
            return 190
        case .Photo:
            return 130
        case .Text:
            return UITableViewAutomaticDimension // Text cells should have a dynamic height calculated at runtime
        }
    }
    
    // MARK: Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentObject.getArray().array.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Determine the type of cell and pass relevent data to setup func
        let typeOfCell : ContentObject.CellType = contentObject.getArray().array[indexPath.row].type // type of cell
        let content : String = contentObject.getArray().array[indexPath.row].content // cell content
        
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
    func headerCellAtIndexPath(indexPath: NSIndexPath, content: String) -> UITableViewCell { // Setup for Header cell
        let cell = tableView.dequeueReusableCellWithIdentifier(headerIdentifier, forIndexPath: indexPath) as! HeaderTableViewCell
        cell.loadItem(content, image: contentObject.getArray().headerImage)
        return cell
    }
    
    func textCellAtIndexPath(indexPath: NSIndexPath, content: String) -> UITableViewCell { // Setup for Text cell
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: textIdentifier) // employs a default tableviewcell with attributed label
        cell.textLabel?.attributedText = getAttributedText(content) // pass name of rtf document get back attributed text
        cell.textLabel?.numberOfLines = 0
        cell.backgroundColor = .clearColor()
        cell.selectionStyle = .None
        return cell
    }
    
    func photoCellAtIndexPath(indexPath: NSIndexPath, content: String) -> UITableViewCell { // Setup for Image cell
        let cell = tableView.dequeueReusableCellWithIdentifier(imageIdentifier, forIndexPath: indexPath) as! ImageTableViewCell
        cell.loadItem(content)
        return cell
    }
    
    // MARK: Cell Tapped
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let typeOfCell : ContentObject.CellType = contentObject.getArray().array[indexPath.row].type // type of cell
        let content : String = contentObject.getArray().array[indexPath.row].content // cell content
        
        if typeOfCell == .Photo { // If type is an image display popover containing the image
            let popup = PopoverDetailViewController(nibName: nil, bundle: nil)
            popup.modalPresentationStyle = .Popover
            popup.image = UIImage(named: content)
            self.presentViewController(popup, animated: true, completion: nil)
        }
    }
    
    // MARK: - Attributed label from RTF
    func getAttributedText(content: String) -> NSAttributedString {
        // Get the content of a cell (the name of an rtf document) and convert it into NSAttributedString before returning
        let rtfNamed = content
        let bundle = NSBundle.mainBundle()
        let path : String = bundle.pathForResource(rtfNamed, ofType: "rtf")!
        let dataRTF : NSData = NSData(contentsOfFile: path)!
        var printString : NSAttributedString = NSAttributedString(data: dataRTF, options: nil, documentAttributes: nil, error: nil)!
        return printString
    }
    
}
