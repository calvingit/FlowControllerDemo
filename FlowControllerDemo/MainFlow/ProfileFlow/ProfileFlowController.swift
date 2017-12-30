//
//  ProfileFlowController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit
protocol ProfileFlowControllerDelegate: class {
    
}

class ProfileFlowController: UIViewController, FlowController {
    weak var delegate: ProfileFlowControllerDelegate?
    private let dependencyContainer: DependencyContainer
    private (set )var embeddedNavigationController: UINavigationController

    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        embeddedNavigationController = UINavigationController()

        super.init(nibName: nil, bundle: nil)
        
        add(childController: embeddedNavigationController)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Can't call the method")
    }
    
    func start() {
        let profileVC = ProfileViewController(dependencyContainer: dependencyContainer)
        embeddedNavigationController.viewControllers = [profileVC]
    }
}
