//
//  HomeViewController.swift
//  MercadoAli
//
//  Created by Ali Ahmadian shalchi on 11/10/2020.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listVC = storyboard.instantiateViewController(withIdentifier: "ProductList") as! ProductListViewController
        
        let searchBarText = searchBar.text
        listVC.searchedQuery = searchBarText
        navigationController?.pushViewController(listVC, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
 
}
