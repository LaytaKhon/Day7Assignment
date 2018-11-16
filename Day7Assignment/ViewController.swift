//
//  ViewController.swift
//  Day7Assignment
//
//  Created by MIT App Dev on 11/11/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    var beerList : [Beer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homeCollectionView.dataSource = self
        self.homeCollectionView.delegate = self
        
        homeCollectionView?.backgroundColor = .clear
        homeCollectionView?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        getData()
    }
    
    func getData() {
        
        Alamofire.request("https://api.punkapi.com/v2/beers", method: .get).responseJSON { (response) in
            switch response.result {
                
            case .success:
                
                let api = response.value
                
                let json = JSON(api!)
                
                let data = json.array
                
                if let result = data {
                    var beerObj : [Beer] = []
                    result.forEach({ (beer) in
                        beerObj.append(Beer.parseToBeer(beer))
                    })
                    
                    self.beerList = beerObj
                    print(self.beerList)
                    self.homeCollectionView.reloadData()
                    
                }
            
                break
                
            case .failure:
                print("fail call")
                break
                
            }
            
        }
        
    }

}



extension ViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.beerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath)as! PhotoCollectionViewCell
        cell.ivImage.sd_setImage(with: URL(string: self.beerList[indexPath.row].image_url ?? "newicons8-champagne_bottle_filleds"), placeholderImage : UIImage(named: "news"))
        cell.lbTitle.text = self.beerList[indexPath.row].tagline
        cell.lbtype.text = self.beerList[indexPath.row].name
        return cell
    }
    
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      //  let nav = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController")as! UINavigationController
       // let cv = nav.viewControllers[0] as! DetailsViewController
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "BeerViewController")as! UINavigationController
         let cv = nav.viewControllers[0] as! BeerViewController
         let data = self.beerList[indexPath.row]
         var array : [DataObj] = []
        for i in data.ingredients.malt!{
            let obj = DataObj()
            obj.name = i["name"].stringValue
            obj.value = i["amount"]["value"].stringValue
            obj.unit = i["amount"]["unit"].stringValue
            array.append(obj)
        }
        
        for i in data.ingredients.hops!{
            let obj = DataObj()
            obj.name = i["name"].stringValue
            obj.value = i["amount"]["value"].stringValue
            obj.unit = i["amount"]["unit"].stringValue
            array.append(obj)
        }
        
        let obj = DataObj()
        obj.name = data.ingredients.yeast!
        array.append(obj)
        print("array=>\(array)")
        cv.data = data
        cv.array = array
       self.present(nav, animated: true, completion: nil)
    }
    
}

