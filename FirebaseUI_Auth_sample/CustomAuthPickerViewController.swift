//
//  CustomAuthPickerViewController.swift
//  FirebaseUI_Auth_sample
//
//  Created by shinichi teshirogi on 2022/06/18.
//

import Foundation
import FirebaseAuthUI

class CustomAuthPickerViewController: FUIAuthPickerViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBAction func onClickCancel(_ sender: Any) {
        print("click Cancel")
        self.cancelAuthorization()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for childView in self.view.subviews {
            let childViewClassName = String(describing: type(of: childView))
            if childViewClassName == "UIView" {
                //  in FUIAuthPickerViewController, kSignInButtonVerticalMargin = 24.0f
                let labelCenter = CGPoint(x: self.view.center.x,
                                          y: childView.frame.minY - 24 - self.label.frame.height / 2)
                self.label.center = labelCenter
                self.label.text = "Providers:"
                self.label.textAlignment = .center
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
}
