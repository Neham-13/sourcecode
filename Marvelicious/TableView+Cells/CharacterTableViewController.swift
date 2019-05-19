//
//  CharacterTableViewController.swift
//  Marvelicious
//
//  Created by Neha Mishra on 18/05/19.
//  Copyright © 2019 Neha Mishra. All rights reserved.
//

import UIKit
import ObjectMapper

class CharacterTableViewController: UITableViewController {
    let requestCharacter = RequestCharacter()
    var characters: [Character] = []
    var loadingCharacters = false
    var currentPage = 0
    var total = 0
    var selectedCharacter: Character? = nil
    var nameSearch = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        confifureNib()
        if characters.count == 0{
            self.initActivityIndicator()
        }
        //searchBar.delegate = self
    }
    
    func initActivityIndicator(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    fileprivate func confifureNib(){
        let nibName = UINib(nibName: "CharacterTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "characterCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 82
    }
    
    private func loadData(){
        loadingCharacters = true
        requestCharacter.loadCharacters(name: nameSearch, page: currentPage) { (response) in
            switch response {
            case .success(let model):
                self.total = model.data.total
                self.characters.append(contentsOf: model.data.results)
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.loadingCharacters = false
            case .serverError(let description):
                print("Server error: \(description) \n")
            case .noConnection(let description):
                print("Server error noConnection: \(description) \n")
            case .timeOut(let description):
                print("Server error timeOut: \(description) \n")
            }
        }
    }
    
    private func cleanLoadDada(){
        characters = []
        nameSearch = ""
        loadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterTableViewCell
        cell.configureCell(with: characters[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82.0
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        //print("display row: \(indexPath.row)")
        if indexPath.row == (characters.count - 10) && !loadingCharacters && characters.count != total{
            currentPage += 1
            loadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCharacter = self.characters[indexPath.row]
        self.performSegue(withIdentifier: "CharacterDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CharacterDetail"{
            let view = segue.destination as! CharacterDetailViewController
            view.selectedCharacter = self.selectedCharacter
        }
    }
}


