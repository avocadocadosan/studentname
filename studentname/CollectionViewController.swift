//
//  CollectionViewController.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/08/04.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet var collectionView : UICollectionView!
    var number : Int!
    
    let spacer : CGFloat = 16
    
    let imageArray = ["body","emotion","school","friend","activity"]
    
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
    
        self.performSegue(withIdentifier: "toAddition", sender: nil)
    }
 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddition" {
            let nextView = segue.destination as! AdditionViewController
            nextView.number = number
        }
    }
    
}
