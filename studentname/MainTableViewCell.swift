//
//  TableViewCell.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/07/07.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet var label : UILabel!
    @IBOutlet var photo : UIImageView!
    @IBOutlet var viewf : UIView!
    @IBOutlet var views : UIView!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       photo.layer.cornerRadius = 22
       photo.layer.borderWidth = 3
        viewf.layer.cornerRadius = 22
        views.layer.cornerRadius = 22
        viewf.layer.borderColor = UIColor.black.cgColor
        viewf.layer.borderWidth = 1
        views.layer.borderColor = UIColor.black.cgColor
        views.layer.borderWidth = 1
    }
    
    
   
}
