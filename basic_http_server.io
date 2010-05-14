# Basic HTTP service is super-simple:
server := HttpServer clone do(
  setPort(8090)
  renderResponse := method(request, response,
    list("path", "uri", "body", "parameters") foreach(k, 
      v := request perform(k)
      response body appendSeq(k .. ": "  .. v .. "<br>")  
    )
  
    response body appendSeq("<hr>")
  
    request parameters keys sort foreach(k,
      v := request parameters at(k)
      response body appendSeq(k .. ": "  .. v .. "<br>")
    )
  )
)

server start
