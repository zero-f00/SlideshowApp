//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Yuto Masamura on 2019/01/06.
//  Copyright © 2019 Yuto Masamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var topImage: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var imageIndex = 0
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    let images = [UIImage(named: "imageA"), UIImage(named: "imageB"), UIImage(named: "imageC"),UIImage(named: "imageD")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageView = images[0]
        
        topImage.image = imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backImage(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        topImage.image = images[imageIndex]
    }
    
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        topImage.image = images[imageIndex]
    }
    
    @IBAction func startStop(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
                button.setTitle("一時停止", for: .normal)
                backButton.isEnabled = false
                nextButton.isEnabled = false
        } else {
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            } else {
                    if timer.isValid == true {
                        timer.invalidate()
                        button.setTitle("再生", for: .normal)
                        backButton.isEnabled = true
                        nextButton.isEnabled = true
                    } else {
                        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
                        button.setTitle("一時停止", for: .normal)
                        backButton.isEnabled = false
                        nextButton.isEnabled = false
                    }
            }
        }
    }
    
        @objc func onTimer(_ timer: Timer) {
            if imageIndex == 2 {
                imageIndex = 0
            } else {
                imageIndex += 1
            }
            topImage.image = images[imageIndex]
        }
    
    
    @IBAction func tapImage(_ sender: Any) {
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        
        secondViewController.image = topImage.image!
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}
