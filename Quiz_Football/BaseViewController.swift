//
//  BaseViewController.swift
//  Quiz_Football
//
//  Created by Витя on 12.09.2018.
//  Copyright © 2018 Blan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
   var timer = Timer()
   var button = UIButton()
    var show:Bool = false
    func outofTime(btn: [UIButton]){
        timer.invalidate()
        for btn in [button]{
            btn.isEnabled = false
        }
        showAlMul.showAlert(slow: show)
        showAlRig.showAlert(slow: show)
        showAlImg.showAlert(slow: show)
    }
}
let dis = BaseViewController()


