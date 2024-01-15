//
//  MoviePinViewController.swift
//  SeSAC Week 3
//
//  Created by A_Mcflurry on 1/15/24.
//

import UIKit
import MapKit

class MoviePinViewController: UIViewController {

	var select: MovieKind = .all
	// 데이터셋은 대충 GPT한테 시켰습니다.
	var pins: [CustomAnnotation] = [
		 CustomAnnotation(title: "CGV",
								subtitle: "CGV인듯",
								coordinate: CLLocationCoordinate2D(latitude: 37.5232, longitude: 126.9809),
								type: .cgv),
		 CustomAnnotation(title: "롯데시네마",
								subtitle: "롯데시네마인듯",
								coordinate: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780),
								type: .lotte),
		 CustomAnnotation(title: "메가박스",
								subtitle: "메가박스인듯",
								coordinate: CLLocationCoordinate2D(latitude: 37.5483, longitude: 127.0838),
								type: .mega),
		 CustomAnnotation(title: "CGV시네마",
								subtitle: "CGV시네마인듯",
								coordinate: CLLocationCoordinate2D(latitude: 37.5535, longitude: 126.9451),
								type: .cgv),
		 CustomAnnotation(title: "롯데시네마",
								subtitle: "롯데시네마인듯",
								coordinate: CLLocationCoordinate2D(latitude: 37.5566, longitude: 126.9286),
								type: .lotte),
		 CustomAnnotation(title: "메가박스",
								subtitle: "메가박스인듯",
								coordinate: CLLocationCoordinate2D(latitude: 37.5780, longitude: 127.0303),
								type: .mega),
		 CustomAnnotation(title: "CGV",
								subtitle: "CGV인듯",
								coordinate: CLLocationCoordinate2D(latitude: 37.5805, longitude: 126.9242),
								type: .cgv),
		 CustomAnnotation(title: "메가시네마",
								subtitle: "메가시네마인듯",
								coordinate: CLLocationCoordinate2D(latitude: 37.5871, longitude: 127.0082),
								type: .mega),
		 CustomAnnotation(title: "롯데시네마",
								subtitle: "롯데시네마인듯",
								coordinate: CLLocationCoordinate2D(latitude: 37.6020, longitude: 126.9629),
								type: .lotte),
		 CustomAnnotation(title: "CGV센터",
								subtitle: "CGV터인듯",
								coordinate: CLLocationCoordinate2D(latitude: 37.4985, longitude: 127.0260),
								type: .cgv)
	]

	@IBOutlet weak var mapView: MKMapView!
	override func viewDidLoad() {
		super.viewDidLoad()
		setFilterButton()
		setupMapView()
		createAnnotaion()
		let initialRegion = MKCoordinateRegion(
			 center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780),
			 span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.4)
		)

		mapView.setRegion(initialRegion, animated: true)

	}
}

extension MoviePinViewController: MKMapViewDelegate {
	func setupMapView() {
		mapView.delegate = self
	}

	func createAnnotaion() {
		mapView.addAnnotations(pins)
	}
}

extension MoviePinViewController {
	func setFilterButton() {
		let barButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(clickRightButton))
		navigationItem.rightBarButtonItem = barButton
	}

	@objc func clickRightButton() {
		let alert =	UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
		let cancelButton = UIAlertAction(title: "취소", style: .cancel)
		alert.addAction(cancelButton)

		for item in MovieKind.allCases {
			let button = UIAlertAction(title: item.rawValue, style: .default) { _ in
				self.select = item
				print(self.select.rawValue)

				var filteredPins: [CustomAnnotation]
				switch self.select {
				case .mega: filteredPins = self.pins.filter({ $0.type == .mega })
				case .lotte: filteredPins = self.pins.filter({ $0.type == .lotte })
				case .cgv: filteredPins = self.pins.filter({ $0.type == .cgv })
				case .all: filteredPins = self.pins
				}

				let annotations: [MKAnnotation] = filteredPins
				self.mapView.removeAnnotations(self.mapView.annotations)
				self.mapView.addAnnotations(filteredPins)
			}
			alert.addAction(button)
		}

		present(alert, animated: true)
	}


}

class CustomAnnotation: NSObject, MKAnnotation {
	var title: String?
	var subtitle: String?
	@objc dynamic var coordinate: CLLocationCoordinate2D
	let type: MovieKind

	init(title: String? = nil, subtitle: String? = nil, coordinate: CLLocationCoordinate2D, type: MovieKind) {
		self.title = title
		self.subtitle = subtitle
		self.coordinate = coordinate
		self.type = type
	}
}

enum MovieKind: String, CaseIterable {
	case mega = "메가박스"
	case lotte = "롯데시네마"
	case cgv = "CGV"
	case all = "전체보기"
}
