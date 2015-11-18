# Snippet

A minimal boilerplate mock server in Sinatra. To install and run the server, enter the terminal and run the following commands:

```git clone https://github.com/justjoeyuk/Snippet.git```

```cd Snippet```

```gem install sinatra```

```ruby Server.rb```


Voila! Your very own mock server with responses that can easily execute snippets. You are free to customise the application however you like, just know that the code to run the snippets is in "/Utils/ResponseUtility.rb". Have fun!


## The Problem

Mobile Developers sometimes need to make servers to mock responses from the API they're interacting with. The most common use for this seems to be for **UI Tests** and **Unit Tests**. There can be a problem when you're testing access tokens and other dynamic data that's returned from the API as you depend upon this data changing in your application.

For example, you are writing an application that caches the users data when they log in. This data includes an AccessToken which has an expiry date and an identifier. When the user logs in again, you want to refresh the token. If you want to test that this works with a mock server, you're in trouble because the data isn't dynamic.


## The Solution

The solution that Snippet provides, is "snippets" of ruby code in the responses that your mock server provides. The boilerplate project has a file structure that will grow nicely as your project scales.

If you want to hardcode a response, you can simply include the tag ```#{- YOUR CODE HERE -}``` in the response and it will be evaluated and substitued before the server returns the response. The code example below should clarify everything.

### JSON Example
```
{
  "user" : {
    "last-logged-in": "#{-
      require 'time' 
      Time.now.utc.iso8601-}"
  }
}
```

### XML Example
```
<response>
  <user>
    <last-logged-in>{-
      require 'time' 
      Time.now.utc.iso8601-}</last-logged-in>
  </user>
</response>
```

The above code demonstrates how simple, yet powerful, Snippet can be.


## Contributions

The project is open to contributions. If you wish to contribute, create an issue explaining what you're going to contribute and reference it in your pull request.
