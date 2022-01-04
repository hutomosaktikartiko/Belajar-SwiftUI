//
//  IGFeedPostTableViewCell.swift
//  Instagram
//
//  Created by Hutomo Sakti Kartiko on 03/01/22.
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {
    static let identifier = "IGFeedPostTableViewController"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        // configure the cell
    }
}

