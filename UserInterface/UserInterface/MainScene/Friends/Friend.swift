import UIKit

protocol IFriend {
}

final class Friend {
    var name: String = "Name"
    var avatar: UIImage? = UIImage(systemName: "person")
    var image: [UIImage?]? = [UIImage(systemName: "figure.walk"), UIImage(systemName: "figure.wave"), UIImage(systemName: "figure.stand")]
}

extension Friend: IFriend {
}
