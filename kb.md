I collect all the most common questions and answers to a knowledge base so that we can share and learn together.

> The good way to learn is sharing

----------

## Table of contents
[TOC]

## Knowledge base

### Why is Ruby considered slower than other programming languages like C/Go/Java...?

- Is a dynamic language - dynamic languages generate more CPU instructions than a compiled one.
- Is a interpreted language - interpreted languages will tend to be slower than a compiled one.
- Slow garbase collector.
- Method calls are slow.
- Does not support multi-threading (except JRuby).

### Why is Ruby on Rails slow?

- Written in Ruby - which is considered slower than other compiled programming languages because of its architecture.
- Features rich framework - it does a lot works per requests.
- It's only capable of excuting the code in single thread of single process. Ruby will spin an entire new process to handle each request and comsume a large amount of RAM.

### Why choosing Ruby on Rails

- Written in Ruby - a powerful and magically programming language.
- The speed at which you can develop.
- Matured web framework, with a huge of community and lot of gems. It's the most important.
- Database migration.
- Rails console - very powerful tool to quickly run extra queries, computations on the production without implementing new features.
- It is consistent with structure and methodology.
- Fully integrated with frontend technologies like SASS, Coffee.

### How to improve Ruby on Rails performance

- Consider using:
    - (JRuby](http://jruby.org/) - high performance and support real multi-threading.
    - [Ruby Enterprise Edition (REE)](http://www.rubyenterpriseedition.com/) - use 33% less memory on average and be compatible with Phusion Passenger.
- Use symbol instead of string if possible.
- Improve database queries.
- Use DBMS Group By or Math caculations instead of interating over every record and doing computations.
- When dealing with a large file, process files line by line until it reach EOF.
- Always think about avoiding making a copy of data, consider using: gsub!, map!, select!, reject!, ...
- Be aware when using each or map, because it iterate over collection in one chunk. Use find_each instead.
- Avoid using each_with_index if not needed, because it create an extra object while looping.
- Use Sidekiq/Resque as an asynchoronous queue for proccessing heavy jobs in the background.
- Caching:
    + Page caching (can not be used with before filter, eg: authentication).
    + Action caching.
    + Fragment caching.
    + Low level caching (using Rails.cache).
    + SQL caching (query caches will be destroyed at the end of the action).
    + HTTP caching.

### How to improve performance of web server

- Consider choosing a faster language to use CPU parallism:
    - Multi-processes to get around global VM locks like Ruby and Python.
    - Go's routines.
    - Elixir's processes.
    - Node's event driven.
    - Java multi-threading.

- Choosing a suitable framework is not less important than choosing programming languages. For example, if you decide to use Go, you have lot of things to consider a better framework between: Revel[^revel], Beego[^beego], Gin[^gin], Martini[^martini], Gorilla, Web.go[^web.go] or Goji[^goji],...

[^revel]: [Revel](http://revel.github.io/) - a fully featured, pretty not much setup, less third party dependencies framework, which is very appealing for many startups and small groups.

[^beego]: [Beego](https://beego.me/) - an open source framework to build and develop your applications in the Go way.

[^gin]: [Gin](https://gin-gonic.github.io/gin/) - extremely fast, 40 times faster than Martini.

[^martini]: [Martini](http://martini.codegangsta.io/) - extremely clean, good documentation, nice routing, great third party support base.

[^gorilla]: [Gorilla](http://www.gorillatoolkit.org/) - a web toolkit for Go programming language. 

[^web.go]: [Web.go](https://github.com/hoisie/web) - very lightweight and easy to create web application in Go.

[^goji]: [Goji](https://goji.io/) - A minimalistic and flexible request multiplexer for Go


- Consider about system architecture and application architecture:
    - Database replication.
    - Multiple application servers.
    - Load balancing with reverse proxy.
    - Ajax loading.
    - HTTP caching.
    - Memcache.
    - Client side caching.
    - Client side rendering.
    - Use background job processor to handle heavy jobs.
    - Optimize database queries:
        + Store Procedures/Functions.
        + Views.
    - Integrate 3rd party search engine like ElasticSearch, Solr, Sphinx for better searching, reducing heavy queries to database.
Networks:
    - Increase througput - how many requests our server can serve at the same time.
    - Decrease latency - latency is the amound of time it takes our server to respond to a singke request.

### What are the most common types of automation tests

There are three most common types of automation tests:
- Unit tests - individual, test a single piece of code, be isolated from other dependencies like network access or database access.
- Integration tests - multiple pieces are tested together. Eg: testing database access code against a test database.
- Acceptance tests (or also called functional tests) - test the entire of application. Eg: use Selenium to automatically run a browser.

### What are the differences between TDD and BDD

**TDD**
TDD (Test-Driven Development) is a process when you write and run your test to ensure that having a very high test coverage.

The TDD process consists of the following steps:
1. Start by writing a test
2. Run the test and any other tests. At this point, your newly added test should fail. If it doesn’t fail here, it might not be testing the right thing and thus has a bug in it.
3. Write the minimum amount of code required to make the test pass
4. Run the tests to check the new test passes
5. Optionally refactor your code
6. Repeat from 1

```flow
st=>start: Start
e=>end
op1=>operation: Start by writing a test
cond1=>condition: Run the test. Does it pass?
cond2=>condition: Run the test. Does it pass?
cond3=>condition: Run the test. Does it pass?
op2=>operation: Write the minimum amount of code
op3=>operation: Refactor code and test again
cond=>condition: Yes or No?

st->op1->cond1->op2->cond2->op3->cond3
cond1(yes)->op1
cond1(no)->op2
cond2(yes)->op3
cond2(no)->op2
cond3(yes)->e
cond3(no)->op2
```


Best way to make TDD easy:
1. Decide the inputs and outputs.
2. Choose function signature (what parameters, whether to return something)
3. Decide on one tiny aspect of the functionality.
4. Implement test.
5. Implement code.

**BDD**
BDD (Behavior-Driven Development) is a set of best practices for writting great tests. BDD should be used together with TDD and unit testing methods.

References:
    - [What’s the difference between Unit Testing, TDD and BDD?](https://codeutopia.net/blog/2015/03/01/unit-testing-tdd-and-bdd/)
    - [5 step method to make test-driven development and unit testing easy](https://codeutopia.net/blog/2016/10/10/5-step-method-to-make-test-driven-development-and-unit-testing-easy/)

## Contribution

I would very much welcome any contribution. Please make a Pull Request or send an email to Nobi Hoang <nobi.hoa@gmail.com>.
