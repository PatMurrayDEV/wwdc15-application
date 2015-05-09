//
//  ViewController.swift
//  Pat Murray
//
//  Created by Patrick Murray on 15/04/2015.
//  Copyright (c) 2015 Patrick Murray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Declarations
    @IBOutlet weak var panoview: UIView! // UIView that will hold the panorama image
    @IBOutlet weak var menuButton: UIButton! // UIButton at the bottom of the screen that calls the menu
    @IBOutlet weak var viewContainer: UIView! // View Container that holds the table view
    @IBOutlet weak var visualEffectView: UIVisualEffectView! // blur view
    var displayOn : Bool = true // Bool to determine if content is covering the background panorama
    
    
    // MARK: - Status Bar
    override func prefersStatusBarHidden() -> Bool {
        if displayOn == false {
            return true // if content cannot be viewed hide the status bar
        } else {
            return false // if content can be viewed showed the status bar
        }
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Fade
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up paning panorama
        var motionView:PanoramaView = PanoramaView(frame: panoview.bounds) // create a PanoramaView
        
        let img : UIImage? = UIImage(named:"bgImage1") // Create optional image with background image
        if img != nil {
            // if "img" exists set up and add PanoramaView to "panoview"
            motionView.setImage(img!)
            motionView.setScrollIndicatorEnabled(true)
            panoview.addSubview(motionView)
        }
        
        // round and add border to the menu button
        menuButton.layer.cornerRadius = 0.5 * menuButton.bounds.size.width
        menuButton.layer.borderColor = UIColor.whiteColor().CGColor
        menuButton.layer.borderWidth = 1.0
        menuButton.layer.masksToBounds = false
        menuButton.clipsToBounds = true
        menuButton.backgroundColor = UIColor(red:0.41, green:0.67, blue:1, alpha:1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Show background
    @IBAction func doubleTap() {
        switch displayOn {
        case true:
            // Animate view off the screen
            UIView.animateWithDuration(0.5, animations: {
                self.menuButton.alpha = 0.0
                self.viewContainer.alpha = 0.0
                self.visualEffectView.bounds = CGRect(x: 0, y: self.view.bounds.height, width: self.view.bounds.width, height: 0)
                }, completion: {
                    (value: Bool) in self.displayOn = false
                    self.setNeedsStatusBarAppearanceUpdate()
            })
        case false:
            // Animate View on the screen
            UIView.animateWithDuration(0.5, animations: {
                self.menuButton.alpha = 1.0
                self.viewContainer.alpha = 1.0
                self.visualEffectView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
                }, completion: {
                    (value: Bool) in self.displayOn = true
                    self.setNeedsStatusBarAppearanceUpdate()
            })
        default:
            // Impossible case for BOOL displayOn occured. Reseting view and logging event
            NSLog("Impossible Case - displayOn BOOL has reached an impossible case")
            self.menuButton.alpha = 1.0
            self.viewContainer.alpha = 1.0
            self.visualEffectView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
            self.displayOn = true
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

}

