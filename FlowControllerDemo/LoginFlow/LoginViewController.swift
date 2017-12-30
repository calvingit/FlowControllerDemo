//
//  LoginViewController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate:class {
    func didLogin(_ loginViewController: LoginViewController)
    func didTapRegisterButton(_ loginViewController: LoginViewController)
}

class LoginViewController: UIViewController {
    private let dependencyContainer: DependencyContainer
    weak var delegate: LoginViewControllerDelegate?
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: "LoginViewController", bundle: nil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Login"
    }

    @IBAction func loginButtonClicked(_ sender: UIButton) {
        self.delegate?.didLogin(self)
    }

    @IBAction func registerButtonClicked(_ sender: UIButton) {
        self.delegate?.didTapRegisterButton(self)
    }
}
