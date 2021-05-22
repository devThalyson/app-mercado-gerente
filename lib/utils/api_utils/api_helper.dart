class ApiHelper {
  String setUrl(String caminhoApi) {
    return "http://ip-local-host:8080/api/v1/$caminhoApi";
  }

  Map<String, String> setHeaders(
    String token,
  ) {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }
}
