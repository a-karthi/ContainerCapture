//
//  DisplayTableViewCell.swift
//  ContainerMeasure
//
//  Created by @karthi on 29/08/22.
//

import UIKit

class DisplayTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func getNib() -> UINib {
        let nib = UINib(nibName: "DisplayTableViewCell", bundle: nil)
        return nib
    }
    
}
