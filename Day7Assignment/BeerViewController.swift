//
//  BeerViewController.swift
//  Day7Assignment
//
//  Created by MIT App Dev on 11/16/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    var data = Beer()
    var ingrediant = ingerdiant()
    var array : [DataObj] = []
    var array1 : [DataObj] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainCollectionView.dataSource = self
        self.mainCollectionView.delegate = self
        
        cellRegister()
        let obj1 = DataObj()
        obj1.name = "Brewers_tips : "
        obj1.value = data.brewers_tips ?? ""
        array1.append(obj1)
        
        let obj2 = DataObj()
        obj2.name = "Contributed_by : "
        obj2.value = data.contributed_by ?? ""
        array1.append(obj2)
        
      
    }
    
    func cellRegister(){
        CellRegisterUtil.cellRegister(nibName: "ImageCollectionViewCell", collectionView: self.mainCollectionView)
        CellRegisterUtil.cellRegister(nibName: "DetailCollectionViewCell", collectionView: self.mainCollectionView)
        CellRegisterUtil.cellRegister(nibName: "IngrediantCollectionViewCell", collectionView: self.mainCollectionView)
        CellRegisterUtil.cellRegister(nibName: "DecThingsCollectionViewCell", collectionView: self.mainCollectionView)
        CellRegisterUtil.cellRegister(nibName: "brewTipCollectionViewCell", collectionView: self.mainCollectionView)
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
extension BeerViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 2{
            return array.count
        }
        else if section == 3 {
            return data.food_pairing!.count
        }
        else if section == 4 {
            return array1.count
        }
        
    
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
            cell.ivImage.sd_setImage(with: URL(string: data.image_url ?? "icons8-champagne_bottle_filled"), placeholderImage: UIImage(named: "icons8-champagne_bottle_filled"))
           
           // print("image=>\(data.image_url)")
            return cell
        }else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
            cell.name.text = data.name
            cell.tagLine.text = data.tagline
            cell.firstBrewed.text = data.first_brewed
            cell.descText.text = data.desc
            return cell
        }else if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IngrediantCollectionViewCell", for: indexPath) as! IngrediantCollectionViewCell
            let obj = array[indexPath.row]
            print("obj=>\(obj)")
            var st = obj.name
            st += " ("+obj.value+" "+obj.unit+")"
            print("st=>\(st)")
            cell.name.text = st
            return cell
        }
        else if indexPath.section == 3{
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DecThingsCollectionViewCell", for: indexPath) as! DecThingsCollectionViewCell
            cell.name.text = data.food_pairing![indexPath.row]
            print("food paring=>\(data.food_pairing![indexPath.row])")
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "brewTipCollectionViewCell", for: indexPath) as! brewTipCollectionViewCell
            cell.lbText.text = array1[indexPath.row].name
            cell.brewerText.text = array1[indexPath.row].value
            return cell
        }
    
        
    }
    
    
}

extension BeerViewController : UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: self.view.frame.width, height: 200)
        }
        else if indexPath.section == 1{
            return CGSize(width: self.view.frame.width, height: 250)
        }
        else if indexPath.section == 2{
            return CGSize(width: self.view.frame.width, height: 30)
        }
        else{
            return CGSize(width: self.view.frame.width, height: 30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as! UINavigationController
            let cv = nav.viewControllers[0] as! PhotoViewController
            cv.image = data.image_url ?? "icons8-champagne_bottle_filled"
            self.present(nav, animated: true, completion: nil)
        }
    }
}
