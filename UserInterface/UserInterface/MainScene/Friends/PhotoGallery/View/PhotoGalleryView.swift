import UIKit

protocol IPhotoGalleryView: UIView {
    func setImages(photoNames: [String])
}

final class PhotoGalleryView: UIView {
    private var images = [UIImage]()
    private var mainImageView = UIImageView()
    private var secondaryImageView = UIImageView()
    private var isLeftSwipe = false
    private var isRightSwipe = false
    private var chooseFlag = false
    private var currentIndex = 0
    private var customPageView = UIPageControl()
    private var interactiveAnimator: UIViewPropertyAnimator!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

extension PhotoGalleryView: IPhotoGalleryView {
    func setImages(photoNames: [String]) {
        var images = [UIImage]()
        photoNames.forEach { (photoName) in
            if let image = UIImage(named: photoName) {
                images.append(image)
            }
        }
        self.images = images
        if self.images.count > 0 {
            self.mainImageView.image = self.images.first
        }
        self.customPageView.numberOfPages = self.images.count
    }
}

private extension PhotoGalleryView {
    func customizeView() {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(self.onPan(_:)))
        self.addGestureRecognizer(recognizer)
        self.backgroundColor = MainPallete.alabaster
        self.addSubviews()
        self.customizeImageViews()
        self.customizePageView()
        self.setConstraints()
    }
    
    func addSubviews() {
        self.addSubview(self.mainImageView)
        self.addSubview(self.secondaryImageView)
        self.addSubview(self.customPageView)
    }
    
    func customizeImageViews() {
        self.mainImageView.backgroundColor = MainPallete.alabaster
        self.mainImageView.contentMode = .scaleAspectFit
        self.secondaryImageView.contentMode = .scaleAspectFit
        self.secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
    }
      
    func customizePageView() {
        self.customPageView.backgroundColor = .clear
        self.customPageView.layer.zPosition = 100
        self.customPageView.numberOfPages = 1
        self.customPageView.currentPage = 0
        self.customPageView.currentPageIndicatorTintColor = .systemGray3
        self.customPageView.pageIndicatorTintColor = .systemGray4
    }
    
    func setConstraints() {
        self.mainImageView.translatesAutoresizingMaskIntoConstraints = false
        self.mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.secondaryImageView.translatesAutoresizingMaskIntoConstraints = false
        self.secondaryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.secondaryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.secondaryImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.secondaryImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.customPageView.translatesAutoresizingMaskIntoConstraints = false
        self.customPageView.frame = CGRect(x: 1, y: 1, width: 150, height: 50)
        self.customPageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.customPageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.bounds.height / 20).isActive = true
    }
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        if let animator = self.interactiveAnimator,
               animator.isRunning {
            return
        }
        
        switch recognizer.state {
        case .began:
            self.mainImageView.transform = .identity
            self.mainImageView.image = self.images[self.currentIndex]
            self.secondaryImageView.transform = .identity
            self.bringSubviewToFront(self.mainImageView)
            
            self.interactiveAnimator?.startAnimation()
            self.interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                              curve: .easeInOut,
                                                              animations: { [weak self] in
                                                                self?.mainImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
                                                              })
            self.interactiveAnimator.pauseAnimation()
            self.isLeftSwipe = false
            self.isRightSwipe = false
            self.chooseFlag = false
        case .changed:
            var translation = recognizer.translation(in: self)
            if translation.x < 0 && (!self.isLeftSwipe) && (!self.chooseFlag) {
                if self.currentIndex == (self.images.count - 1) {
                    self.interactiveAnimator.stopAnimation(true)
                    return
                }
                self.chooseFlag = true
                self.onChange(isLeft: true)
                
                self.interactiveAnimator.stopAnimation(true)
                self.interactiveAnimator.addAnimations { [weak self] in
                    self?.mainImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
                    self?.secondaryImageView.transform = .identity
                }
                self.interactiveAnimator.addCompletion({ [weak self] _ in
                    self?.onChangeCompletion(isLeft: true)
                })
                
                self.interactiveAnimator.startAnimation()
                self.interactiveAnimator.pauseAnimation()
                self.isLeftSwipe = true
            }
            
            if translation.x > 0 && (!self.isRightSwipe) && (!self.chooseFlag) {
                if self.currentIndex == 0 {
                    self.interactiveAnimator.stopAnimation(true)
                    return
                }
                self.chooseFlag = true
                self.onChange(isLeft: false)
                self.interactiveAnimator.stopAnimation(true)
                self.interactiveAnimator.addAnimations { [weak self] in
                    self?.mainImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                    self?.secondaryImageView.transform = .identity
                }
                self.interactiveAnimator.addCompletion({ [weak self] _ in
                    self?.onChangeCompletion(isLeft: false)
                })
                self.interactiveAnimator.startAnimation()
                self.interactiveAnimator.pauseAnimation()
                self.isRightSwipe = true
            }
            
            if self.isRightSwipe && (translation.x < 0) {
                return
            }
            if self.isLeftSwipe && (translation.x > 0) {
                return
            }
            
            if translation.x < 0 {
                translation.x = -translation.x
            }
            self.interactiveAnimator.fractionComplete = translation.x / (UIScreen.main.bounds.width)
            
        case .ended:
            if let animator = self.interactiveAnimator,
               animator.isRunning {
                return
            }
            var translation = recognizer.translation(in: self)
            
            if translation.x < 0 {translation.x = -translation.x}
            
            if (translation.x / (UIScreen.main.bounds.width)) > 0.5  {
                self.interactiveAnimator.startAnimation()
            }
            else {
                self.interactiveAnimator.stopAnimation(true)
                self.interactiveAnimator.finishAnimation(at: .start)
                self.interactiveAnimator.addAnimations { [weak self] in
                    self?.mainImageView.transform = .identity
                    guard let weakSelf = self else {return}
                    if weakSelf.isLeftSwipe {
                        self?.secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                    }
                    if weakSelf.isRightSwipe {
                        self?.secondaryImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
                    }
                }
                
                self.interactiveAnimator.addCompletion({ [weak self] _ in
                    self?.mainImageView.transform = .identity
                    self?.secondaryImageView.transform = .identity
                })
                
                self.interactiveAnimator.startAnimation()
            }
        default:
            return
        }
    }
    
    private func onChange(isLeft: Bool) {
        self.mainImageView.transform = .identity
        self.secondaryImageView.transform = .identity
        self.mainImageView.image = self.images[self.currentIndex]
        
        if isLeft {
            self.secondaryImageView.image = self.images[self.currentIndex + 1]
            self.secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        }
        else {
            self.secondaryImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
            self.secondaryImageView.image = self.images[self.currentIndex - 1]
        }
    }
    
    
    private func onChangeCompletion(isLeft: Bool) {
        self.mainImageView.transform = .identity
        self.secondaryImageView.transform = .identity
        if isLeft {
            self.currentIndex += 1
        }
        else {
            self.currentIndex -= 1
        }
        self.mainImageView.image = self.images[self.currentIndex]
        self.bringSubviewToFront(self.mainImageView)
        self.customPageView.currentPage = self.currentIndex
    }
}

