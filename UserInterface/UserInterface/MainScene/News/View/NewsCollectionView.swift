import UIKit

final class NewsCollectionView: UICollectionView {
    private let layout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: self.layout)
        self.backgroundColor = MainPallete.marble
        self.customizeCollectionView()
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewsCollectionView: UICollectionViewDelegate {
    
}

extension NewsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else {
            return UICollectionViewCell()
        }
        let news = New()
        cell.setDataForCell(name: news.name, date: news.date, avatar: news.avatar, description: news.description, image: news.image)
        return cell
    }
}

private extension NewsCollectionView {
    func customizeCollectionView() {
        self.layout.scrollDirection = .vertical
        self.layout.minimumLineSpacing = NewsConstraint.minimumLineSpacing
        self.layout.itemSize = CGSize(width: NewsConstraint.width, height: NewsConstraint.height)
        self.backgroundColor = .clear
        self.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.identifier)
    }
}
