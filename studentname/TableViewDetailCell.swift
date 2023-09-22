//
//  TableViewDetailCell.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/09/03.
//

import UIKit

class TableViewDetailCell: UITableViewCell {

    @IBOutlet var mainlabel : UILabel!
    @IBOutlet var detaillabel : UILabel!
    @IBOutlet var view : UIView!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        view.layer.cornerRadius = 3
    }
    
}
