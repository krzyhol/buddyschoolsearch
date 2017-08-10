//
//  ProfileCell.swift
//  Buddy School Search
//
//  Created by AppStarter on 08.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import UIKit

final class ProfileCell: UITableViewCell {

    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var teacherLabel: UILabel!
    @IBOutlet private weak var profileLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    
    func decorate(withProfile profile: Profile) {
        teacherLabel.text = profile.teacherLogin
        profileLabel.text = profile.profileTitle
        priceLabel.text = profile.profilePrice
        fetchImage(withURL: profile.teacherPhotoUrl)
    }
    
    private func fetchImage(withURL imageURL: URL?) {
        guard let url = imageURL else { return }
        let urlContents = try? Data(contentsOf: url)
        guard let imageData = urlContents else { return }
        profileImageView.image = UIImage(data: imageData)
    }
    
    class var defaultHeight: CGFloat {
        return 72.0
    }
    
}
