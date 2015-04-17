//
//  ViewController.swift
//  Pat Murray
//
//  Created by Patrick Murray on 15/04/2015.
//  Copyright (c) 2015 Patrick Murray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var panoview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Parse intro.rtf into textview.attributedText
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("intro", ofType: "rtf")
        var dataRTF : NSData = NSData(contentsOfFile: path!)!
        var printString : NSAttributedString = NSAttributedString(data: dataRTF, options: nil, documentAttributes: nil, error: nil)!
        textView.attributedText = printString
        
        image.layer.borderWidth=1.0
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.whiteColor().CGColor
        image.layer.cornerRadius = 13
        image.layer.cornerRadius = image.frame.size.height/2
        image.clipsToBounds = true
        
        var motionView:PanoramaView = PanoramaView(frame: panoview.bounds)
        motionView.setImage(UIImage(named:"bgImage1")!)
        motionView.setScrollIndicatorEnabled(true)
        panoview.addSubview(motionView)
        
    }

    @IBAction func displayMoreInformationButtonTapped(sender: AnyObject) {
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

