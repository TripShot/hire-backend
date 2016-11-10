# Welcome

Here you will find a set of exercises to help us get to know your
experience with Haskell. We want this to be fun and solved in the same
way you'd tackle a real project at work. Feel free to use online
documentation and incorporate additional libraries into the
project. This is setup as a stack project with lts-5.17. If you don't
know stack very well feel free to ask for help. Take a few days and if
you need more time just let us know.


## Setup

- Clone this repository to your local machine. Please do NOT fork it on github.
- Install [stack](http://docs.haskellstack.org/en/stable/README/) on your local machine.
- From the working directory, setup stack and build the skeleton code.
```
stack setup
stack build
```
After the initial setup, building your project just requires "stack build".


- Start the server and test the hello endpoint.
```
stack exec hire-backend-exe
```
From another shell:
```
curl 'http://localhost:8000/hello'
```
You should see "HELLO" after running curl.

- The server runs in the foreground, stop it using "Ctrl-C".

- As you work on these exercises you'll need to recompile and restart the server. One easy way to do this is using this shell pipeline:
```
stack build && stack exec hire-backend-exe
```

If you have problems up to this point, please don't suffer in silence, reach out to your contact at Tripshot.

Now you're ready to start!


## Add /math1 endpoint

In src/Web.hs you will find `start`, the server entry point.

Add a new GET endpoint at the path "/math1" that takes three query parameters :

- arg1, an integer
- arg2, an integer
- op, one of "add", "sub", "mul", "div"

The response should be the value of `op` applied to `arg1` and `args2`, as text/plain. Try to give decent error messages if the args are invalid.


## Add /math2 endpoint

Now add a slightly better version of /math1, POST "/math2" which takes a json request entity, A, like this:

```
[
  {
    "op" : "add",
    "arg1" : 123,
    "arg2" : -33
  },
  {
    "op" : "mul",
    "arg1" : 33,
    "arg2" : 22
  }
]
```

and responds with a json array, B. Each element of B must be a json number and correspond to the result of the operation in the respective element of A.

For example for the A above, B is :

[ 90, 726 ]


Hint : Don't parse the json yourself, use an existing json lib.


## A bit of state

Now we want to count how many times /math1 and /math2 have been called since the last server restart.
Add an endpoint /stats which returns a json response like so:

```
{
  "math1" : 4,
  "math2" : 9
}
```

Hint : The Snap monad used so far doesn't have anywhere to shove the
state. Instead of writing your endpoints in Snap, use your own type
which transforms Snap into another monad that can carry a context.
Try to figure this out on your own, but if you get stuck ask for
another hint.



## Rate limiting

Oh no, everyone wants to use your math service. Time to prevent abuse.

We're not going to add true authentication, but rather rate limit by
IP to keep it simple.

Implement the rule that a given IP can only call /math1 and /math2 a
total of 5 times per minute. If it exceeds this limit return a 403
http error code.

Its okay if the rate limits resets during server restart.


## A little math

The [winding number algorithm](http://geomalgorithms.com/a03-_inclusion.html#wn_PnPoly()) is a cool way to quickly tell if a point is within a polygon, even when the polygon crosses itself.

First implement the algorithm linked above, then add an endpoint that
allows callers to submit a polygon and a point and get back a
true/false response corresponding to whether the point is in the
polygon. Define the json request format yourself.


## A little testing

Now add suitable tests for your polygon inclusion algorithm. Use
whatever testing lib you think makes sense, however at least one test
needs to be a property test using QuickCheck.


## Tree traversal

Now look at src/Graph.hs. In there is a stubbed function `mostCommonInDescendents`. Implement that function according to the doc found there.

## Search

Also in src/Graph.hs, implement `breadthFirstSearch` according to the doc found there.


## Graph in IO

Now imagine the graph is too big to fit in memory. Traversing from a node to its children happens in IO, perhaps it calls out to a database.
Implement `mostCommonInDescendentsM` and `breadthFirstSearchM` which are the monadic equivalent to the pure functions you wrote above.


## Wrapping up

When you are done, execute the following:

```
stack clean
stack sdist
```

That last command will put a source tarball somewhere under
.stack-work, read the last line to find it. Email that tarball back to
us.

We are always interested in improving our hiring processes, so
feedback about the exercises is welcome.

Congratulations, you are done. Thanks for your interest in Tripshot!

