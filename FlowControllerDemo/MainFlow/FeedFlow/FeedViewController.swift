//
//  FeedViewController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit

protocol FeedViewControllerDelegate : class{
    func showDetail(_ detail: String)
}

class FeedViewController: UIViewController {
    weak var delegate: FeedViewControllerDelegate?
    
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

        title = "Feed"
        view.backgroundColor = UIColor.white
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 60, height: 40))
        button.setTitle("detail", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(FeedViewController.showDetail(_:)), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func showDetail(_ sender: UIButton) {
        self.delegate?.showDetail("detail")
    }

}
