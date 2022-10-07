import Appwrite
import AppwriteModels
import Foundation

/*
  'req' variable has:
    'headers' - object with request headers
    'payload' - request body data as a string
    'variables' - object with function variables

  'res' variable has:
    'send(text, status)' - function to return text response. Status code defaults to 200
    'json(obj, status)' - function to return JSON response. Status code defaults to 200
  
  If an error is thrown, a response with code 500 will be returned.
*/

func main(req: RequestValue, res: RequestResponse) -> RequestResponse {
  let client = Client()

  // You can remove services you don't use
  let account = Account(client)
  let avatars = Avatars(client)
  let database = Databases(client)
  let functions = Functions(client)
  let health = Health(client)
  let locale = Locale(client)
  let storage = Storage(client)
  let teams = Teams(client)
  let users = Users(client)

  if (req.variables["APPWRITE_FUNCTION_ENDPOINT"] == nil || req.variables["APPWRITE_FUNCTION_API_KEY"] == nil) {
    print("Environment variables are not set. Function cannot use Appwrite SDK.")
  } else {
    client
      .setEndpoint(req.variables["APPWRITE_FUNCTION_ENDPOINT"]!)
      .setProject(req.variables["APPWRITE_FUNCTION_PROJECT_ID"]!)
      .setKey(req.variables["APPWRITE_FUNCTION_API_KEY"]!)
  }

  return res.json(data: [
    "areDevelopersAwesome": true
  ])
}
