import UIKit

class TaskListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var limitLabel: PaddingLabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        limitLabel.insets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
