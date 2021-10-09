//
//  photoViewController.swift
//  photoAPP
//
//  Created by 王昱淇 on 2021/10/7.
//

import UIKit

class photoViewController: UIViewController {
    @IBOutlet weak var blankView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = messageText
        photoImageView.image = filterImage
       
        let width: CGFloat = 309
        var height: CGFloat = 414
        
        if proportionSegmentedControlCase == 0 {
        } else if proportionSegmentedControlCase == 1 {
            height = width
        } else if proportionSegmentedControlCase == 2 {
            height = width / 4 * 3
        } else if proportionSegmentedControlCase == 3 {
            height = width / 16 * 9
        }
        photoImageView.frame = CGRect(x: (309 - width) / 2 + 33, y: (414 - height) / 2 + 37, width: width, height: height)
        
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
