import Foundation

protocol IGroup {
}

final class Group {
    var groupName: String = "Group"
    var iconName: String? = "person.2"
}

extension Group: IGroup {
}
