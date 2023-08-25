//
//  DetailViewController.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/07/14.
//

import UIKit
import RealmSwift


class DetailViewController: UIViewController {

    @IBOutlet var whiteview : UIView!
    @IBOutlet var blueview : UIView!
    @IBOutlet var  partimage : UIImageView!
    @IBOutlet var editbutton : UIButton!
    @IBOutlet var arrowbutton : UIButton!
    @IBOutlet var featurelabel : UILabel!
    @IBOutlet var namelabel : UILabel!
    @IBOutlet var underline : UIView!
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var contentView : UIView!
    
    let realm = try! Realm()
    var memo : Memo!
    let imageArray = ["body","emotion","school","friend","activity"]
    let titleArray = ["魅力","長所","学校","思い出","課外活動"]
    var row = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        whiteview.layer.cornerRadius = 20
        whiteview.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        whiteview.layer.borderWidth = 1
        
        blueview.layer.cornerRadius = 20
        blueview.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        blueview.layer.borderWidth = 1
        
        editbutton.layer.cornerRadius = 20
        editbutton.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        editbutton.layer.borderWidth = 1
        
        arrowbutton.layer.cornerRadius = 20
        arrowbutton.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        arrowbutton.layer.borderWidth = 1
        
        partimage.layer.cornerRadius = 15
        partimage.layer.borderColor = CGColor(red: 247/255, green: 231/255, blue: 158/255, alpha: 1.0)
        partimage.layer.borderWidth = 4
        
        underline.layer.cornerRadius = 6
        
        navigationItem.leftBarButtonItem = nil
        //戻るボタンを消す
       
        scrollView.contentSize = contentView.frame.size
        scrollView.flashScrollIndicators()
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        namelabel.text = memo.nickname
        featurelabel.text = memo.feature
        row = memo.number
        partimage.image = UIImage(named: imageArray[row])
        
    }
    
    
    @IBAction func back(){
        print("test")
        dismiss(animated: true)
    }
    
   

}
