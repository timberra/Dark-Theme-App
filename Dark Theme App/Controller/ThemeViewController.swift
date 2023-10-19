//
//  ViewController.swift
//  Dark Theme App
//
//  Created by liga.griezne on 18/10/2023.
//

import UIKit

class ThemeViewController: UIViewController {
    
    var isDarkThemeOn = false
    
    @IBOutlet weak var darkButton: UIButton!
    @IBOutlet weak var folderButton: UIBarButtonItem!
    @IBOutlet weak var airplaneButton: UIBarButtonItem!
    @IBOutlet weak var clockLabel: UILabel!
    
    var timer: Timer?
    //#warning("need to have IBOutlet for Item button and put on leading side")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("func viewDiLoad")
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .full
        dateFormatter.timeZone = .none
        let formattedDate = dateFormatter.string(from: Date())
        print(Date())
        clockLabel.text = formattedDate
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
        updateClock()
        
        darkButton.layer.cornerRadius = 10
    }
    @objc func updateClock() {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        dateFormatter.dateFormat = "HH:mm:ss.SS"
        clockLabel.text = dateFormatter.string(from: Date())
    }


    @IBAction func darkButtonTapped(_ sender: Any) {
        print("darkButtonTapped")
        isDarkThemeOn.toggle()
        if isDarkThemeOn {
            view.backgroundColor = UIColor.black
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
            darkButton.setTitle("Dark Theme off", for: .normal)
            darkButton.setTitleColor(UIColor.black, for: .normal)
            darkButton.tintColor = UIColor.white
            darkButton.backgroundColor = UIColor(hex: "#E1AD01")
            
            airplaneButton.tintColor = UIColor(hex: "#E1AD01")
            folderButton.tintColor = UIColor(hex: "#E1AD01")
            
            clockLabel.textColor = UIColor(hex: "#E1AD01")
//#warning("Dark Theme off : Dark Theme on")
        } else {
            view.backgroundColor = UIColor.white
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            
            darkButton.setTitle("Dark Theme on", for: .normal)
            darkButton.setTitleColor(UIColor.white, for: .normal)
            darkButton.tintColor = UIColor.white
            darkButton.backgroundColor = UIColor(hex: "#16191E")
            
            airplaneButton.tintColor = UIColor(hex: "#16191E")
            folderButton.tintColor = UIColor(hex: "#16191E")
            
            clockLabel.textColor = UIColor(hex: "#16191E")
        }
    }
    @IBAction func folderTapped(_ sender: Any) {
        basicAlert(title: "My Folder", message: "This is my item button!")
    }
    @IBAction func airplaneTapped(_ sender: Any) {
        basicAlert(title: "My plane", message: "Do not disturb!")
    }
    
   
//#warning("need to have IBAction for Item button and logic to present actionSheet")
}
    extension UIViewController {
        
        func basicAlert(title: String?, message: String?) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
        }
    }
