//
//  LoginViewController.swift
//  IOTPROJECT
//
//  Created by prem  on 11/10/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtn(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: (emailTxt.text ?? ""), password: (passwordTxt.text ?? "")) { (result, error) in
                    if let _eror = error{
                        print(_eror.localizedDescription)
                        
                    }else{
                        let controller = ProfileViewController()
                        self.navigationController?.pushViewController(controller, animated: true)
                        }
                    }
                }
        
 
    
    @IBAction func signupBtn(_ sender: Any) {
        let controller = RegisterationViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
