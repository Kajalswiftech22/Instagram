//
//  FormTableViewCell.swift
//  Instagram
//
//  Created by intern on 7/6/23.
//

import UIKit

class FormTableViewCell: UITableViewCell, UITextFieldDelegate {

    private let formLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let field: UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        return field
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        field.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with model: EditProfileViewController.EditProfileFormModel) {
        formLabel.text = model.label
        field.placeholder = model.placeHolder
        field.text = model.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //Mark: - Field
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
