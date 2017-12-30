//
//  AppFlowController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit

final class AppFlowController: UIViewController,FlowController {

    private let dependencyContainer:DependencyContainer
    init(dependencyContainer: DependencyContainer){
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Can't call the method")
    }

    func start() {
        if OnboardingService.isShowed {
            if LoginService.isLogined {
                startMain()
            } else {
                startLogin()
            }
            
        } else {
            startOnboarding()
        }
    }
    
    private func startOnboarding() {
        let onboardingFlowController = OnboardingFlowController()
        onboardingFlowController.delegate = self
        add(childController: onboardingFlowController)
        onboardingFlowController.start()
    }
    
    private func startLogin() {
        let loginFlowController = LoginFlowController(dependencyContainer: dependencyContainer)
        loginFlowController.delegate = self
        add(childController: loginFlowController)
        loginFlowController.start()
    }
    
    fileprivate func startMain() {
        let mainFlowController = MainFlowController(dependencyContainer: dependencyContainer)
        mainFlowController.delegate = self
        add(childController: mainFlowController)
        mainFlowController.start()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        childViewControllers.first?.view.frame = view.bounds
    }
}

extension AppFlowController: LoginFlowControllerDelegate {
    func loginFlowControllerDidFinish(_ flowController: LoginFlowController) {
        remove(childController: flowController)
        LoginService.login()
        startMain()
    }
}

extension AppFlowController: MainFlowControllerDelegate{
    func logoutFlowControllerDidFinish(_ flowController: MainFlowController) {
        remove(childController: flowController)
        LoginService.logout()
        startLogin()
    }
}

extension AppFlowController: OnboardingFlowControllerDelegate {
    func didFinish(_ flowController: OnboardingFlowController) {
        remove(childController: flowController)
        OnboardingService.isShowed = true
        if LoginService.isLogined {
            startMain()
        } else {
            startLogin()
        }
    }
}
