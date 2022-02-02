import UIKit

final class NewsAssembly {
    static func build() -> UIViewController {
        let router = NewsRouter()
        let model = NewModel()
        let presenter = NewsPresenter(model: model, router: router)
        let controller = NewsViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
