//
//  Base.swift
//  Quiz_Football
//
//  Created by Витя on 11.09.2018.
//  Copyright © 2018 Blan. All rights reserved.
//

import UIKit
struct DisableButtons {
    
    func disableButtons(buttons: [UIButton]) {
        buttons.forEach {
            $0.isEnabled = false
        }
    }
}


