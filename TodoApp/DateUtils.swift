import UIKit

class DateUtils {
    static let locale = Locale(identifier: "ja_JP")
    static let dateFormatter = "yyyy/MM/dd"

    class func dateFromString(string: String) -> Date? {
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = dateFormatter
        return formatter.date(from: string)
    }

    class func stringFromDate(date: Date) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = dateFormatter
        return formatter.string(from: date)
    }
}
