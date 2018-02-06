//
//  CustomTableViewCell.swift
//  MakeInventory
//
//  Created by Erick Sanchez on 2/5/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var labelDateCreated: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
