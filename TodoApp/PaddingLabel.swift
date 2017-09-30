//
//  PaddingLabel.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/07/09.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {

    var insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += insets.top + insets.bottom
        contentSize.width += insets.left + insets.right
        return contentSize
    }

}
