//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 岩渕優児 on 2021/04/21.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var beforeButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        count = 0
        
        for i in 0..<7{
            
            print(i)
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
            
        }
        
        
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer(){
        //タイマーを回す　2秒ごとにメソッドを呼ぶ
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate(){
        count = count + 1
        
        if count > 6 {
            count = 0
        }
        
        imageView.image = imageArray[count]
        
    }

    @IBAction func start(_ sender: Any) {
        //imageViewに画像を反映していく
        
        //Next, Beforeを押せなくする
        nextButton.isEnabled = false
        beforeButton.isEnabled = false
        //テキストを「停止」に変え、画像の流れをストップし、next, beforeを使えるようにする
        
        startTimer()
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        //画像を次に進める
        
    }
    
    @IBAction func before(_ sender: Any) {
        
    }
    
}

