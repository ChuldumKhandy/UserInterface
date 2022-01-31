//
//  MainScene.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

final class MainScene {
    static func createTabs() -> UITabBarController {
        let tabBar = UITabBarController()
        let news = UINavigationController(rootViewController: NewsAssembly.build())
        let friends = UINavigationController(rootViewController: FriendsAssembly.build())
        let groups = UINavigationController(rootViewController: GroupsAssembly.build())
        news.tabBarItem = UITabBarItem(title: "Новости",
                                       image: UIImage(systemName: "newspaper"),
                                       tag: 0)
        friends.tabBarItem = UITabBarItem(title: "Друзья",
                                          image: UIImage(systemName: "person.2"),
                                          tag: 0)
        groups.tabBarItem = UITabBarItem(title: "Группы",
                                         image: UIImage(systemName: "person.3"),
                                         tag: 0)
        
        tabBar.setViewControllers([news, friends, groups], animated: true)
        tabBar.tabBar.tintColor = MainPallete.lavender
        tabBar.tabBar.barTintColor = .white
        return tabBar
    }
}
