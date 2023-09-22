//
//  TableViewEditCell.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/09/08.
//

import UIKit

class TableViewEditCell: UITableViewCell {
    @IBOutlet var mainlabel : UILabel!
    @IBOutlet var textfield : UITextField!
    @IBOutlet var view : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
