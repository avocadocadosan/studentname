
import UIKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    let realm = try! Realm()
    var memo: Results<Memo>!

    @IBOutlet var table : UITableView!
//    @IBOutlet var setting : UIButton!
    @IBOutlet var search: UISearchBar!
    
    @IBOutlet var menuButton: UIButton!
   
    var number : Int!
    var index : Int!
    let imageArray = ["body","emotion","school","friend","activity"]
    
    enum MenuType: String {
           case all = "全て"
           case body = "魅力"
           case emotion = "長所"
        case school = "学校"
        case friend = "思い出"
        case activity = "課外活動"
       }
    
    var selectedMenuType = MenuType.all
   
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        table.separatorStyle = .none
        search.delegate = self
        self.configureMenuButton()
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       selectedMenuType = MenuType.all
        self.configureMenuButton()
        memo = realm.objects(Memo.self).sorted(byKeyPath: "nickname", ascending: true)
     table.reloadData()
        menuButton.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        menuButton.layer.borderWidth = 2.0
    }
    
    private func configureMenuButton() {
        var actions = [UIMenuElement]()
       
        actions.append(UIAction(title: MenuType.all.rawValue, image: nil, state: self.selectedMenuType == MenuType.all ? .on : .off,
                                handler: { (_) in
                                    self.selectedMenuType = .all
                                    // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                    self.configureMenuButton()
            self.memo = self.realm.objects(Memo.self).sorted(byKeyPath: "nickname", ascending: true)
            self.table.reloadData()
                                }))
        
        actions.append(UIAction(title: MenuType.body.rawValue, image: nil, state: self.selectedMenuType == MenuType.body ? .on : .off,
                                handler: { (_) in
                                    self.selectedMenuType = .body
                                    // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                    self.configureMenuButton()
            self.memo = self.realm.objects(Memo.self).filter("number == %@", 0).sorted(byKeyPath: "nickname", ascending: true)
            self.table.reloadData()
            self.menuButton.layer.borderColor = CGColor(red: 111/255, green: 101/255, blue: 136/255, alpha: 1.0)
                                }))
        
        actions.append(UIAction(title: MenuType.emotion.rawValue, image: nil, state: self.selectedMenuType == MenuType.emotion ? .on : .off,
                                handler: { (_) in
                                    self.selectedMenuType = .emotion
                                    // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                    self.configureMenuButton()
            self.memo = self.realm.objects(Memo.self).filter("number == %@", 1).sorted(byKeyPath: "nickname", ascending: true)
            self.table.reloadData()
            self.menuButton.layer.borderColor = CGColor(red: 125/255, green: 169/255, blue: 144/255, alpha: 1.0)
                                }))
        
        actions.append(UIAction(title: MenuType.school.rawValue, image: nil, state: self.selectedMenuType == MenuType.school ? .on : .off,
                                handler: { (_) in
                                    self.selectedMenuType = .school
                                    // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                    self.configureMenuButton()
            self.memo = self.realm.objects(Memo.self).filter("number == %@", 2).sorted(byKeyPath: "nickname", ascending: true)
            self.table.reloadData()
            self.menuButton.layer.borderColor = CGColor(red: 200/255, green: 155/255, blue: 81/255, alpha: 1.0)
                                }))
        
        actions.append(UIAction(title: MenuType.friend.rawValue, image: nil, state: self.selectedMenuType == MenuType.friend ? .on : .off,
                                handler: { (_) in
                                    self.selectedMenuType = .friend
                                    // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                    self.configureMenuButton()
            self.memo = self.realm.objects(Memo.self).filter("number == %@", 3).sorted(byKeyPath: "nickname", ascending: true)
            self.table.reloadData()
            self.menuButton.layer.borderColor = CGColor(red: 247/255, green: 231/255, blue: 158/255, alpha: 1.0)
                                }))
        
        actions.append(UIAction(title: MenuType.activity.rawValue, image: nil, state: self.selectedMenuType == MenuType.activity ? .on : .off,
                                handler: { (_) in
                                    self.selectedMenuType = .activity
                                    // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
                                    self.configureMenuButton()
            self.memo = self.realm.objects(Memo.self).filter("number == %@", 4).sorted(byKeyPath: "nickname", ascending: true)
            self.table.reloadData()
            self.menuButton.layer.borderColor = CGColor(red: 41/255, green: 179/255, blue: 196/255, alpha: 1.0)
                                }))

        // UIButtonにUIMenuを設定
        menuButton.menu = UIMenu(title: "", options: .displayInline, children: actions)
        // こちらを書かないと表示できない場合があるので注意
        menuButton.showsMenuAsPrimaryAction = true
        // ボタンの表示を変更
        menuButton.setTitle(self.selectedMenuType.rawValue, for: .normal)
    }

   




   
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100  // セルの高さを100ポイントに設定
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return memo.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
           
            if(memo[indexPath.row].number==0){
                cell.photo.layer.borderColor = CGColor(red: 111/255, green: 101/255, blue: 136/255, alpha: 1.0)
                cell.views.layer.backgroundColor = CGColor(red: 111/255, green: 101/255, blue: 136/255, alpha: 1.0)
            }
            
            if(memo[indexPath.row].number==1){
                cell.photo.layer.borderColor = CGColor(red: 125/255, green: 169/255, blue: 144/255, alpha: 1.0)
                cell.views.layer.backgroundColor = CGColor(red: 125/255, green: 169/255, blue: 144/255, alpha: 1.0)
            }
            if(memo[indexPath.row].number==2){
                cell.photo.layer.borderColor = CGColor(red: 200/255, green: 155/255, blue: 81/255, alpha: 1.0)
                cell.views.layer.backgroundColor = CGColor(red: 200/255, green: 155/255, blue: 81/255, alpha: 1.0)
            }
            if(memo[indexPath.row].number==3){
                cell.photo.layer.borderColor = CGColor(red: 247/255, green: 231/255, blue: 158/255, alpha: 1.0)
                cell.views.layer.backgroundColor = CGColor(red: 247/255, green: 231/255, blue: 158/255, alpha: 1.0)
            }
            if(memo[indexPath.row].number==4){
                cell.photo.layer.borderColor = CGColor(red: 41/255, green: 179/255, blue: 196/255, alpha: 1.0)
                cell.views.layer.backgroundColor = CGColor(red: 41/255, green: 179/255, blue: 196/255, alpha: 1.0)
            }
            cell.label.text = memo[indexPath.row].nickname
            cell.photo.image = UIImage(named: imageArray[memo[indexPath.row].number])
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
            // セルの選択を解除
            table.deselectRow(at: indexPath, animated: true)
     
            // 別の画面に遷移
        index = indexPath.row
            performSegue(withIdentifier: "toNextViewController", sender: nil)
        }
   
//    @IBAction func Setting(){
//
//        performSegue(withIdentifier: "toSettingViewController", sender: nil)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNextViewController"{
            let nextVC = segue.destination as! DetailViewController
            nextVC.memo = memo[index]
            
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // キーボードを閉じる
        view.endEditing(true)
        // 入力された値がnilでなければif文のブロック内の処理を実行
        if let word = searchBar.text {
            // デバッグエリアに出力
            print(word)
         
                self.memo = self.realm.objects(Memo.self).filter("nickname CONTAINS '\(word)'").sorted(byKeyPath: "nickname", ascending: true)
            
            table.reloadData()
        }
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            
            
                memo = realm.objects(Memo.self).sorted(byKeyPath: "nickname", ascending: true)
            
            table.reloadData()
            
        }
    }
    
    
    
    }
   





