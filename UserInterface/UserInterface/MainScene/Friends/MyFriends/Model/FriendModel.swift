import Foundation

protocol IFriendModel {
    func getFriends() -> [Friend]
}

final class FriendModel {
    var friends: [Friend]?
    
    init() {
        self.friends = self.setupFriends()
    }
}

extension FriendModel: IFriendModel {
    func getFriends() -> [Friend] {
        return self.friends ?? []
    }
}

private extension FriendModel {
    func setupFriends() -> [Friend] {
        var friends = [Friend]()
        let albumHelloKitty = ["hello_kitty_1", "hello_kitty_2", "hello_kitty_3", "hello_kitty_4", "hello_kitty_5", "hello_kitty_6"]
        let albumWaddles = ["waddles_1", "waddles_2", "waddles_3", "waddles_4"]
        let albumKetnipz = ["ketnipz_1", "ketnipz_2", "ketnipz_3"]
        let albumPusheen1 = ["pusheen_1_1", "pusheen_1_2", "pusheen_1_3"]
        let albumPusheen = ["pusheen_1", "pusheen_2", "pusheen_3"]
        let albumFrog = ["frog_1", "frog_2", "frog_3", "frog_4", "frog_5", "frog_6", "frog_7", "frog_8"]
        friends.append(Friend(name: "Hello Kitty", avatar: "HelloKitty", image: albumHelloKitty))
        friends.append(Friend(name: "Waddles", avatar: "Waddles", image: albumWaddles))
        friends.append(Friend(name: "Ketnipz", avatar: "Ketnipz", image: albumKetnipz))
        friends.append(Friend(name: "Corgi", avatar: "Corgi", image: nil))
        friends.append(Friend(name: "Godzilla", avatar: "Godzilla", image: nil))
        friends.append(Friend(name: "Sheep", avatar: "Sheep", image: nil))
        friends.append(Friend(name: "Pusheen", avatar: "Pusheen", image: albumPusheen))
        friends.append(Friend(name: "Pusheen", avatar: "Pusheen-1", image: albumPusheen1))
        friends.append(Friend(name: "mr Smith", avatar: nil, image: nil))
        friends.append(Friend(name: "ms Smith", avatar: nil, image: nil))
        friends.append(Friend(name: "Лягушонок", avatar: "frog", image: albumFrog))
        friends.append(Friend(name: "Peach", avatar: "Peach", image: nil))
        return friends
    }
}
