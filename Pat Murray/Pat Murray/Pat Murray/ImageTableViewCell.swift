//
//  ImageTableViewCell.swift
//  Pat Murray
//
//  Created by Patrick Murray on 16/04/2015.
//  Copyright (c) 2015 Patrick Murray. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .None
    }
    
    func loadItem(detailString: String){
        NSLog("rtfNamed = \(detailString)")
        var detailImage = UIImage(named: detailString)!
        detailImageView.image = detailImage
        bgImageView.image = detailImage
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
