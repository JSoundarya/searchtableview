//
//  CompanyTableViewCell.swift
//  SplitViewExample
//
//  Created by 419764 on 1/10/18.
//  Copyright © 2018 Cognizant. All rights reserved.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var companyName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
