//
//  EditViewController.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/09/08.
//

//
//  DetailViewController.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/07/14.
//

import UIKit
import RealmSwift

// (追記)情報持たせるClass

class EditViewController: UIViewController {
    
    @IBOutlet var whiteview : UIView!
    @IBOutlet var blueview : UIView!
    @IBOutlet var  partimage : UIImageView!
    @IBOutlet var editbutton : UIButton!
    @IBOutlet var arrowbutton : UIButton!
    @IBOutlet var featurelabel : UILabel!
    @IBOutlet var namelabel : UILabel!
    @IBOutlet var underline : UIView!
    @IBOutlet private weak var tableView: UITableView!
    let realm = try! Realm()
    var memo : Memo!
    var result: Results<Memo>!
    var editmemo: Memo!
    var category: String = " "
    var feature: String = " "
    var nickname: String = " "
    var detail: String = " "
    var number:Int = 0
    var partnumber:Int = 0
    
    var nametext:String = " "
    var birthdaytext: String = " "
    var gradetext: String = " "
    var classtext: String = " "
    var comiteetext:String = " "
    var clubtext: String = " "
    var telephonetext:String = " "
    var linetext:String = " "
    
    
    // (追記)セクションに表示するタイトル名の入った配列
    let sectionTitle: [String] = ["名前", "学校", "連絡先"]
    
    // (追記)それぞれの情報を２住配列として準備する(ここはRealmのデータから取り出せるといいかも)
    var dArray = [[Memo(), Memo()],
                  [Memo(), Memo(), Memo(), Memo()],
                  [Memo(),Memo()]]
    
    
    
    let imageArray = ["body","emotion","school","friend","activity"]
    let titleArray = ["魅力","長所","学校","思い出","課外活動"]
    let realmArray = ["name","Birthday","grade","Class","Comitee","Club","telephone","male"]
    var row = 0
    var num = 0
    var sec : Int = 0
    
    //var info: Results<Info>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewDetailCell", bundle: nil), forCellReuseIdentifier: "InputTextCell")
        
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
        if(memo.number==0){
            partimage.layer.borderColor = CGColor(red: 111/255, green: 101/255, blue: 136/255, alpha: 1.0)
            featurelabel.textColor = UIColor(red: 111/255, green: 101/255, blue: 136/255, alpha: 1.0)
        }else if (memo.number==1){
            partimage.layer.borderColor = CGColor(red: 125/255, green: 169/255, blue: 144/255, alpha: 1.0)
            featurelabel.textColor = UIColor(red: 125/255, green: 169/255, blue: 144/255, alpha: 1.0)
            
        }else if (memo.number==2){
            partimage.layer.borderColor = CGColor(red: 200/255, green: 155/255, blue: 81/255, alpha: 1.0)
            featurelabel.textColor =  UIColor(red: 200/255, green: 155/255, blue: 81/255, alpha: 1.0)
        }else if (memo.number==3){
            partimage.layer.borderColor = CGColor(red: 247/255, green: 231/255, blue: 158/255, alpha: 1.0)
            featurelabel.textColor = UIColor(red: 247/255, green: 231/255, blue: 158/255, alpha: 1.0)
        }else if (memo.number==4){
            partimage.layer.borderColor = CGColor(red: 41/255, green: 179/255, blue: 196/255, alpha: 1.0)
            featurelabel.textColor = UIColor(red: 41/255, green: 179/255, blue: 196/255, alpha: 1.0)
        }
        partimage.layer.borderWidth = 1.5
        
        underline.layer.cornerRadius = 6
        
        navigationItem.leftBarButtonItem = nil
        
        
        tableView.delegate = self
        tableView.dataSource = self
        // (追記)カスタムのSectionHeaderをTableViewに設定する
        let header = UINib.init(nibName: "SectionHeader", bundle: Bundle.main)
        tableView.register(header, forHeaderFooterViewReuseIdentifier: "Header")
    }
    
    // (追記)Section番号を取得するためのメソッド(indexPath的なのを取得できる)
    func getSection(header: UITableViewHeaderFooterView) -> Int? {
        let point = CGPoint(x: header.frame.midX, y: header.frame.midY)
        var i: Int? = nil
        for s in 0 ..< dArray.count {
            if tableView.rectForHeader(inSection: s).contains(point) {
                i = s
                break
            }
        }
        return i
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        namelabel.text = memo.nickname
        featurelabel.text = "\(memo.feature)　\(memo.detail)"
        featurelabel.adjustsFontSizeToFitWidth = true
        row = memo.number
        partimage.image = UIImage(named: imageArray[row])
        tableView.reloadData()
        
        
        
    }
    
    
    @IBAction func back(){
        print("test")
        dismiss(animated: true)
    }
    @IBAction func hennsyuu(){
                
               result = realm.objects(Memo.self)
                try! realm.write{
                    editmemo.name = nametext
                    editmemo.Birthday = birthdaytext
                    editmemo.Comitee = comiteetext
                    editmemo.Club = clubtext
                    editmemo.grade = gradetext
                    editmemo.Class = classtext
                    editmemo.telephone = telephonetext
                    editmemo.male = linetext
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
    
    
    
}



// (追記)TableViewに関する処理
extension EditViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! SectionHeader
        header.sectoionHeaderDelegate = self
        // ここでsectionTitleの要素からタイトルを設定する
        header.rowBtn.setTitle(sectionTitle[section], for: .normal)
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dArray[section].filter{ $0.showsSelf == true }.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewEditCell
        
        if(indexPath.row==0&&indexPath.section==0){
            cell.mainlabel.text = "名前"
            nametext = cell.textfield.text!
        }else if (indexPath.row==1&&indexPath.section==0){
            cell.mainlabel.text = "誕生日"
            birthdaytext = cell.textfield.text!
        }else if (indexPath.row==0&&indexPath.section==1){
            cell.mainlabel.text = "学年"
            gradetext = cell.textfield.text!
        }else if(indexPath.row==1&&indexPath.section==1){
            cell.mainlabel.text = "クラス"
           classtext = cell.textfield.text!
        }else if (indexPath.row==2&&indexPath.section==1){
            cell.mainlabel.text = "委員会"
           comiteetext = cell.textfield.text!
        }else if (indexPath.row==3&&indexPath.section==1){
            cell.mainlabel.text = "部活"
            clubtext = cell.textfield.text!
        }else if (indexPath.row==0&&indexPath.section==2){
            cell.mainlabel.text = "電話番号"
          telephonetext = cell.textfield.text!
        }else if (indexPath.row==1&&indexPath.section==2){
            cell.mainlabel.text = "ライン"
            linetext = cell.textfield.text!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}
// (追記)セクションタイトルに関する処理
extension EditViewController: SectionHeaderDelegate {
    
    func rowsBtnDidTap(_ header: UITableViewHeaderFooterView) {
        guard let seciton = getSection(header: header) else { return }
        let indexPaths = dArray[seciton].enumerated().map { IndexPath(row: $0.offset, section: seciton)}
        let isVisible = dArray[seciton].first!.showsSelf
        dArray[seciton].forEach { $0.showsSelf = isVisible ? false : true }
        
        if isVisible {
            tableView.deleteRows(at: indexPaths, with: .top)
        } else {
            tableView.insertRows(at: indexPaths, with: .top)
        }
    }
    
}
