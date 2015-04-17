//
//  TextTableViewCell.swift
//  Pat Murray
//
//  Created by Patrick Murray on 16/04/2015.
//  Copyright (c) 2015 Patrick Murray. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeightContraint : NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .None
        textView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        
    }
    
    func loadItem(rtfNamed : String){
        // Parse intro.rtf into textview.attributedText
        let bundle = NSBundle.mainBundle()
        NSLog("rtfNamed = \(rtfNamed)")
        let path = bundle.pathForResource(rtfNamed, ofType: "rtf")!
        var dataRTF : NSData = NSData(contentsOfFile: path)!
        var printString : NSAttributedString = NSAttributedString(data: dataRTF, options: nil, documentAttributes: nil, error: nil)!
        textView.attributedText = printString
        textView.layoutIfNeeded()
        println(textView.bounds.height )
        self.bounds.size.height = textView.bounds.height + 40
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
