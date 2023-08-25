//
//  AdditionViewController.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/07/14.
//

import UIKit
import RealmSwift

class AdditionViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource  {
   
    
    
    let realm = try! Realm()
    var memo: Results<Memo>!
    let imageArray = ["body","emotion","school","friend","activity"]
    let titleArray = ["魅力","長所","学校","思い出","課外活動"]
    let bodyArray = ["髪","顔","手足","服装","身長"]
    let emotionArray = ["性格","行動"]
    let schoolArray = ["委員会","部活","クラブ","生徒会"]
    let friendArray = ["遊び","幼稚園、学校"]
    let activityArray = ["学生団体","ボランティア","習い事"]
    
    @IBOutlet var  entrybutton : UIButton!
    @IBOutlet var  modorubutton : UIButton!
    @IBOutlet var  partimage : UIImageView!
    @IBOutlet var  parttext : UITextField!
    @IBOutlet var  nametext : UITextField!
    @IBOutlet var pickerView: UIPickerView!
    var part : String!
    var name : String!
    var number : Int!
    var partnumber: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
   
      modorubutton.layer.cornerRadius = 15
        modorubutton.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        modorubutton.layer.borderWidth = 1
        
        partimage.layer.cornerRadius = 15
        partimage.layer.borderColor = CGColor(red: 41/255, green: 179/255, blue: 196/255, alpha: 1.0)
        partimage.layer.borderWidth = 2
        
        entrybutton.layer.cornerRadius = 15
        entrybutton.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        entrybutton.layer.borderWidth = 1
        
        parttext.layer.cornerRadius = 20
        parttext.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        parttext.layer.borderWidth = 1
        
        nametext.layer.cornerRadius = 20
        nametext.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        nametext.layer.borderWidth = 1
        //memo = realm.objects(Memo.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        partimage.image = UIImage(named: imageArray[number])
        partnumber = 0
    }
    
    func read() -> Memo? {
        return realm.objects(Memo.self).first
        //このメソッドでRealmにアクセスして、メモの情報を読み出している
        
    }
    
    @IBAction func touroku(){
        memo = realm.objects(Memo.self)
        part = parttext.text
        name = nametext.text
        let newMemo = Memo()
        newMemo.nickname = name
        newMemo.detail = part
        newMemo.category = titleArray[number]
        newMemo.number = number
        newMemo.partnumber = partnumber
        if(number==0){newMemo.feature = bodyArray[partnumber] }
        else if(number==1){newMemo.feature = emotionArray[partnumber]}
        else if(number==2){ newMemo.feature = schoolArray[partnumber]}
        else if(number==3){ newMemo.feature = friendArray[partnumber]}
        else if(number==4){newMemo.feature = activityArray[partnumber] }
   
        try! realm.write{
            realm.add(newMemo)
        }
        self.tabBarController?.selectedIndex = 0;
        
        let nextVC = self.presentingViewController as! TabViewController
        print(nextVC)
     let goVC = nextVC.viewControllers![0] as! MainViewController
        print(goVC)
       
       dismiss(animated: false)

    }
    
    @IBAction func modoru(){
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent numberOfRowInComponentcomponent: Int) -> Int {
        if(number==0){ return bodyArray.count}
        else if(number==1){ return emotionArray.count}
        else if(number==2){ return schoolArray.count}
        else if(number==3){ return friendArray.count}
        else if(number==4){ return activityArray.count}
        return 0
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(number==0){ return bodyArray[row] }
        else if(number==1){ return emotionArray[row] }
        else if(number==2){ return schoolArray[row] }
        else if(number==3){ return friendArray[row] }
        else { return activityArray[row] }
    
       
        
    }
   
    func pickerView(_ pickerView: UIPickerView,didSelectRow row: Int, inComponent component: Int) {
     partnumber = row
    }

}
