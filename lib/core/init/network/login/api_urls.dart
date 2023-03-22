enum ApiUrls {
  token,
  getVeriTabanlari,
  getIsletmelerSubeler,
}

   const  String _baseUrl = "http://ofis.bracket.com.tr:7575/pickerBracket/";
extension ApiUrlsExtension on ApiUrls{
  String get url{
    switch(this){
      case ApiUrls.token:
        return "${_baseUrl}token";
      case ApiUrls.getVeriTabanlari:
        return "${_baseUrl}api/General/GetVeritabanlari";
      case ApiUrls.getIsletmelerSubeler:
        return "${_baseUrl}api/General/GetIsletmelerSubeler";
      default:
        throw "Error";
    }
  }

}