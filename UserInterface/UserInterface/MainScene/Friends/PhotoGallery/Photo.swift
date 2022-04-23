import Foundation

protocol IPhotoGalleryModel {
    func getFriends() -> [String]
}

final class Photo {
    private let photoNames: [String]
    
    init(photoNames: [String]) {
        self.photoNames = photoNames
    }
}

extension Photo: IPhotoGalleryModel {
    func getFriends() -> [String] {
        return self.photoNames
    }
}
