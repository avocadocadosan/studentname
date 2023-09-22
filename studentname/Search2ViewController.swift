//
//  Search2ViewController.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/09/01.
//

import UIKit
import RealmSwift

class Search2ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
   

    let realm = try! Realm()
    var memo: Results<Memo>!
    let imageArray = ["body","emotion","school","friend","activity"]
    let titleArray = ["魅力","長所","学校","思い出","課外活動"]
    let bodyArray = ["髪","顔","手足","服装","身長"]
    let emotionArray = ["性格","行動"]
    let schoolArray = ["委員会","部活","クラブ","生徒会"]
    let friendArray = ["遊び","幼稚園、学校"]
    let activityArray = ["学生団体","ボランティア","習い事"]
    var number : Int!
    var partnumber : Int!
    var memonumber : Int!
    var index : Int!
    
   @IBOutlet var tableview : UITableView!
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var  modorubutton : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        tableview.dataSource = self
        tableview.delegate = self
        modorubutton.layer.cornerRadius = 15
          modorubutton.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
          modorubutton.layer.borderWidth = 1
          
    }
    
    override func viewWillAppear(_ animated: Bool) {
        partnumber = 0
        memo = realm.objects(Memo.self).filter("number == %@", number).filter("partnumber == %@", partnumber)
        //pickerView.selectRow(0, inComponent: 0, animated: false)
        tableview.reloadData()
        
        tableview.register(UINib(nibName: "TableViewSearchCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent numberOfRowInComponentcomponent: Int) -> Int {
        
        if(number==0){ return bodyArray.count}
        else if(number==1){ return emotionArray.count}
        else if(number==2){ return schoolArray.count}
        else if(number==3){ return friendArray.count}
        else if(number==4){ return activityArray.count}
        return 0
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
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
     memo = realm.objects(Memo.self).filter("number == %@", number).filter("partnumber == %@", partnumber)
       
    tableview.reloadData()

    }
    
    
    @IBAction func modoru(){
        dismiss(animated: true, completion: nil)
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(memo==nil){
            return 0
        }else{
            return memo.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewSearchCell
        cell.detaillabel!.text = memo[indexPath.row].detail
        cell.namelabel!.text = memo[indexPath.row].nickname
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
            // セルの選択を解除
            tableview.deselectRow(at: indexPath, animated: true)
     
            // 別の画面に遷移
        index = indexPath.row
            performSegue(withIdentifier: "toDetailViewController", sender: nil)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewController"{
            let nextVC = segue.destination as! DetailViewController
            nextVC.memo = memo[index]
            
        }
    }

}
