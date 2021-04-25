//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 岩渕優児 on 2021/04/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image

            }
    
    @IBAction func unWind(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
