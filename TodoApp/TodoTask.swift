import Foundation
import RealmSwift

class TodoTask: Object {

    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var memo: String?
    @objc dynamic var category: TodoCategory?
    @objc dynamic var limitDate: Date?
    @objc dynamic var createdDate: Date = Date()

    convenience init(name: String, memo: String?, category: TodoCategory?, limitDate: Date?) {
        self.init()
        self.name = name
        self.memo = memo
        self.category = category
        self.limitDate = limitDate
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}
