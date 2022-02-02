import UIKit

final class NewsCollectionView: UICollectionView {
    private let layout = UICollectionViewFlowLayout()
    private var news = [New]()
    
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
    
    func setNews(news: [New]) {
        self.news = news
    }
}

extension NewsCollectionView: UICollectionViewDelegate {
    
}

extension NewsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else {
            return UICollectionViewCell()
        }
        
        cell.setDataForCell(name: self.news[indexPath.row].name,
                            date: self.news[indexPath.row].date,
                            avatar: self.news[indexPath.row].avatar,
                            description: self.news[indexPath.row].description,
                            image: self.news[indexPath.row].image)
        cell.setDataForCounter(heartCounter: self.news[indexPath.row].heartCounter,
                               commentCounter: self.news[indexPath.row].commentCounter,
                               shareCounter: self.news[indexPath.row].shareCounter,
                               browsingCounter: self.news[indexPath.row].browsingCounter)
        
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
