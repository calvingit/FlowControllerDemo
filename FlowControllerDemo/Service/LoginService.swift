//
//  LoginService.swift
//  FlowControllerDemo
//
//  Created by zhangwen on 2017/11/28.
//  Copyright © 2017年 JOBO. All rights reserved.
//

import UIKit

private let loginUserDefaultsKey = "loginUserDefaultsKey"

struct LoginService {
    
    
    static var isLogined: Bool{
        return UserDefaults.standard.bool(forKey: loginUserDefaultsKey)
    }
    static func login() {
        UserDefaults.standard.set(true, forKey: loginUserDefaultsKey)
    }
    
    static func logout(){
        UserDefaults.standard.set(false, forKey: loginUserDefaultsKey)
    }
}
