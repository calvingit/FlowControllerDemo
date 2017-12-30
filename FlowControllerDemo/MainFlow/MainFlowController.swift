//
//  MainFlowController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit

protocol MainFlowControllerDelegate:class  {
    func logoutFlowControllerDidFinish (_ flowController: MainFlowController)
}

class MainFlowController: UIViewController, FlowController {

    weak var delegate: MainFlowControllerDelegate?
    private var mainTabBarVC: UITabBarController!
    
    private let dependencyContainer: DependencyContainer

    let feed: FeedFlowController
    let profile : ProfileFlowController
    let settings : SettingsFlowController
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer

        mainTabBarVC = UITabBarController()
        
        feed = FeedFlowController(dependencyContainer: dependencyContainer)
        feed.tabBarItem = UITabBarItem(title: "Feed", image: nil, tag: 0)

        
        profile = ProfileFlowController(dependencyContainer: dependencyContainer)
        profile.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 0)

        
        settings = SettingsFlowController(dependencyContainer: dependencyContainer)
        settings.tabBarItem = UITabBarItem(title: "Settings", image: nil, tag: 0)

        super.init(nibName: nil, bundle: nil)

        add(childController: mainTabBarVC)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
    
    func start() {
        feed.delegate = self
        feed.start()
        
        profile.delegate = self
        profile.start()
        
        settings.delegate = self
        settings.start()
        
        /// 这里不能直接把feed、profile、settings赋值给viewControllers，这会导致feed的子视图控制器push的时候无法隐藏tabBar，因为只有当你的navigationController直接嵌套在tabBarController，才能起作用。这中间不能用UIViewController隔开，所以直接赋值flowController是不行的。
        mainTabBarVC.viewControllers = [feed.embeddedNavigationController, profile.embeddedNavigationController, settings.embeddedNavigationController]
        mainTabBarVC.selectedIndex = 0
    }
}

extension MainFlowController: FeedFlowControllerDelegate{
    
}

extension MainFlowController: ProfileFlowControllerDelegate{
    
}

extension MainFlowController: SettingsFlowControllerDelegate{
    func willLogout(_ settingsFlowController: SettingsFlowController) {
        self.delegate?.logoutFlowControllerDidFinish(self)
    }
}
