//
//  ResultDataCell.swift
//  ContainerMeasure
//
//  Created by @karthi on 29/08/22.
//

import UIKit

class ResultDataCell: UITableViewCell {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var inputImage: UIImageView!
    
    @IBOutlet weak var seeMoreBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.seeMoreBtn.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func getNib() -> UINib {
        let nib = UINib(nibName: "ResultDataCell", bundle: nil)
        return nib
    }
    
}
