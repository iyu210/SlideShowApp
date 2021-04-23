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
        
        imageView.isUserInteractionEnabled = true
      
        count = 0
        
        for i in 0...6{
            
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
        
        //timerが動いてるなら.

        if timer.isValid == true {
            //タイマー停止
            timer.invalidate()
            //ボタンのタイトル変更
            startStopButton.setTitle("再生", for: .normal)
            //nextButton,beforeButtonを使えるようにする
            nextButton.isEnabled = true
            beforeButton.isEnabled = true
            
        }

        else{
            //timerを生成する.
            startTimer()
            //ボタンのタイトル変更.
            startStopButton.setTitle("停止", for: .normal)
            //nextButton,beforeButtonを使えないようにする
            nextButton.isEnabled = false
            beforeButton.isEnabled = false
       
        }
        
        
    }
    
    @IBAction func onNext(_ sender: Any) {
        
        count = count + 1
        
        if count > 6 {
            count = 0
        }
        
        imageView.image = imageArray[count]
        
    }
    @IBAction func onPrev(_ sender: Any) {
        count = count - 1
        
        if count < 0  {
            count = 6
        }
        
        imageView.image = imageArray[count]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        secondViewController.image = imageView.image
        
    }
    
}
