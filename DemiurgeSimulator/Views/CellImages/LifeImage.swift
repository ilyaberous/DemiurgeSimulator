//
//  LifeImage.swift
//  DemiurgeSimulator
//
//  Created by Ilya on 13.07.2024.
//

import UIKit

class LifeImage: UIView {
    
    private lazy var emojiLabel: UILabel = {
       let emj = UILabel()
        emj.font = .systemFont(ofSize: 21, weight: .black)
        emj.text = Emoji.lifeEmoji
        return emj
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(emojiLabel)
        emojiLabel.centerInSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setBackgroundVerticalGradientLayer(topColor: .DSLifeGradientTop(), bottomColor: .DSLifeGradientBottom())
        layer.masksToBounds = true
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
