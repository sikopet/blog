DevOps is a set of techniques to solve the chronic conflict between Development
an IT Operations. This conflict causes:
* increased time to market
* problematic code deployments
* increased number of Sev 1 outages
* unplanned work
* technical debt

The techniques are:
* cultural norms
* processes
* practices

The principles behind DevOps work patterns are the same principles that
transformed manufacturing.

DevOps has been formed by:
* Lean principles
* Agile Community
* infrastructure as code
* CI, CD
* Innovation Culture
* Toyota Kata

"The Three ways" are the underpinning principles that all the DevOps patterns
can be derived from.

The First Way
-------------

What
* left-to-right flow of work from Dev to Ops to the customer
* small batch sizes and intervals of works
* never passing defects to downstream work centers
* optimize for the global goals

Practices
* continuous build
* CI
* CD
* environments on demand
* limiting WIP
* building safe (to change) systems

The Second Way
--------------

What
* constant flow of fast feedback from right-to-left at all stages of the values
  stream

Practices
* stopping the production line when builds/tests go wrong
* constantly elevating the improvements of daily work over daily work
* fast automated test suites
* shared goals and shared pain between Devs and Ops
* pervasive telemetry

The Third Way
-------------

Culture that fosters:
* continual experimentation (risk taking and learning from success and failure)
* understanding that repetition and practice is the prerequisite to mastery

DevOps without Devs
-------------------

It's possible to apply these DevOps principles to any complex process:

1) Turn chaotic processes into repeatable, measurable ones.
* document process untill consitent => automate => self-service
* don't do IT tasks but maintain the system that does the IT tasks

2) Talk about problems and issues within and between teams.
* don't obscure or suffer through problems

3) Try new things, measure the results, keep the successes, and learn from the failures.
* create a culture of learning and experimentation

4) Do work in small batches so we can learn and pivot along the way.
* it's better to deliver some results each day than to hold back and deliver the entire result at the end
* you'll get feedback and fix problems sooner and avoid too much waisted effort

5) Drive configuration and infrastructure from machine readable sources kept under a source control system.
* IaC is flexible, testable and can benefit from software engineering techniques

6) Always be improving.
* always be identifying the next big bottleneck and experiment to fix it
* don't wait for a major disaster

7) Pull, don't push.
* determine the desired weekly output, allocate resources, and pull the work through the system to completion

8) Build community.
* you, your team, your company and world's IT community are interdependent

Source
------

* The Phoenix Project
* TPoSaNA
