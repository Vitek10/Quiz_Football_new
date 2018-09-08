//
//  ChangLangViewController.swift
//  Quiz_Football
//
//  Created by Витя on 28.07.17.
//  Copyright © 2017 Blan. All rights reserved.
//

import UIKit

class ChangLangViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func English(_ sender: Any) {
        self.changToLanguage("en")
    }
   
    @IBAction func Russian(_ sender: Any) {
        self.changToLanguage("ru")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(false, animated:false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func changToLanguage(_ langCode:String){
        if Bundle.main.preferredLocalizations.first != langCode {
            let confirmAlertCtrl = UIAlertController(title: NSLocalizedString("restartTitle", comment: ""),
                                                     message: NSLocalizedString("restart", comment: ""),
                                                     preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: NSLocalizedString("close", comment: ""), style: .destructive) { _ in
                UserDefaults.standard.set([langCode], forKey: "AppleLanguages")
                UserDefaults.standard.synchronize()
                exit(EXIT_SUCCESS)
            }
            confirmAlertCtrl.addAction(confirmAction)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel, handler: nil)
            confirmAlertCtrl.addAction(cancelAction)
            
            present(confirmAlertCtrl, animated: true)
        }
    }
}
