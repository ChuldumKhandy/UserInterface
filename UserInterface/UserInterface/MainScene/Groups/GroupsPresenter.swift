import Foundation

protocol IGroupsPresenter {
    func loadView(controller: GroupsViewController, viewScene: IGroupsView)
}

final class GroupsPresenter {
    private weak var controller: IGroupsViewController?
    private weak var viewScene: IGroupsView?
    private let router: IGroupsRouter
    private let model: IGroup
    
    init(model: Group, router: GroupsRouter) {
        self.router = router
        self.model = model
    }
}

extension GroupsPresenter: IGroupsPresenter {
    func loadView(controller: GroupsViewController, viewScene: IGroupsView) {
        self.controller = controller
        self.viewScene = viewScene
        self.onTouched()
    }
}

private extension GroupsPresenter {
    func onTouched() {
    }
}

