//
//  Onboard3ViewController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit


protocol Onboard3ViewControllerDelegate: class {
    func didFinish(_ onboard3ViewController: Onboard3ViewController)
}

class Onboard3ViewController: UIViewController {
    weak var delegate: Onboard3ViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func finish(_ sender: UIButton) {
        self.delegate?.didFinish(self)
    }

}
