//
//  FeedCell.swift
//  feedly
//
//  Created by kou yamamoto on 2021/08/27.
//

import UIKit

final class FeedCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!

    func configure(feedItem: FeedItem) {
        titleLabel.text = feedItem.title
    }
}
