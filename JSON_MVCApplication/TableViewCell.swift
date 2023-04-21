//
//  TableViewCell.swift
//  JSON_MVCApplication
//
//  Created by mr.jb on 04/04/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lbl1: UILabel!
    @IBOutlet var lblk2: UILabel!
    @IBOutlet var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
