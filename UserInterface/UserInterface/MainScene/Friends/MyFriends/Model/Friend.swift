import Foundation

struct Friend {
    var name: String
    var avatar: String?
    var image: [String]?
    
    init(name: String, avatar: String?, image: [String]?) {
        self.name = name
        self.avatar = avatar
        self.image = image
    }
}
