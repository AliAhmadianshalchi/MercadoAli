//
//  ProductListViewController.swift
//  MercadoAli
//
//  Created by Ali Ahmadian shalchi on 12/10/2020.
//

import UIKit
import SDWebImage

class ProductListViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    @IBOutlet weak var productsTableView: UITableView!
    
    
    var searchedQuery: String?
    var productList: [Response.Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let SearchedQuery = searchedQuery else { return }
        ProductsApi().downloadProducts(query: SearchedQuery, complition: searchResponde(sr:))
       
    }
    
    func searchResponde(sr: Response){
        
        productList = sr.results
        
        DispatchQueue.main.async {
            self.productsTableView.reloadData()
        }
    }
    
    
    //MARK: - Cargar Celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = productList[indexPath.row]
        let cell = productsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductTableViewCell
        
        cell?.productImage.sd_setImage(with: URL(string: product.thumbnail ?? ""), placeholderImage: UIImage(named: "default"))
        cell?.productNameLabel.text = product.title
        cell?.productConditionLabel.text = product.condition
        cell?.productPriceLabel.text = String("$\(product.price)")
        
        
        
        return cell ?? UITableViewCell()
    }
    //MARK: - Seleccion Celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productList[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailsStoryBoard") as! ProductDetailsViewController
        
        detailVC.product = product
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return productList.count
        
    }
    
}
