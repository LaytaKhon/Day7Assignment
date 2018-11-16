//
//  Beer.swift
//  Day7Assignment
//
//  Created by MIT App Dev on 11/13/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Beer : NSObject {
    
    var name : String? = nil
    
    var tagline : String? = nil
    
    var first_brewed : String? = nil
    
    var contributed_by : String? = nil
    
    var image_url : String? = nil
    
    var food_pairing : [String]? = nil
    
    var brewers_tips : String? = nil
    
    var desc : String? = nil
    
    var ingredients = ingerdiant()
    
    static func parseToBeer(_ data : JSON) -> Beer {
        
        let beer = Beer()
      //  let json = JSON(data)
        beer.name = data["name"].string
        beer.tagline = data["tagline"].string
        beer.desc = data["description"].string
        beer.first_brewed = data["first_brewed"].string
        beer.contributed_by = data["description"].string
        beer.image_url = data["image_url"].string
        beer.brewers_tips = data["brewers_tips"].string
        beer.contributed_by = data["contributed_by"].string
        //beer.ingredients = data["ingredients"].array
        beer.ingredients.malt = data["ingredients"]["malt"].array
        beer.ingredients.hops = data["ingredients"]["hops"].array
        beer.ingredients.yeast = data["ingredients"]["yeast"].string
        beer.food_pairing = data["food_pairing"].arrayValue.map { $0.stringValue }
        
        
        return beer
        
    }

    
}
