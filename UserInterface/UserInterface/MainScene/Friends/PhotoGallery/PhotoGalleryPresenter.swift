import Foundation

protocol IPhotoGalleryPresenter {
    func loadView(controller: PhotoGalleryViewController, viewScene: IPhotoGalleryView)
}

final class PhotoGalleryPresenter {
    private weak var controller: IPhotoGalleryViewController?
    private weak var viewScene: IPhotoGalleryView?
    private let router: IPhotoGalleryRouter
    private let photos: IPhotoGalleryModel
    
    init(photos: Photo, router: PhotoGalleryRouter) {
        self.router = router
        self.photos = photos
    }
}

extension PhotoGalleryPresenter: IPhotoGalleryPresenter {
    func loadView(controller: PhotoGalleryViewController, viewScene: IPhotoGalleryView) {
        self.controller = controller
        self.viewScene = viewScene
        self.viewScene?.setImages(photoNames: photos.getFriends())
        self.onTouched()
    }
}

private extension PhotoGalleryPresenter {
    func onTouched() {
    }
}

