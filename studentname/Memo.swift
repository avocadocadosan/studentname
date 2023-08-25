//
//  Realm.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/07/21.
//

import Foundation
import RealmSwift

class Memo: Object {
    //Memoという名前のクラスを定義
    //Object→Realmに保存出来る型
    
    @objc dynamic var category: String = " "
    @objc dynamic var feature: String = " "
    @objc dynamic var nickname: String = " "
    @objc dynamic var detail: String = " "
    @objc dynamic var number:Int = 0
    @objc dynamic var partnumber:Int = 0
}

