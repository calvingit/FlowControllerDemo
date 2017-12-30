//
//  SettingsFlowController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit

protocol SettingsFlowControllerDelegate:class  {
    func willLogout(_ settingsFlowController: SettingsFlowController)
}

class SettingsFlowController: UIViewController, FlowController {

    weak var delegate: SettingsFlowControllerDelegate?
    private let dependencyContainer: DependencyContainer
    private (set) var embeddedNavigationController: UINavigationController!

    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
        
        embeddedNavigationController = UINavigationController()
        embeddedNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: nil, tag: 0)

        add(childController: embeddedNavigationController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Can't call the method")
    }

    func start() {
        let settingsVC = SettingsViewController(dependencyContainer: dependencyContainer)
        settingsVC.delegate = self
        embeddedNavigationController.viewControllers = [settingsVC]
    }
}

extension SettingsFlowController: SettingsViewControllerDelegate{
    func didTapLogoutButton(_ settingsViewController: SettingsViewController) {
        delegate?.willLogout(self)
    }
}
