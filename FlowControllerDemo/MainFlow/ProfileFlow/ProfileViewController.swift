//
//  ProfileViewController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    private let dependencyContainer: DependencyContainer
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        view.backgroundColor = UIColor.white

    }


}
