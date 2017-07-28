//
//  SignUpViewController.swift
//  PKRU_SERVICE
//
//  Created by Com06 on 7/28/2560 BE.
//  Copyright © 2560 team. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    //Implicit
    let strBlankAlert = "Please Fill All Ever Blank"
    let strFontPHP = "http://androidthai.in.th/pkru/addDataPanupan.php?isAdd=true&Name="
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var AlertLabel: UILabel!
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        // get value Form TextField
        let strName:String = nameTextField.text!
        let strUser:String = userTextField.text!
        let strPassword: String = passwordTextField.text!
        
        // Show Log
        print("strName ==> \(strName)")
        print("strUser ==> \(strUser)")
        print("strPassword ==> \(strPassword)")
        
        // Check Space
        if (strName == "") || (strUser == "") || (strPassword == "") {
            // Have space 
            AlertLabel.text = strBlankAlert
            
            
        }else{
            // No Space
            uploadToServer(strName: strName, strUser: strUser, strPassword: strPassword)
        }
        
        
        
        
    }   // Save Button

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //viewDidLoad
    
    func uploadToServer(strName:String, strUser:String, strPassword:String) -> Void {
        let strPHP:String = strFontPHP + "\(strName)&User=\(strUser)&Password=\(strPassword)"
        print("strPHP ==> \(strPHP)")
        
        let myURL = URL(string: strPHP)
        let request = NSMutableURLRequest(url: myURL!)
        let tasl = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("Error ==> \(String(describing: error))")
            }else{
                if let unwrappedData = data{
                    let dataString = NSString(data:unwrappedData, encoding:String.Encoding.utf8.rawValue)
                    let strResult = dataString as Any
                    print("strResult ==> \(strResult)")
                    
                }// if
            }// if
        
        }//  task
        task.resume()
        
    }// UpLoadToServer
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
