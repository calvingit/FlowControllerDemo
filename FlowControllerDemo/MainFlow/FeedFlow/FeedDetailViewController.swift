//
//  FeedDetailViewController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/12/30.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit

class FeedDetailViewController: UIViewController {

    private let detail: String?
    private let dependencyContainer: DependencyContainer
    init(_ detail: String?, dependencyContainer: DependencyContainer) {
        self.detail = detail
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        self.title = self.detail
    }


}
