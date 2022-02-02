import Foundation

protocol INewsPresenter {
    func loadView(controller: NewsViewController, viewScene: INewsView)
}

final class NewsPresenter {
    private weak var controller: INewsViewController?
    private weak var viewScene: INewsView?
    private let router: INewsRouter
    private let model: INewModel
    
    init(model: NewModel, router: NewsRouter) {
        self.router = router
        self.model = model
    }
}

extension NewsPresenter: INewsPresenter {
    func loadView(controller: NewsViewController, viewScene: INewsView) {
        self.controller = controller
        self.viewScene = viewScene
        self.onTouched()
        self.viewScene?.getNewsHandler?(self.model.getNews())
    }
}

private extension NewsPresenter {
    func onTouched() {
        
    }
    
}
