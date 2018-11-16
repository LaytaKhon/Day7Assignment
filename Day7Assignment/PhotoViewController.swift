//
//  PhotoViewController.swift
//  Day7Assignment
//
//  Created by MIT App Dev on 11/12/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    var image : String = ""
    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
       uiImage.sd_setImage(with: URL(string: image ?? "icons8-champagne_bottle_filled"), placeholderImage : UIImage(named: "news"))
        // Do any additional setup after
       
        self.scrollview.minimumZoomScale =   1.0
        self.scrollview.maximumZoomScale = 6.0
        //self.scrollview.delegate = self as! UIScrollViewDelegate
        
         self.scrollview.addSubview(uiImage)
    }
    
    @IBAction func bcak(_ sender: UIBarButtonItem) {
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
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let subView = scrollView.subviews[0] // get the image view
        let offsetX = max((scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5, 0.0)
        let offsetY = max((scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5, 0.0)
        // adjust the center of image view
        subView.center = CGPoint(x: scrollView.contentSize.width * 0.5 + offsetX, y: scrollView.contentSize.height * 0.5 + offsetY)
    }

}

