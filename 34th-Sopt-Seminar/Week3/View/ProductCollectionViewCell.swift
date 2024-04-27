//
//  ProductCollectionViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 4/20/24.
//

import UIKit

protocol ProductCollectionViewCellDelegate: AnyObject {
    func heartButtonDidTapEvent(state: Bool, row: Int)
}

class ProductCollectionViewCell: UICollectionViewCell {

    static let identifier = "ProductCollectionViewCell"

    weak var delegate: ProductCollectionViewCellDelegate?
    var itemRow: Int?

    private let productImageView = UIImageView()

    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()

    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(.love, for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setLayout()
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLayout() {
        [
            productImageView,
            nicknameLabel,
            priceLabel,
            heartButton
        ].forEach {
            self.addSubview($0)
        }
    }

    private func setAutoLayout() {
        productImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(59)
        }

        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }

        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }

        heartButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(productImageView).inset(8)
            $0.size.equalTo(16)
        }
    }

    func dataBind(_ product: Product, row: Int) {
        productImageView.image = product.productImage
        nicknameLabel.text = product.name
        priceLabel.text = product.price
        heartButton.isSelected = product.isLiked
        self.itemRow = row
    }

    @objc func heartButtonDidTap() {
        self.heartButton.isSelected.toggle()
        self.heartButton.tintColor = .red
        if let itemRow {
            self.delegate?.heartButtonDidTapEvent(state: self.heartButton.isSelected,
                                                  row: itemRow)
        }
    }

}
