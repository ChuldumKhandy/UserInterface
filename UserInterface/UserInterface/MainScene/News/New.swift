import UIKit

protocol INew {
}

final class New {
    var name: String = "Name"
    var date: String = "10.10.2010"
    var avatar: UIImage? = UIImage(systemName: "person")
    var description: String? = "description description description"
    var image: UIImage? = UIImage(systemName: "face.smiling")
}

extension New: INew {
}
