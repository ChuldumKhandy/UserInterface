//
//  NewsNavigation.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

protocol INewsNavigation {
    func loadView(controller: NewsViewController)
}

final class NewsNavigation: UIView {
    private weak var controller: NewsViewController?
    
    private func customizeNavigation() {
        self.controller?.navigationController?.navigationBar.barTintColor = MainPallete.alabaster
        self.controller?.navigationController?.navigationBar.isTranslucent = false
        self.controller?.navigationController?.navigationBar.shadowImage = UIImage()
    }
}

extension NewsNavigation: INewsNavigation {
    func loadView(controller: NewsViewController) {
        self.controller = controller
        self.customizeNavigation()
    }
}
