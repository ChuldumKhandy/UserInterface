import UIKit

protocol IGroupsViewController: AnyObject {
}

final class GroupsViewController: UIViewController {
    private let viewScene: IGroupsView
    private let presenter: IGroupsPresenter
    private let navigation: IGroupsNavigation
    
    init(presenter: GroupsPresenter) {
        self.presenter = presenter
        self.navigation = GroupsNavigation()
        self.viewScene = GroupsView(frame: UIScreen.main.bounds)
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

extension GroupsViewController: IGroupsViewController {
}
