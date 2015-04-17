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
    let array2 : [(type: CellType, content: String)] = [(.Header, "Patrick Murray"), (.Text, "intro"), (.Text, "intro2"), (.Photo, "bgImage"), (.Photo, "Profile"), (.Photo, "Profile")]
    
    let headerIdentifier = "headerCell"
    let textIdentifier = "textCell"
    let imageIdentifier = "photoCell"
    
// MARK: - View lifescycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clearColor()
        view.backgroundColor = .clearColor()
        tableView.estimatedRowHeight = 60.0;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.contentInset = UIEdgeInsetsMake(80, 0, 0, 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// MARK: - Table View
    // MARK: Tablr view delegate
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let typeOfCell : CellType = array2[indexPath.row].type
        switch typeOfCell {
        case .Header:
            return 190
        case .Photo:
            return 130
        case .Text:
            return UITableViewAutomaticDimension
        }
        
    }
    
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
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.attributedText = getAttributedText(content)
        cell.textLabel?.numberOfLines = 0
        cell.backgroundColor = .clearColor()
        cell.selectionStyle = .None
        return cell
    }
    
    func photoCellAtIndexPath(indexPath: NSIndexPath, content: String) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCellWithIdentifier(imageIdentifier, forIndexPath: indexPath) as! ImageTableViewCell
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.imageView?.image = UIImage(named: content)
        // cell.loadItem(content)
        return cell
    }
    
    func getAttributedText(content: String) -> NSAttributedString {
        
        let rtfNamed = content
        let bundle = NSBundle.mainBundle()
        NSLog("rtfNamed = \(rtfNamed)")
        let path = bundle.pathForResource(rtfNamed, ofType: "rtf")!
        let dataRTF : NSData = NSData(contentsOfFile: path)!
        var printString : NSAttributedString = NSAttributedString(data: dataRTF, options: nil, documentAttributes: nil, error: nil)!
        return printString
    }


}
