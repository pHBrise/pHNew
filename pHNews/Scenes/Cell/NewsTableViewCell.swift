//
//  NewsTableViewCell.swift
//  pHNews
//
//  Created by Phanvit Chevamongkolnimit on 21/8/2567 BE.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var newsImageView: UIImageView?
    @IBOutlet var newsTitle: UILabel?
    @IBOutlet var newsDescription: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayNews(_ newsArticle:NewsArticle) {
        self.newsTitle?.text = newsArticle.title
        self.newsDescription?.text = newsArticle.description
        self.newsImageView?.sd_setImage(with: URL(string: newsArticle.urlImage ?? ""), placeholderImage: UIImage(named: "icon_image"))//sd_setImage(with: URL(string: newsArticle.urlImage ?? ""))
    }
}
