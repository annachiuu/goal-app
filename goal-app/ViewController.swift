//
//  ViewController.swift
//  goal-app
//
//  Created by anna :)  on 8/30/16.
//  Copyright © 2016 Anna Chiu. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey(UID_KEY) != nil {
            self.performSegueWithIdentifier("loggedIn", sender: nil)
        } else {
            print("Not logged in")
        }
        
        
    }
    
   @IBAction func loginButtonClicked() {
    
        let facebookLogin = FBSDKLoginManager()
    
                facebookLogin.logInWithReadPermissions(["email"], fromViewController: self, handler: {(facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) in
                    
                    if facebookError != nil {
                        print("Facebook login error. \(facebookError)")
                    } else {
                        let accessToken = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString);
                        let printableAccessToken: String = FBSDKAccessToken.currentAccessToken().tokenString
                        
                        print("Logged In with Facebook! printable AccessToken: \(printableAccessToken)")
                        
                        FIRAuth.auth()?.signInWithCredential(accessToken, completion: { (authData: FIRUser?, error: NSError?) in
                            if error != nil {
                                print("Error with Authorization. \(error)")
                            } else {
                                print("Logged In: accessToken:\(accessToken)")
                                
                                let user = ["provider": accessToken.provider, "key":"String"]
                                
                                DataService.ds.createFirebaseUser(authData!.uid, user: user)
                                
                                //NSUSERDEFAULT
                                NSUserDefaults.standardUserDefaults().setValue(authData?.uid, forKey: UID_KEY)
                                self.performSegueWithIdentifier("loggedIn", sender: nil)
                            
                            
                            }
                            
                        })
                        
                    }
        
    })

}

}
