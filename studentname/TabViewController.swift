import UIKit

class TabViewController: UITabBarController,UITabBarControllerDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.delegate = self
        

        tabBar.barTintColor = UIColor(red: 41/255, green: 179/255, blue: 196/255, alpha: 1.0)
        tabBar.unselectedItemTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        tabBar.tintColor = UIColor(red: 249/255, green: 187/255, blue: 114/255, alpha: 1.0)

      
        tabBar.layer.cornerRadius = 45.0
        tabBar.layer.masksToBounds = true

       

    }

    


}
