import UIKit

protocol IFriendsViewController: AnyObject {
}

final class FriendsViewController: UIViewController {
    private let viewScene: IFriendsViewScene
    private let presenter: IFriendsPresenter
    private let navigation: IFriendsNavigation
    
    init(presenter: FriendsPresenter) {
        self.presenter = presenter
        self.navigation = FriendsNavigation()
        self.viewScene = FriendsView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.presenter.loadView(controller: self, viewScene: self.viewScene)
        self.navigation.loadView(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(self.viewScene)
    }
}

extension FriendsViewController: IFriendsViewController {
}
