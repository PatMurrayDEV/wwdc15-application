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

    let array = ["About Me","intro2","bgImage1","intro2","intro"]
    let array2 : [(type: CellType, content: String)] = [(.Header, "About Me"), (.Text, "intro"), (.Photo, "bgImage"), (.Photo, "Profile")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return array2.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let typeOfCell : CellType = array2[indexPath.row].type
        let content : String = array2[indexPath.row].content
        
        switch typeOfCell {
        case .Header:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath) as! HeaderTableViewCell
            cell.loadItem(content, image: "Profile")
            return cell
        case .Text:
            let cell = tableView.dequeueReusableCellWithIdentifier("textCell", forIndexPath: indexPath) as! TextTableViewCell
            cell.loadItem(content)
            return cell
        case .Photo:
            let cell = tableView.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath) as! ImageTableViewCell
            cell.loadItem(content)
            return cell
        }
        
//        switch indexPath.row {
//        case 0:
//            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath) as! HeaderTableViewCell
//            cell.loadItem(array[indexPath.row], image: "bgImage1")
//            return cell
//        case 1:
//            let cell = tableView.dequeueReusableCellWithIdentifier("textCell", forIndexPath: indexPath) as! TextTableViewCell
//            cell.loadItem(array[indexPath.row])
//            return cell
//        case 2:
//            let cell = tableView.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath) as! ImageTableViewCell
//            cell.loadItem("bgImage1")
//            return cell
//        case 3:
//            let cell = tableView.dequeueReusableCellWithIdentifier("textCell", forIndexPath: indexPath) as! TextTableViewCell
//            cell.loadItem(array[indexPath.row])
//            return cell
//        case 4:
//            let cell = tableView.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath) as! ImageTableViewCell
//            cell.loadItem("bgImage1")
//            return cell
//        default:
//            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath) as! HeaderTableViewCell
//            cell.loadItem(array[indexPath.row], image: "bgImage1")
//            return cell
//        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
