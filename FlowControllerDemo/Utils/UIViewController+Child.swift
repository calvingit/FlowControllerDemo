//
//  UIViewController+Child.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(childController: UIViewController) {
        addChildViewController(childController)
        view.addSubview(childController.view)
        childController.didMove(toParentViewController: self)
    }
    
    func remove(childController: UIViewController) {
        childController.willMove(toParentViewController: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParentViewController()
    }
}
