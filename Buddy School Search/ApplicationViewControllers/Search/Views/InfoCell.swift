//
//  InfoCell.swift
//  Buddy School Search
//
//  Created by AppStarter on 08.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import UIKit

final class InfoCell: UITableViewCell {
    
    @IBOutlet private weak var infoLabel: UILabel!
    
    func decorate(withText text: String) {
        infoLabel.text = text
    }
    
    class var defaultHeight: CGFloat {
        return 72.0
    }
}
