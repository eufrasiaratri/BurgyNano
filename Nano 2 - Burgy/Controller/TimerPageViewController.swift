//
//  TimerPageViewController.swift
//  Nano 2 - Burgy
//
//  Created by Bryan Kenneth on 27/07/22.
//

import UIKit

class TimerPageViewController: UIViewController {
    @IBOutlet weak var TaskTitle: UILabel!
    
    @IBOutlet weak var TimerLabel: UILabel!
    var focusetime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TaskTitle.text=UserDefaults.standard.string(forKey: "task")
        focusetime = Int(UserDefaults.standard.string (forKey: "Focuse") ?? "0")!
        updatelabel(seconds: focusetime*60)
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CookButtonPress(_ sender: UIButton) {
    }
    
    func updatelabel (seconds: Int) {
            let minutes = seconds / 60
            let second = seconds % 60
        TimerLabel.text = String(format: "%02i:%02i", minutes, second)
        }


}
