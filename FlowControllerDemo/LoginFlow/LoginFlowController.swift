//
//  LoginFlowController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit

protocol LoginFlowControllerDelegate: class {
    func loginFlowControllerDidFinish (_ flowController: LoginFlowController)
}

class LoginFlowController: UIViewController, FlowController {
    private let dependencyContainer: DependencyContainer
    weak var delegate: LoginFlowControllerDelegate?
    private var embeddedNavigationController: UINavigationController!
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
        
        embeddedNavigationController = UINavigationController()
        add(childController: embeddedNavigationController)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Can't call the method")
    }

    func start() {
        let loginController = LoginViewController(dependencyContainer: dependencyContainer)
        loginController.delegate = self
        
        embeddedNavigationController.viewControllers = [loginController]
    }
}

extension LoginFlowController: LoginViewControllerDelegate{
    func didLogin(_ loginViewController: LoginViewController) {
        self.delegate?.loginFlowControllerDidFinish(self)
    }
    
    func didTapRegisterButton(_ loginViewController: LoginViewController) {
        let registerViewController = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        embeddedNavigationController.pushViewController(registerViewController, animated: true)
    }
}
