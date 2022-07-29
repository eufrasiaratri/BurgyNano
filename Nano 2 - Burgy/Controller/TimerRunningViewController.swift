//
//  TimerRunningViewController.swift
//  Nano 2 - Burgy
//
//  Created by Eufrasia Ratri on 27/07/22.
//

import UIKit

class TimerRunningViewController: UIViewController {

    @IBOutlet weak var TaskLabel: UILabel!
    @IBOutlet weak var ProgressImage: UIImageView!
    @IBOutlet weak var TimerLabel: UILabel!
   
    @IBOutlet weak var BreakButton: UIButton!
    @IBOutlet weak var GiveUpButton: UIButton!
    
    @IBOutlet weak var giveBtnConst: NSLayoutConstraint!
    var circularProgressBarView: CircularProgressBarView!
        var circularViewDuration: TimeInterval = 4
    
    var breaktime = 0
    var focusetime = 0
    var isbreak = false
    var timeremaining = 0
    var breakremaining = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskLabel.text=UserDefaults.standard.string(forKey: "task")
        breaktime = Int(UserDefaults.standard.string (forKey: "Break") ?? "0")!
        focusetime = Int(UserDefaults.standard.string (forKey: "Focuse") ?? "0")!
        print("breaktime : \(breaktime)")
        print("focuse: \(focusetime)")
        timeremaining = focusetime*60
        breakremaining = breaktime*60
        
        updatelabel(seconds: focusetime*60)
        
        setUpCircularProgressBarView()
        
        startTimer()
        // Do any additional setup after loading the view.
    }
    func setUpCircularProgressBarView() {
                // set view
            circularProgressBarView = CircularProgressBarView(frame: .zero)
                // align to the center of the screen
                circularProgressBarView.center = view.center
        
        // call the animation with circularViewDuration
        circularProgressBarView.progressAnimation(duration: TimeInterval(focusetime*60),from: 0.0 )
                // add this view to the view controller
                view.addSubview(circularProgressBarView)
        }

    @IBAction func GiveUpButtonPress(_ sender: UIButton) {
        if isbreak{
            isbreak = false
            circularProgressBarView.progressAnimation(duration: TimeInterval( timeremaining ), from: Float((focusetime*60)-timeremaining)/Float(focusetime*60))
            GiveUpButton.titleLabel?.text = "Give Up"
            BreakButton.isHidden = false
            ProgressImage.image = UIImage (named: "Image-7")
            giveBtnConst.constant = 12000
        } else {
            let alert = UIAlertController(title: "Oops", message: " Your burger isn’t fully cooked. Please Try Again ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { Action in
                self.performSegue(withIdentifier: "UnwindToMain", sender: self)
            }))
                self.present(alert, animated: true) {
                   
                }
        }
    }
    @IBAction func BreakButtonPress(_ sender: UIButton) {
        isbreak = true
        print(Float((breaktime*60)-breakremaining)/Float(breaktime*60))
        
        circularProgressBarView.progressAnimation(duration: TimeInterval( breakremaining ), from: Float((breaktime*60)-breakremaining)/Float(breaktime*60))
        BreakButton.isHidden = true
        GiveUpButton.titleLabel?.text = "done"
        giveBtnConst.constant = 44
        ProgressImage.image = UIImage(named: "Image-9")
    }
    func updatelabel (seconds: Int) {
            let minutes = seconds / 60
            let second = seconds % 60
        TimerLabel.text = String(format: "%02i:%02i", minutes, second)
        }

    private func startTimer() {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
         
                if self.isbreak {
                    
                    if self.breakremaining > 0 {
                    self.breakremaining -= 1
                    self.updatelabel(seconds: self.breakremaining)
                } else {let alert = UIAlertController(title: "Oops", message: "Break has ended ", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Got It", style: .default, handler: nil))
                    self.present(alert, animated: true) {
                        self.isbreak = false
                        self.circularProgressBarView.progressAnimation(duration: TimeInterval( self.timeremaining ), from: Float((self.focusetime*60)-self.timeremaining)/Float(self.focusetime*60))
                        self.GiveUpButton.titleLabel?.text = "Give Up"
                        self.BreakButton.isHidden = false
                        self.ProgressImage.image = UIImage (named: "Image-7")
                    }
                }
                } else {
                    if self.timeremaining > 0 {
                    self.timeremaining -= 1
                    self.updatelabel(seconds: self.timeremaining)
                } else { let alert = UIAlertController(title: "You did it!", message: " You have successfully cooked a burger ", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { Action in
                        self.performSegue(withIdentifier: "UnwindToMain", sender: self)
                    }))
                        self.present(alert, animated: true) {
                           
                        }
                }
                }
                
                
            
                
                
                
            })
        }
}
