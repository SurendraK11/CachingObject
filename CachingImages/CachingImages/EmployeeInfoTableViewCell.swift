//
//  EmployeeInfoTableViewCell.swift
//  CachingImages
//
//  Created by Surendra on 03/05/2019.
//  Copyright © 2019 Surendra. All rights reserved.
//

import UIKit

class EmployeeInfoTableViewCell: UITableViewCell {

    @IBOutlet var employeePhoto: UIImageView!
    @IBOutlet var employeeName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
