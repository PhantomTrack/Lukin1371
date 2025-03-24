import kotlinx.coroutines.*
import java.net.HttpURLConnection
import java.net.URL

fun main() = runBlocking {
    val websites = listOf(
        "https://www.google.com",
        "https://www.facebook.com",
        "https://www.github.com",
        "https://www.twitter.com",
        "https://www.instagram.com",
        "https://www.yandex.ru",
        "https://www.vk.com",
        "https://www.linkedin.com",
        "https://www.reddit.com",
        "https://www.netflix.com"
    )

    val jobs = websites.map { url ->
        async(Dispatchers.IO) {
            val isAvailable = checkWebsite(url)
            println("Сайт $url ${if (isAvailable) "доступен" else "недоступен"}")
        }
    }

    jobs.awaitAll()
}

fun checkWebsite(url: String): Boolean {
    return try {
        val connection = URL(url).openConnection() as HttpURLConnection
        connection.requestMethod = "HEAD"
        connection.connectTimeout = 5000
        connection.readTimeout = 5000
        connection.responseCode == HttpURLConnection.HTTP_OK
    } catch (e: Exception) {
        false
    }
}