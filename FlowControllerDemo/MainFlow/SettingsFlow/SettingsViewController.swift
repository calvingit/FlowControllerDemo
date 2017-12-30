//
//  SettingsViewController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func didTapLogoutButton(_ settingsViewController: SettingsViewController)
}

class SettingsViewController: UIViewController {
    weak var delegate: SettingsViewControllerDelegate?
    
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

        title = "Settings"
        view.backgroundColor = UIColor.white
        
        let logoutButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        logoutButton.backgroundColor = UIColor.red
        logoutButton.setTitleColor(UIColor.white, for: .normal)
        logoutButton.setTitle("退出账号", for: .normal)
        view.addSubview(logoutButton)
        
        logoutButton.addTarget(self, action: #selector(logout(_:)), for: .touchUpInside)
    }


    @objc private  func logout(_ sender: UIButton) {
        delegate?.didTapLogoutButton(self)
    }
}
