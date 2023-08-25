
import UIKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    let realm = try! Realm()
    var memo: Results<Memo>!

    @IBOutlet var table : UITableView!
    @IBOutlet var setting : UIButton!
    @IBOutlet var search: UISearchBar!
   
    var number : Int!
    var index : Int!
    let imageArray = ["body","emotion","school","friend","activity"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        table.separatorStyle = .none
        setting.layer.cornerRadius = 25
        setting.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        setting.layer.borderWidth = 1
        search.delegate = self
        
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memo = realm.objects(Memo.self).sorted(byKeyPath: "nickname", ascending: true)
     table.reloadData()
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
   
    @IBAction func Setting(){
        
        performSegue(withIdentifier: "toSettingViewController", sender: nil)
    }
    
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
   





