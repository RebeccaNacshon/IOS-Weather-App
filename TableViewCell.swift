//
//  TableViewCell.swift
//  WeatherRebecca
//
//  Created by admin on 29/04/2017.
//  Copyright © 2017 iOS Dev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var date: UILabel!
    @IBOutlet var descriptionImage: UIImageView!
    @IBOutlet var temp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
