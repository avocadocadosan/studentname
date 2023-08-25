//
//  TabBar.swift
//  studentname
//
//  Created by Lisa Mizuno on 2023/07/20.
//

import UIKit

class TabBar: UITabBar {

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = 100
        return size
    }

}
