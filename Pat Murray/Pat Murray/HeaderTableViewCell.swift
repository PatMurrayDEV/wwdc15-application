//
//  HeaderTableViewCell.swift
//  Pat Murray
//
//  Created by Patrick Murray on 16/04/2015.
//  Copyright (c) 2015 Patrick Murray. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Circle crop the hero image
        headerImageView.layer.borderWidth=1.0
        headerImageView.layer.masksToBounds = false
        headerImageView.layer.borderColor = UIColor.whiteColor().CGColor
        headerImageView.layer.cornerRadius = 13
        headerImageView.layer.cornerRadius = headerImageView.frame.size.height/2
        headerImageView.clipsToBounds = true

    }
    
    func loadItem(title : String, image : String){
        let headerImage : UIImage = UIImage(named: image)!
        headerImageView.image = headerImage
        headerTitleLabel.text = title

        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
