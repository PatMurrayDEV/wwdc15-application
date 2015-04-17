//
//  MenuViewController.swift
//  Pat Murray
//
//  Created by Patrick Murray on 16/04/2015.
//  Copyright (c) 2015 Patrick Murray. All rights reserved.
//

import UIKit
import QuickLook

class MenuViewController: UIViewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate{

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func licenseButtonTapped(sender: AnyObject) {
        
        var licenseView : QLPreviewController = QLPreviewController()
        licenseView.delegate = self
        licenseView.dataSource = self
        self.previewController(licenseView, previewItemAtIndex: 0)
        self.presentViewController(licenseView, animated:true, completion:nil)
        
    }

    func numberOfPreviewItemsInPreviewController(controller: QLPreviewController!) -> Int {
        return 1
    }
    
    func previewController(controller: QLPreviewController!, previewItemAtIndex index: Int) -> QLPreviewItem! {
        
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("LICENSE", ofType: "txt")
        let url : NSURL = NSURL(fileURLWithPath: path!)!
        return url
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
