//
//  UserTableViewCell.swift
//  MVVMBindingDemo
//
//  Created by Meet Shingala on 24/06/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblDesc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
