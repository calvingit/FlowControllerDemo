//
//  OnboardingFlowController.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit
protocol OnboardingFlowControllerDelegate: class {
    func didFinish(_ flowController: OnboardingFlowController)
}
class OnboardingFlowController: UIViewController , FlowController{
    weak var delegate: OnboardingFlowControllerDelegate?
    private var pageViewController: UIPageViewController!
    private let onboard1 = Onboard1ViewController(nibName: "Onboard1ViewController", bundle: nil)
    private let onboard2 = Onboard2ViewController(nibName: "Onboard2ViewController", bundle: nil)
    private let onboard3 = Onboard3ViewController(nibName: "Onboard3ViewController", bundle: nil)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }

    func start() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.setViewControllers([onboard1], direction: .forward, animated: true, completion: nil)
        add(childController: pageViewController)
        
        onboard3.delegate = self
    }
}

extension OnboardingFlowController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController === onboard1 {
            return onboard2
        }else if viewController === onboard2 {
            return onboard3
        }else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController === onboard2 {
            return onboard1
        }else if viewController === onboard3 {
            return onboard2
        }else {
            return nil
        }
    }
}

extension OnboardingFlowController: Onboard3ViewControllerDelegate {
    func didFinish(_ onboard3ViewController: Onboard3ViewController) {
        remove(childController: pageViewController)
        self.delegate?.didFinish(self)
    }
}


