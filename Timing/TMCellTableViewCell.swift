//
//  TMCellTableViewCell.swift
//  Timing
//
//  Created by Rflpz on 20/10/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

import UIKit

class TMCellTableViewCell: UITableViewCell {

    @IBOutlet var imgCategory: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
