//
//  ViewController.swift
//  FirebaseUI_Auth_sample
//
//  Created by shinichi teshirogi on 2022/06/07.
//

import UIKit
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseOAuthUI

class ViewController: UIViewController, FUIAuthDelegate {
    let authUI = FUIAuth.defaultAuthUI()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        authUI?.delegate = self
        
        let googleAuthProvider = FUIGoogleAuth(authUI: authUI!)
        let appleAuthProvider = FUIOAuth.appleAuthProvider(withAuthUI: authUI!)
        let twitterUthProvider = FUIOAuth.twitterAuthProvider(withAuthUI: authUI!)
        let providers: [FUIAuthProvider] = [googleAuthProvider, appleAuthProvider, twitterUthProvider]
        authUI?.providers = providers
    }

    override func viewDidAppear(_ animated: Bool) {
        if let authViewController = authUI?.authViewController() {
            self.present(authViewController, animated: true)
        }
    }

    //  MARK: FUIAuthDelegate
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if let user = user { print("user:\n\(user.uid)") } else { print("error:\n\(error!)")}
    }
}
