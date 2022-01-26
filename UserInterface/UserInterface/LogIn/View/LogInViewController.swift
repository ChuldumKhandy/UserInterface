//
//  ViewController.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

protocol ILogInViewController: AnyObject {
    var registrationDataHandler: ((_ login: String?, _ password: String?) -> Void)? { get set }
    func showAlert(message: String)
    func registrationAlert()
}

final class LogInViewController: UIViewController {
    private let viewScene: ILogInView
    private let navigation: LogInNavigation
    private let presenter: ILogInPresenter
    var registrationDataHandler: ((_ login: String?, _ password: String?) -> Void)?
    
    init(presenter: LogInPresenter) {
        self.viewScene = LogInView(frame: UIScreen.main.bounds)
        self.navigation = LogInNavigation()
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigation.loadView(controller: self)
        self.presenter.loadView(controller: self, viewScene: self.viewScene)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(self.viewScene)
    }
}

extension LogInViewController: ILogInViewController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Внимание", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Понятно", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func registrationAlert() {
        let alert = UIAlertController(title: "Введите данные", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Телефон или email"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Пароль"
        }
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
            if let login = alert.textFields?[0].text,
               let password = alert.textFields?[1].text {
                self.registrationDataHandler?(login, password)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: nil )
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
