import UIKit

protocol SectionHeaderDelegate: AnyObject {
    func rowsBtnDidTap(_ header: UITableViewHeaderFooterView)
}

class SectionHeader: UITableViewHeaderFooterView {

    weak var sectoionHeaderDelegate: SectionHeaderDelegate?
    
    @IBOutlet weak var rowBtn: UIButton!
    
    @IBAction func rowsBtnDidTap(_ sender: Any) {
        sectoionHeaderDelegate?.rowsBtnDidTap(self)
    }
    
    
}
