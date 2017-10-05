import UIKit

extension UIAlertController {
    class func singleBtnAlert(title: String, message: String, completion: (() -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_: UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        return alert
    }

    class func doubleBtnAlert(title: String, message: String, otherBtnTitle: String, completion: (() -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: otherBtnTitle, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_: UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        return alert
    }
}
