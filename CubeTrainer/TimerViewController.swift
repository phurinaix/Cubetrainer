//
//  TimerViewController.swift
//  CubeTrainer
//
//  Created by user on 19/12/2560 BE.
//  Copyright © 2560 ANT. All rights reserved.
//

import UIKit

let ins = SettingsViewController()
class TimerViewController: UIViewController {

    
    @IBOutlet weak var adviceText: UILabel!
    @IBOutlet weak var scrambleText: UILabel!
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    var minutes: Int = 0
    var seconds: Int = 0
    var fractions: Int = 0
    var randomNumber:UInt32 = 0
    var scrambleOutput: String = ""
    var length: Int = 20
    var advice: String = ""
    var scrambleArr = ["R","R'","L","L'","F","F'","U","U'","B","B'","D","D'"]
    var timeArr = [String]()
    var minutesArr = [Int]()
    var secondsArr = [Int]()
    var fractionsArr = [Int]()
    var minutesSum: Int = 0
    var secondsSum: Int = 0
    var fractionsSum: Int = 0
    var allSum: Int = 0
    var playTime: Int = 0
    var bestTimeString: String = "No time"
    var worstTimeString: String = "No time"
    var bestTimeCompare: Int = 0
    var worstTimeCompare: Int = 0
    var worstTimeBegin: Int = 0
    var bestTimeBegin: Int = 999999
    //var averageSum: Int
    var stopwatchString: String = ""
    var round = true
    var timer = Timer()
    
    @IBAction func stats(_ sender: Any) {
        
    }
    
    @IBAction func start(_ sender: Any) {
        if round == true {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(TimerViewController.action), userInfo: nil, repeats: true)
            startButton.setTitle("Stop", for: .normal)
            adviceText.text = ""
            round = false
            }
        else{
            startButton.setTitle("Tap to start", for: .normal)
            adviceText.text = adviceShow(seconds: seconds)
            bestTime(minutes: minutes, seconds: seconds, fractions: fractions, stopwatchString: stopwatchString)
            worstTime(minutes: minutes, seconds: seconds, fractions: fractions, stopwatchString: stopwatchString)
            round = true
            scramble(length: length)
            playTime += 1
            fractions = 0
            seconds = 0
            minutes = 0
            timer.invalidate()
        }
    }
    @objc func action()
    {
        fractions += 1
        if fractions == 100{
            seconds += 1
            fractions = 0
        }
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        stopwatchString = "\(minutesString) : \(secondsString) : \(fractionsString)"
        timeArr.append(stopwatchString)
        minutesArr.append(minutes)
        secondsArr.append(seconds)
        fractionsArr.append(fractions)
        lbl.text = stopwatchString
        
    }
    
    func adviceShow(seconds: Int) -> String{
        if seconds < 3 { advice = "Impossible !!"}
        if seconds >= 3 && seconds <= 5 { advice = "New World Record"}
        if seconds > 5 && seconds < 10 { advice = "Perfect"}
        if seconds >= 10 && seconds < 15 { advice = "Very fast"}
        if seconds >= 15 && seconds < 20 { advice = "Fast"}
        if seconds >= 20 && seconds < 30 { advice = "Normal"}
        if seconds >= 30 { advice = "Slow"}
        if minutes >= 1 { advice = "Very Slow"}
        return advice
    }
    func scramble(length: Int){
        var l = length
        while(l > 0){
            randomNumber = arc4random_uniform(11)
            scrambleOutput += scrambleArr[Int(randomNumber)] + " "
            l -= 1
        }
        scrambleText.text = scrambleOutput
        scrambleOutput = ""
    }
    func bestTime(minutes: Int, seconds: Int, fractions: Int, stopwatchString: String){
        bestTimeCompare = ((minutes * 10000) + (seconds * 100) + fractions)
        if(bestTimeCompare < bestTimeBegin){
            bestTimeString = stopwatchString
            bestTimeBegin = bestTimeCompare
        }
    }
    func worstTime(minutes: Int, seconds: Int, fractions: Int, stopwatchString: String){
        worstTimeCompare = ((minutes * 10000) + (seconds * 100) + fractions)
        if(worstTimeCompare > worstTimeBegin){
            worstTimeString = stopwatchString
            worstTimeBegin = worstTimeCompare
        }
    }
//    func averageTime() -> String{
//        for index in 0...minutesArr.count{
//            minutesSum += minutesArr[index]
//            secondsSum += secondsArr[index]
//            fractionsSum += fractionsArr[index]
//        }
//        minutesSum *= 10000
//        secondsSum *= 100
//        allSum = minutesSum + secondsSum + fractionsSum
//        averageSum = allSum / minutesArr.count
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scramble(length: length)
        //scrambleText.text = String(ins)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let statsController = segue.destination as! StatsViewController
        statsController.playTimeString = String(playTime)
        statsController.bestTimeString = bestTimeString
        statsController.worstTimeString = worstTimeString
        statsController.bestTimeBegin = bestTimeBegin
        //timer.invalidate()
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
