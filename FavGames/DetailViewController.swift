
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailView: UILabel!
    var Detail:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailView.text = Detail

    }

///go back to main viewController
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
 

}
