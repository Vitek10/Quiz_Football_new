//
//  BaseViewController.swift
//  Quiz_Football
//
//  Created by Витя on 12.09.2018.
//  Copyright © 2018 Blan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
   var button = UIButton()
    func disable(btn: [UIButton]){
        for btn in [button]{
            btn.isEnabled = false
        }
    }
}
let dis = BaseViewController()


