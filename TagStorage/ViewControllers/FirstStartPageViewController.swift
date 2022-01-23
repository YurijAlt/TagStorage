//
//  FirstStartPageViewController.swift
//  YourTags
//
//  Created by Юрий Альт on 07.11.2021.
//

import UIKit

class FirstStartPageViewController: UIPageViewController {

    //MARK: - Private Properties
    private var pages = [UIViewController]()
    private let pageControl = UIPageControl()
    private let initialPage = 0

    private var pageControlBottomAnchor: NSLayoutConstraint?
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }

    //MARK: - Private Methods
    private func setup() {
        dataSource = self
        delegate = self
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        let startVC1 = Start1ViewController()
        let startVC2 = Start2ViewController()
        let startVC3 = Start3ViewController()
        guard let startVC4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Start4ViewController") as? Start4ViewController else { return }
        
        let page1 = startVC1
        let page2 = startVC2
        let page3 = startVC3
        let page4 = startVC4
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true)
        
    }
    
    private func layout() {
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 150),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
        ])
        pageControlBottomAnchor = view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 2)
        
        pageControlBottomAnchor?.isActive = true
    }
    
    
    private func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = UIColor(named: "textColor")
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    @objc private func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
    }
    
}

//MARK: - Data Source Methods
extension FirstStartPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
    
    
}

//MARK: - Delegate Methods
extension FirstStartPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        pageControl.currentPage = currentIndex
        animateControlsIfNeeded()
    }

    private func animateControlsIfNeeded() {
            let lastPage = pageControl.currentPage == pages.count - 1
            
            if lastPage {
                hideControls()
            } else {
                showControls()
            }

            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        private func hideControls() {
            pageControlBottomAnchor?.constant = -80
        }

        private func showControls() {
            pageControlBottomAnchor?.constant = 16
        }  
}
