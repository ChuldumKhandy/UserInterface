import UIKit

final class PhotoGalleryAssembly {
    static func build(photos: [String]) -> UIViewController {
        let router = PhotoGalleryRouter()
        let model = Photo(photoNames: photos)
        let presenter = PhotoGalleryPresenter(photos: model, router: router)
        let controller = PhotoGalleryViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
