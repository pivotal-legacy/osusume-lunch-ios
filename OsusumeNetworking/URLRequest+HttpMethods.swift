import Foundation

extension URLRequest {
    public static func get(urlString: String, headers: [String: String]) -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        for (headerKey, headerValue) in headers {
            request.addValue(headerValue, forHTTPHeaderField: headerKey)
        }

        return request
    }

    public static func post(
        urlString: String,
        headers: [String: String],
        body: [String: Any]
    ) -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        var request = URLRequest(url: url)

        do {
            let jsonBody = try JSONSerialization.data(withJSONObject: body, options: [])
            request.httpBody = jsonBody
        } catch {
            return nil
        }

        request.httpMethod = "POST"

        for (headerKey, headerValue) in headers {
            request.addValue(headerValue, forHTTPHeaderField: headerKey)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }
}
