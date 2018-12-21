//
//  NMultipleSelectionTableViewCell.swift
//  NMultiSelect
//
//  Created by ITRS-676 on 12/21/18.
//  Copyright © 2018 Sunday Mobility. All rights reserved.
//

import UIKit

class NMultipleSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }

}
