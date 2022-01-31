import Foundation

protocol INewsPresenter {
    func loadView(controller: NewsViewController, viewScene: INewsView)
}

final class NewsPresenter {
    private weak var controller: INewsViewController?
    private weak var viewScene: INewsView?
    private let router: INewsRouter
    private let model: INew
    
    init(model: New, router: NewsRouter) {
        self.router = router
        self.model = model
    }
}

extension NewsPresenter: INewsPresenter {
    func loadView(controller: NewsViewController, viewScene: INewsView) {
        self.controller = controller
        self.viewScene = viewScene
        self.onTouched()
    }
}

private extension NewsPresenter {
    func onTouched() {
    }
}









//self.button.addTarget(self, action: #selector(self.touchedControl(_:)), for: .touchUpInside)
//}
//
//@objc func touchedControl(_ sender: UIButton) {
//if isLike {
//    self.touched()
//    self.isLike = false
//} else {
//    self.notTouched()
//    self.isLike = true
//}
//}
//
//func touched() {
//self.button.tintColor = .red
//self.counterLabel.textColor = .red
//self.button.setImage(self.touchedImage, for: .normal)
//self.counterLabel.text = "1"
//}
//
//func notTouched() {
//self.button.tintColor = .gray
//self.counterLabel.textColor = .gray
//self.button.setImage(self.notTouchedImage, for: .normal)
//self.counterLabel.text = "0"
//}
