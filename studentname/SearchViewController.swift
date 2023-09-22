//
//  SearchViewController.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/09/01.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {

    @IBOutlet var collectionView : UICollectionView!
    var number : Int!
    
    let spacer : CGFloat = 16
    
    let imageArray = ["body","emotion","school","friend","activity"]
    @IBOutlet var underline : UIView!
    let titleArray = ["魅力","長所","学校","思い出","課外活動"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        // 縦スクロールに設定
        layout.scrollDirection = .vertical
        // セルの大きさ設定
        layout.itemSize = CGSize(width: view.frame.width / 2 - spacer * 2, height: view.frame.width / 2 - spacer * 2)
        // 余白の設定
        layout.sectionInset = UIEdgeInsets(top: spacer, left: spacer, bottom: spacer, right: spacer)
        // レイアウトをcollectionViewに適応させる
        collectionView.collectionViewLayout = layout
        
        underline.layer.cornerRadius = 6
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Cellの中でTagが「1」のものをUIImageViewとして取得する
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: imageArray[indexPath.row])
        
        // Cellの中でTagが「2」のものをUILabelとして取得する
        let titleLabel = cell.contentView.viewWithTag(2) as! UILabel
        titleLabel.text = titleArray[indexPath.row]
        
        return cell
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        number = indexPath.row
    
        self.performSegue(withIdentifier: "toSearch2", sender: nil)
    }
 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSearch2" {
            let nextView = segue.destination as! Search2ViewController
            nextView.number = number
        }
    }

   
}
