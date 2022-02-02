import Foundation

struct New {
    var name: String
    var date: String
    var avatar: String?
    var description: String?
    var image: String?
    var heartCounter: Int
    var commentCounter: Int?
    var shareCounter: Int?
    var browsingCounter: Int?
    
    init(name: String, date: String, avatar: String?, description: String?, image: String?, heartCounter: Int, commentCounter: Int?, shareCounter: Int?, browsingCounter: Int?) {
        self.name = name
        self.date = date
        self.avatar = avatar
        self.description = description
        self.image = image
        
        self.heartCounter = heartCounter
        self.commentCounter = commentCounter
        self.shareCounter = shareCounter
        self.browsingCounter = browsingCounter
    }
}
