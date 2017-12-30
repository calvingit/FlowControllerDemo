//
//  OnboardingService.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import Foundation

private let onboardingUserDefaultsKey = "onboardingUserDefaultsKey"

struct OnboardingService {
    
    
    static var isShowed: Bool{
        get{
            return UserDefaults.standard.bool(forKey: onboardingUserDefaultsKey)
        }
        
        set {
            UserDefaults.standard.set(true, forKey: onboardingUserDefaultsKey)
        }
    }

}
