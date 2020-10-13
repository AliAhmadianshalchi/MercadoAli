//
//  ProductDetailsViewController.swift
//  MercadoAli
//
//  Created by Ali Ahmadian shalchi on 11/10/2020.
//

import UIKit
import SDWebImage

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCondition: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product: Response.Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCell()
        
    }
    
    func setupCell() {
        self.productName.text = product?.title
        self.priceLabel.text = "$\(String(describing: product?.price))"
        self.productCondition.text = product?.condition?.capitalized == "New" ? "Nuevo" : "Usado"
        self.productImage.sd_setImage(with: URL(string: product?.thumbnail ?? ""), placeholderImage: UIImage(named: "default"))
    }
    


}
