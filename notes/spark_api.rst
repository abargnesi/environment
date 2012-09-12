spark api
=========

Authentication
--------------
Spark API Authentication - Creates a session with ApiKey/ApiSig.  A successful session
returns an AuthToken in the response.  The response is something like:

::

  {
    "D" : {
      Success: true,
      Results: [ {
        AuthToken: "xxxxx",
        Expires: "2010-10-30T15:49:01-05:00"
      }]
    }
  }

The AuthToken will be usable for 24 hours although if idle it will expire in 1 hour.  The
AuthToken and ApiSig request parameters are required in all subsequent requests.  The AuthToken
is provided as is, but the ApiSig is created uniquely for each request.  For example the following
API request:

::

  https://api.sparkapi.com/v1/contacts

ApiSig is an MD5 created with the following format:

::

  [secret]ApiKey[key]ServicePath[service_path]param1[param1]...paramN[paramN][POST data]


