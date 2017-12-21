//
//  StatsViewController.swift
//  CubeTrainer
//
//  Created by user on 19/12/2560 BE.
//  Copyright © 2560 ANT. All rights reserved.
//

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
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
