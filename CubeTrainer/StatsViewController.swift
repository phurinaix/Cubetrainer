/* Include
    -Best time
    -Worst time
    -Play time
*/
import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var playTime: UILabel!
    @IBOutlet weak var bestTime: UILabel!
    @IBOutlet weak var worstTime: UILabel!
    
    var playTimeString = String()
    var bestTimeString = String()
    var worstTimeString = String()
    var bestTimeBegin = Int()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bestTime.text = bestTimeString
        worstTime.text = worstTimeString
        playTime.text = playTimeString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
