import Foundation

protocol INewModel {
    func getNews() -> [New]
}

final class NewModel {
    var news: [New]?
    
    init() {
        self.news = self.setupNews()
    }
}

extension NewModel: INewModel {
    func getNews() -> [New] {
        return self.news ?? []
    }
}

private extension NewModel {
    func setupNews() -> [New] {
        var news = [New]()
        news.append(New(name: "Hello Kitty", date: "11.11.2022", avatar: "HelloKitty", description: "my photo", image: "HelloKitty", heartCounter: 12, commentCounter: 2, shareCounter: 23, browsingCounter: 213))
        news.append(New(name: "Pusheen", date: "22.02.2012", avatar: "Pusheen-1", description: "my photo", image: "Pusheen-1", heartCounter: 3, commentCounter: 3, shareCounter: 3, browsingCounter: 3))
        news.append(New(name: "Frog", date: "23.03.2003", avatar: "frog", description: nil, image: "frog", heartCounter: 4, commentCounter: 5, shareCounter: nil, browsingCounter: 7))
        return news
    }
}
