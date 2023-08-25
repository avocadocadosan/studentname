

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet var arrowbutton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrowbutton.layer.cornerRadius = 20
        arrowbutton.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        arrowbutton.layer.borderWidth = 1
    }
    
    @IBAction func back(){
        dismiss(animated: true)
    }
    
  

}
