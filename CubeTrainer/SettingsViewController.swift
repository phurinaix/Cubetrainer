//Setting theme (dark theme or white theme)
import UIKit
var isOn = true

class SettingsViewController: UIViewController {
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var general: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var inspecLbl: UILabel!
    @IBAction func theme(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "switchState")
        if sender.isOn {
            isOn = true
            setOn(for: self)
        }
        else{
            isOn = false
            setOff(for: self)
        }
    }
    func setOn(for viewController: UIViewController) {
        view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        test.text = "White Theme"
        test.textColor = UIColor.black
        general.textColor = UIColor.black
    }
    func setOff(for viewController: UIViewController){
        let color1 = hexStringToUIColor(hex: "#2C2C2C")
        let color2 = hexStringToUIColor(hex: "#101010")
        self.view.backgroundColor = color1
        navigationController?.navigationBar.barTintColor = color2
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        test.text = "Dark Theme"
        test.textColor = UIColor.white
        general.textColor = UIColor.white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButton.isOn =  UserDefaults.standard.bool(forKey: "switchState")
        isOn = switchButton.isOn
        if switchButton.isOn == true{
            setOn(for: self)
        }
        else{
            setOff(for: self)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
