import '../models/country.dart';

class QueriesAndMutations {
  registerMutation(String email, String username, String password,
      String phoneNumber, String referralCode, Country country) {
    return """
    mutation{
  register(data:{
    email:"$email",username:"$username"
    ,password:"$password",
    phonenumber:"$phoneNumber",
    referralCode:"$referralCode",
    phoneNumberDetails:{
      phoneNumber:"${phoneNumber}",
      callingCode:"${country.callingCode}",
      flag:"${country.flag}"
    },
    country:"${country.name}",
    currency:"${country.currencySymbol}"
  }
  ) {
     user{
      _id,
      email
    },
  token
  }
  }
    """;
  }

  loginMutation(String email, String password) {
    return """
  mutation {login(data:{
    input:"$email",
    ,password:"$password"
  }
  ) {
     user{
      _id,
      email
    },
  token
  }  
  } 
  
    """;
  }

  resendVerificationCodeQuery(String email) {
    return """
    query {resendVerificationCode(data:{
    email:"$email"
  }
  )
  }
    """;
  }

  verifyUser(String code) {
    return """
    query {resendVerificationCode(data:{
    email:$code
  }
  )
  }
    """;
  }

  getCountriesQuery() {
    return """
    query {getActiveCountries{
  name,
  callingCode,
  currencyCode,
  callingCode,
  flag,
} 
   } """;
  }
}
