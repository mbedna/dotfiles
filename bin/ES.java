import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

public class ES {
    public static void main (String[] args) {
		HttpClient httpClient = HttpClient.newBuilder()
        .connectTimeout(Duration.ofMillis(5000)).build();
		HttpRequest request = HttpRequest.newBuilder()
				.timeout(Duration.ofMillis(5000))
				.uri(URI.create("http://elasticsearch.most-dev:9200"))
                .version(HttpClient.Version.HTTP_1_1)
				.GET()
				.build();
		try {
			HttpResponse<String> res = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
			System.out.println("body: " + res.body() + " - " + res.statusCode());
		} catch (java.io.IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
    }
}
