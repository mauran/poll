
struct PollResponse: Encodable {
    
    var id: String
    
    
    
    
    func toDictionary() -> [String: Any] {
        return [
            "callback_id": id,
            "title": "",
            "attachment_type": "default",
            "fallback": "Your slack client does not support voting",
        ]
    }
    
}
