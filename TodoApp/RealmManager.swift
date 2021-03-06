import UIKit
import RealmSwift

class RealmManager {
    static let realm = try! Realm()

    class func getAllCategories() -> Results<TodoCategory>? {
        return realm.objects(TodoCategory.self)
    }

    class func findCategory(categoryName: String) -> Results<TodoCategory> {
        return realm.objects(TodoCategory.self).filter("name == %@", categoryName)
    }

    class func updateCategoryData(todoCategory: TodoCategory) {
        do {
            try realm.write {
                realm.add(todoCategory, update: true)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    class func updateTaskData(todoCategory: TodoCategory, todoTask: TodoTask) {
        do {
            try realm.write {
                realm.add(todoTask, update: true)
                realm.add(todoCategory, update: true)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    class func insertTaskData(todoCategory: TodoCategory, todoTask: TodoTask) {
        do {
            try realm.write {
                todoCategory.tasks.append(todoTask)
                realm.add(todoCategory, update: true)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    class func deleteCategory(todoCategory: TodoCategory) {
        do {
            try realm.write {
                realm.delete(todoCategory.tasks)
                realm.delete(todoCategory)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    class func deleteTask(todoTask: TodoTask) {
        do {
            try realm.write {
                realm.delete(todoTask)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
