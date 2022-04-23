import UIKit

protocol IPhotoGalleryNavigation: UIView {
    func loadView(controller: PhotoGalleryViewController)
}

final class PhotoGalleryNavigation: UIView {
    private weak var controller: PhotoGalleryViewController?
}

extension PhotoGalleryNavigation: IPhotoGalleryNavigation {
    func loadView(controller: PhotoGalleryViewController) {
        self.controller = controller
        self.customizeNavigation()
    }
}

private extension PhotoGalleryNavigation {
    func customizeNavigation() {
        self.controller?.navigationController?.navigationBar.barTintColor = MainPallete.alabaster
        self.controller?.navigationController?.navigationBar.isTranslucent = false
        self.controller?.navigationController?.navigationBar.shadowImage = UIImage()
        self.controller?.title = "Фото"
        self.controller?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: MainFont.thonburi(size: FontSize.title).uiFont]
    }
}
