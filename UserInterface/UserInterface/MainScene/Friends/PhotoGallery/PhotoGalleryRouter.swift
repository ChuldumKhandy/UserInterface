import UIKit

protocol IPhotoGalleryRouter {
    func setRootController(controller: UIViewController)
    func nextVC(controller: UIViewController)
}

final class PhotoGalleryRouter {
    private var controller: UIViewController?
}

extension PhotoGalleryRouter: IPhotoGalleryRouter {
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    func nextVC(controller: UIViewController) {
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
