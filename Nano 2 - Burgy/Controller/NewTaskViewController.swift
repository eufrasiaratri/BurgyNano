//
//  NewTaskViewController.swift
//  Nano 2 - Burgy
//
//  Created by Bryan Kenneth on 27/07/22.
//

import UIKit

class NewTaskViewController: UIViewController {

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
            alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
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
