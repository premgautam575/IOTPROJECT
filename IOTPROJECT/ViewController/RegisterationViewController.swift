//
//  RegisterationViewController.swift
//  IOTPROJECT
//
//  Created by prem  on 11/10/23.
//

import UIKit
import FirebaseAuth

class RegisterationViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cameraBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signupBtn(_ sender: Any) {
        Auth.auth().createUser(withEmail: (txtEmail.text ?? ""), password: (txtPass.text ?? "")) { (result, error) in
                   if let _eror = error {
                       //something bad happning
                       print(_eror.localizedDescription )
                   }else{
                       //user registered successfully
                       print(result)
                   }
                }
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
