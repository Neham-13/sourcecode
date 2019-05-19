//
//  CharacterDetailViewController.swift
//  Marvelicious
//
//  Created by Neha Mishra on 18/05/19.
//  Copyright © 2019 Neha Mishra. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var imgCharacter: UIImageView!
 
    @IBOutlet weak var nameCharacter: UILabel!
 
    @IBOutlet weak var descCharacter: UILabel!
    
    @IBOutlet weak var btnWebPage: UIButton!

    var selectedCharacter: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let character = selectedCharacter{
            nameCharacter.text = character.name
            if let url = URL(string: character.thumbnail.getUrl()){
                imgCharacter.kf.indicatorType = .activity
                imgCharacter.kf.setImage(with: url)
            } else {
                imgCharacter.image = UIImage(named: "no_avatar")
            }
            descCharacter.text = !character.description.isEmpty ? character.description : "No Description Available."
            if character.urls.count == 0{
                btnWebPage.isEnabled = false
                btnWebPage.setTitle("NA", for: .disabled)
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
