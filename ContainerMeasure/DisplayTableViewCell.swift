//
//  DisplayTableViewCell.swift
//  ContainerMeasure
//
//  Created by @karthi on 29/08/22.
//

import UIKit
import AWSCore
import AWSRekognition


class DisplayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var infoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func populateCell(_ data:AWSRekognitionTextDetection) {
        var str = ""
        if let detectionText = data.detectedText {
            str = "Detected Text -> \(detectionText)"
        }
        if let condidence = data.confidence {
            str = str + "\n Confidence -> \(condidence.description)"
        }
        
        let type = data.types.rawValue
        str = str + "\n Type -> \(type.description)"
        
        if let boundingBox = data.geometry?.boundingBox?.debugDescription {
            str = str + "\n Bounding Box -> \(boundingBox)"
        }
        
        if let polygon = data.geometry?.polygon?.debugDescription {
            str = str + "\n Polygon -> \(polygon)"
        }
    
        self.infoLabel.text = str
    }
    
    class func getNib() -> UINib {
        let nib = UINib(nibName: "DisplayTableViewCell", bundle: nil)
        return nib
    }
    
}
