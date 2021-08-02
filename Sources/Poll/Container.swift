
class Container {
    
    static let shared = Container()
    
    
    private init() {}
    
    private var dependencies: [ContainerKey: Any] = [:]
    
    func register<T>(type: T.Type, name: String? = nil, service: Any) {
        let dependencyKey = ContainerKey(type: type, name: name)
        dependencies[dependencyKey] = service
    }
    
    func resolve<T>(type: T.Type, name: String? = nil) -> T? {
        let containerKey = ContainerKey(type: type, name: name)
        return dependencies[containerKey] as? T
    }
    
    
    
    
}
