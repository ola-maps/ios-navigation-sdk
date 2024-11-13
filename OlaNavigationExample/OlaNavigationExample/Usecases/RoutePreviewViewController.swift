//
//  RoutePreviewViewController.swift
//  OlaNavigationExample
//
//  Created by Abhishek Ravi on 12/08/24.
//

import UIKit
import OlaMapNavigation

class RoutePreviewViewController: BaseViewController {

    private let olaMap = OlaMapService(auth: .apiKey(key: AppUtility.getAPIKey()), tileURL: URL(string: "https://api.olamaps.io/tiles/vector/v1/styles/default-light-standard/style.json")!, env: .production, projectId: "Ola-Navigation")

    private let destinationCoordinate = OlaCoordinate(latitude: 12.923086586316643, longitude: 77.63758819612909)
    private let originCoordinate = OlaCoordinate(latitude: 12.9698, longitude: 77.7500)
    
    let popupDecoratedModel = PopupDecoratedModel(font: .systemFont(ofSize: 14), labelActiveColor: .red, labelInactiveColor: .white, activeBackgroudColor: .white, inactiveBackgroundColor: .gray, height: 32, cornerRadius: 4)
    
    lazy var directionResponseData = self.loadMockJSON("direction_one")
    
    private lazy var destinationMarker: OlaAnnotationView = {
        let annotationView =  CustomAnnotationView(identifier: "destination-marker", image: UIImage(named: "img_drop"))
        annotationView.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
        return annotationView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        self.initializeMap()
        self.createPreview(self.originCoordinate, self.destinationCoordinate)
        if let image = UIImage(named: "img_compass") {
            olaMap.setCustomCompassImage(image)
        }
    }

    func initializeMap() {
        olaMap.loadMap(onView: self.view, coordinate: originCoordinate)
        olaMap.addCurrentLocationButton(self.view)
        olaMap.setCurrentLocationMarkerColor(UIColor.systemGreen)
        olaMap.delegate = self
        olaMap.setMaxZoomLevel(16.0)
        olaMap.showCompassVisibility = true
        olaMap.setRotatingGesture(true)
    }
    
    // Draw Route Preview
    func createPreview(_ origin: OlaCoordinate, _ destination: OlaCoordinate) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { [weak self] in
            if let self = self {
             
                if let previewData = self.directionResponseData {
                    
                    self.olaMap.showRoutePreview(jsonData: previewData,
                                                 popupDecorator: self.popupDecoratedModel,
                                                 isTrafficSupported: true,
                                                 isEtaBadge: true,
                                                 edgePadding: UIEdgeInsets(top: 30, left: 10, bottom: 30, right: 10),
                                                 stops: nil)
                    self.addMarkers()
                }
                
            }
            
        })
    }
    
    func addMarkers() {
        self.olaMap.setAnnotationMarker(at: destinationCoordinate, annotationView: destinationMarker, identifier: "destination-marker")
    }
    
    deinit {
        print("❌ Route Preview Deinit")
    }
}

extension RoutePreviewViewController: OlaMapServiceDelegate {
    func didRouteSelected(_ route: OlaRoute) {
        
    }
    
    
    func didChangeCamera() {
        //TODO:
    }
    
    func regionIsChanging(_ gesture: OlaMapGesture) {
        //TODO:
    }
    
    func mapFailedToLoad(_ error: Error) {
     print("Map Fail")
    }
    
    
}
