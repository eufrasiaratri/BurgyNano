//
//  NewTaskViewController.swift
//  Nano 2 - Burgy
//
//  Created by Bryan Kenneth on 27/07/22.
//

import UIKit

class NewTaskViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var BreakTextField: UITextField!
    @IBOutlet weak var FocuseTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var TaskTextField: UITextField!
    
    @IBAction func SaveButtonPress(_ sender: UIButton) {
        if TaskTextField.text != "" && BreakTextField.text != "" && FocuseTextField.text != "" {
            UserDefaults.standard.set(TaskTextField.text, forKey:"task")
            UserDefaults.standard.set(FocuseTextField.text, forKey:"Focuse")
            UserDefaults.standard.set(BreakTextField.text, forKey:"Break")
            performSegue(withIdentifier: "GoToTimer", sender:self)
            
            
        }    else {let alert = UIAlertController(title: "Input Invalid", message: "Please fill out all fields to proceed", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got It", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        TaskTextField.delegate = self
        BreakTextField.delegate = self
        FocuseTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
