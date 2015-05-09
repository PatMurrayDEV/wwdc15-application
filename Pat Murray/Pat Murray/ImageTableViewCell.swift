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
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .None
        detailImageView.clipsToBounds = true
    }
    
    func loadItem(detailString: String) {
        var detailImage = UIImage(named: detailString)!
        detailImageView.image = detailImage
        self.backgroundColor = .clearColor()
    }

}
