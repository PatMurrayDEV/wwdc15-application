//
//  MenuViewController.swift
//  Pat Murray
//
//  Created by Patrick Murray on 16/04/2015.
//  Copyright (c) 2015 Patrick Murray. All rights reserved.
//

import UIKit
import QuickLook

class MenuViewController: UIViewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    
    // MARK: - Declarations
    // Menu buttons
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var projectsButton: UIButton!
    @IBOutlet weak var educationButton: UIButton!
    @IBOutlet weak var interestsButton: UIButton!
    
    // Singleton instance of ContentObject
    let contentObject = ContentObject.sharedInstance
    

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate() // update the statusbar
        // Setup the background images for the menu buttons based on contentObject
        setButtons(aboutButton, image: contentObject.getImages(.About))
        setButtons(projectsButton, image: contentObject.getImages(.Projects))
        setButtons(educationButton, image: contentObject.getImages(.Education))
        setButtons(interestsButton, image: contentObject.getImages(.Interests))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent // set preffered statusbar colour to light to compliment the dark background image
    }
    
    // MARK: - Menu Buttons
    func setButtons(button: UIButton, image: UIImage) {
        // Round buttons and set background image & colour
        button.setBackgroundImage(image, forState: .Normal)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.whiteColor().CGColor
        button.layer.masksToBounds = false
        button.clipsToBounds = true
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        // Set shared instance of ContentObject to selected button
        switch sender.tag {
        case 1:
            contentObject.currentContent = .About
        case 2:
            contentObject.currentContent = .Projects
        case 3:
            contentObject.currentContent = .Education
        case 4:
            contentObject.currentContent = .Interests
        default:
            contentObject.currentContent = .About
        }
        self.dismissViewControllerAnimated(true, completion: nil) // dismiss menu
    }
    
    // MARK: - License QuickLook
    // This populates and shows a QuickLook controller so that the user can see appropriate Licenses for others code and artwork used in this project.
    // To view these licenses open LICENSE.txt under "Supporting Files" group in the project navigator
    @IBAction func licenseButtonTapped(sender: AnyObject) {
        var licenseView : QLPreviewController = QLPreviewController()
        licenseView.delegate = self
        licenseView.dataSource = self
        self.presentViewController(licenseView, animated:true, completion:nil)
        self.previewController(licenseView, previewItemAtIndex: 0)
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

}
