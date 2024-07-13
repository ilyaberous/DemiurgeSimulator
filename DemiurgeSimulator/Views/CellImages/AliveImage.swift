//
//  AliveImage.swift
//  DemiurgeSimulator
//
//  Created by Ilya on 13.07.2024.
//

import UIKit

class AliveImage: UIView {
    
    private lazy var emojiLabel: UILabel = {
       let emj = UILabel()
        emj.font = .systemFont(ofSize: 21, weight: .black)
        emj.text = Emoji.aliveEmoji
        return emj
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(emojiLabel)
        emojiLabel.centerInSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setBackgroundVerticalGradientLayer(topColor: .DSAliveGradientTop(), bottomColor: .DSAliveGradientBottom())
        layer.masksToBounds = true
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

