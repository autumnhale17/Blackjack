//
//  SeeCard.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/9/26.
//

import UIKit

struct SeeCard {
    var suitC: String
    var rankC: String
    
    // Definition to tie the created name with the image name of a card
    var image: UIImage {
        get {
            let imageName = "\(suitC) \(rankC)"
            return UIImage(named: imageName) ?? UIImage()
        }
    }

    static let example = SeeCard(suitC: "Clubs", rankC: "Eight")
}
