//
//  ItemViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 4/20/24.
//

import UIKit

import SnapKit

class ProductViewController: UIViewController {

    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterLineSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        return collectionView
    }()

    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(products.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
    }

    private var products = Product.MockData

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        register()
    }

    private func setLayout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }

    private func register() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCollectionViewCell.self,
                                forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
}

extension ProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterLineSpacing
        return CGSize(width: doubleCellWidth / 2, height: 198)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return carrotLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return carrotInterLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return carrotInset
    }
}

extension ProductViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell()}
        cell.delegate = self
        cell.dataBind(products[indexPath.item], row: indexPath.item)
        return cell
    }
}

extension ProductViewController: ProductCollectionViewCellDelegate {
    func heartButtonDidTapEvent(state: Bool, row: Int) {
        products[row].isLiked = state
    }
}
