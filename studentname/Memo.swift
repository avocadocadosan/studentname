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
    
    @objc dynamic var name:String = " "
    @objc dynamic var Birthday:String = " "
    @objc dynamic var grade:String = " "
    @objc dynamic var Class:String = " "
    @objc dynamic var Comitee:String = " "
    @objc dynamic var Club:String = " "
    @objc dynamic var telephone:String = " "
    @objc dynamic var male:String = " "
    @objc dynamic var showsSelf: Bool = true
  
}


   


