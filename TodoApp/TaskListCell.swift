//
//  TaskListCell.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/08.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

class TaskListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var limitLabel: PaddingLabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        limitLabel.insets = UIEdgeInsetsMake(3, 3, 3, 3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
