//
//  DetailsViewController.swift
//  Day7Assignment
//
//  Created by MIT App Dev on 11/12/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tag_line: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var foodParing: UITableView!
    
    @IBOutlet weak var brewer_tips: UILabel!
    @IBOutlet weak var contributer: UILabel!
    @IBOutlet weak var first_brew: UILabel!
    var foo : [String] = ["mg mg", "zaw zaw"]
    var data = Beer()
    var foodCount : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = data.name
        tag_line.text = data.tagline
        first_brew.text = data.first_brewed
        desc.text = data.desc
       // brewer_tips.text = data.brewers_tips
        contributer.text = data.contributed_by
        image.sd_setImage(with: URL(string: data.image_url ?? "icons8-champagne_bottle_filled"), placeholderImage : UIImage(named: "news"))
        //ingrediant.text = data.ingredients
        
        foodCount = (data.food_pairing?.count)!
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTap))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tap)
        
        self.foodParing.dataSource = self
        self.foodParing.delegate = self
        cellRegister()
       
    }
    
    func cellRegister(){
        let nib = UINib(nibName: "FoodTableViewCell", bundle: nil)
        self.foodParing.register(nib, forCellReuseIdentifier: "FoodTableViewCell")
    }
    
    @objc func imageTap() {
        print("tap working")
        let navigateController = self.storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as! UINavigationController
       let cv = navigateController.viewControllers[0] as! PhotoViewController
        cv.image = data.image_url!
        self.present(navigateController, animated: true, completion: nil)
    
    }

    

    @IBAction func back(_ sender: UIBarButtonItem) {
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

extension DetailsViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as! FoodTableViewCell
        let obj = data.food_pairing![indexPath.row]
        cell.name.text = obj
        print("food =>\(obj)")
        return cell
    }
    
    
}

extension DetailsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
    }
}
