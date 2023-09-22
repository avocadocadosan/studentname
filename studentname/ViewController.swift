//
//  ViewController.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/09/04.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet var nametext: UITextField!
    @IBOutlet var birthdaytext: UITextField!
    @IBOutlet var gradetext: UITextField!
    @IBOutlet var classtext: UITextField!
    @IBOutlet var comiteetext: UITextField!
    @IBOutlet var clubtext: UITextField!
    @IBOutlet var telephonetext: UITextField!
    @IBOutlet var linetext: UITextField!
    @IBOutlet var backbutton: UIButton!
    @IBOutlet var entrybutton: UIButton!
    let realm = try! Realm()
    var memo: Results<Memo>!
    var editmemo: Memo!
   var category: String = " "
    var feature: String = " "
     var nickname: String = " "
  var detail: String = " "
 var number:Int = 0
     var partnumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        entrybutton.layer.cornerRadius = 15
        entrybutton.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        entrybutton.layer.borderWidth = 1
        
        backbutton.layer.cornerRadius = 15
        backbutton.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        backbutton.layer.borderWidth = 1
        
    }
    
    @IBAction func hennsyuu(){
        memo = realm.objects(Memo.self)
        try! realm.write{
            editmemo.name = nametext.text!
            editmemo.Birthday = birthdaytext.text!
            editmemo.Comitee = comiteetext.text!
            editmemo.Club = clubtext.text!
            editmemo.grade = gradetext.text!
            editmemo.Class = classtext.text!
            editmemo.telephone = telephonetext.text!
            editmemo.male = linetext.text!
            editmemo.category = category
            editmemo.nickname = nickname
            editmemo.feature = feature
            editmemo.nickname = nickname
            editmemo.detail = detail
            editmemo.number = number
            editmemo.partnumber = partnumber
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
