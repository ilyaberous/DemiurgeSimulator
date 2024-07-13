//
//  LifeCell.swift
//  DemiurgeSimulator
//
//  Created by Ilya on 13.07.2024.
//

import UIKit

class LifeCell: UITableViewCell {
    
    static let identifier = "life_cell"
    
    lazy var image = LifeImage()
    
    private lazy var cellStateLabel: UILabel = {
        let state = UILabel()
        state.text = Strings.lifeStateLabel
        state.font = .systemFont(ofSize: 20, weight: .bold)
        state.textColor = .black
        return state
    }()
    
    private lazy var additionalLabel: UILabel = {
        let additional = UILabel()
        additional.text = Strings.lifeAdditionalLabel
        additional.font = .systemFont(ofSize: 14, weight: .medium)
        additional.textColor = .black
        return additional
    }()
    
    private lazy var vStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [cellStateLabel, additionalLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [image, vStack])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillProportionally
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white.withAlphaComponent(0)
        contentView.backgroundColor = .white
        selectionStyle = .none
        
        setupUI()
    }
    
    override func layoutSubviews() {
          super.layoutSubviews()
          let margins = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
          contentView.frame = contentView.frame.inset(by: margins)
          contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        image.setDimensions(height: 50, width: 50)
        
        addSubview(hStack)
        hStack.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
}
