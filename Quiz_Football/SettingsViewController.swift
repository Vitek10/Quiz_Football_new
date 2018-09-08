//
//  SettingsViewController.swift
//  Quiz Football
//
//  Created by Витя on 27.01.17.
//  Copyright © 2017 Blan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var gameModeButtons: [UIButton]!
    
    @IBAction func gameModeButtonHandler(sender: UIButton) {
        for button in gameModeButtons {
            if sender != button {
                button.alpha = 0.7
            } else{
                button.alpha = 1.0
                gameMode = button.tag
            }
        }
        
    }
    
    @IBAction func playButtonHandler(sender: AnyObject) {
        
        var vc: UIViewController?
        switch gameMode {
        case 0:
            vc = storyboard?.instantiateViewController(withIdentifier: "multipleChoiceViewController") as! MultipleChoiceViewController
            break
        case 1:
            vc = storyboard?.instantiateViewController(withIdentifier: "rightOrWrongViewController") as!
            RightorWrongViewController
        case 2:
            vc = storyboard?.instantiateViewController(withIdentifier: "imageViewController") as!
            ImageViewController
            break
        default:
            break
        }
        if vc != nil {
            navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    var gameMode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for (idx, button) in gameModeButtons.enumerated(){
            button.tag = idx
            if button.tag != 0 {
                button.alpha = 0.7
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(false, animated:false)
    }
}
