//
//  FeedFlowController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit
protocol FeedFlowControllerDelegate:class  {

}
class FeedFlowController: UIViewController, FlowController {
    weak var delegate: FeedFlowControllerDelegate?
    private let dependencyContainer: DependencyContainer
    private (set) var embeddedNavigationController: UINavigationController!

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
        let feedVC = FeedViewController(dependencyContainer: dependencyContainer)
        feedVC.delegate = self
        embeddedNavigationController.viewControllers = [feedVC]
    }

}

extension FeedFlowController: FeedViewControllerDelegate {
    func showDetail(_ detail: String) {
        // 创建一个 feed 详情，模拟隐藏tabBar的情况
        let feedDetail = FeedDetailViewController(detail, dependencyContainer: self.dependencyContainer)
        feedDetail.hidesBottomBarWhenPushed = true
        embeddedNavigationController.pushViewController(feedDetail, animated: true)
    }
}
