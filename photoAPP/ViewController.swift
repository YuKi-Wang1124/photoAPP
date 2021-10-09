//
//  ViewController.swift
//  photoAPP
//
//  Created by 王昱淇 on 2021/10/6.
//

import UIKit
import CoreImage.CIFilterBuiltins

var messageText = ""
var filterImage: UIImage = UIImage(named: "IMG_0094")!
var proportionSegmentedControlCase = 0

class ViewController: UIViewController {
    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    @IBOutlet weak var intensitySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func addfilter() {
        let ciImage = CIImage(image: UIImage(named: "IMG_0094")!)
        let filter = CIFilter.colorMonochrome()
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        filter.intensity = intensitySlider.value
        switch filterSegmentedControl.selectedSegmentIndex {
        case 0 : filter.color = .red
        case 1 : filter.color = .blue
        case 2 : filter.color = .white
        case 3 : filter.color = .green
        default : filter.color = .gray
        }
        if let outputImage = filter.outputImage {
            filterImage = UIImage(ciImage: outputImage)
            imageView.image = filterImage
        }
    }
    
    @IBAction func textField(_ sender: UITextField) {
        messageText = sender.text!
    }
    
    @IBAction func proportionChange(_ sender: UISegmentedControl) {
        let width: CGFloat = 309
        var heigh: CGFloat = 414
        switch sender.selectedSegmentIndex {
        case 0 :
            heigh = 414
            proportionSegmentedControlCase = 0
        case 1 :
            heigh = width
            proportionSegmentedControlCase = 1
        case 2 :
            heigh = width / 4 * 3
            proportionSegmentedControlCase = 2
        default :
            heigh =  width / 16 * 9
            proportionSegmentedControlCase = 3
        }
        imageView.frame = CGRect(x: 54, y: (bottomImageView.frame.height - heigh) / 2 + 203, width: width, height: heigh)
    }
       
    @IBAction func filterSegmentedControlChange(_ sender: Any) {
        addfilter()
    }
    
  
    @IBAction func filterSliderChange(_ sender: Any) {
        addfilter()
    }
    
    @IBAction func closeKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}
