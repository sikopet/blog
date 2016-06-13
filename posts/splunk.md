Basics
------

Splunk stores data it indexed and its indexes within *flat files* in a structured directory (`$SPLUNK_HOME/var/lib/splunk`), meaning it doesn't require any database software running in the background. Splunk breaks data into events based on the timestamps it identifies.

* event data - raw data after indexing; composed of events
* searchable events - events + information about Splunk's structure and processing
* bucket - raw data + indexes

Splunk is designed as a platform extensible via Apps and Technology Add-ons (TAs):

* Apps - extended functionality + standard features (like saved searches, dashboard, defined inputs) + own user interfaces
* TAs - only additional functionality

Search is the default App.

Instance types
--------------

Splunk data pipeline:

1. INPUT - receipt of raw data from log files, ports or scripts
2. PARSING (analyzing) - raw data split into events, time parsing, running
   transforms, setting base metadata, ...
3. INDEXING - data storage and optimization of indexes
4. SEARCHING - running of queries and results presentation

These four stages of processing are generally split across two to four layers.

Forwardes
* Universal Forwarder - Splunk minus indexing and searching
* Full installation of Splunk can be configuread as:
 * light forwarder (deprecated) - no parsing, just sending of raw data to indexer
 * heave Forwarder - parse events and send them to the indexers

Searching
---------

As events are stored by time, times is *always* the most efficient filter. After time, the most powerful keywords are `host`, `source`, `sourcetype`. The more you tell Splunk, the better the chance for good results.

Resources

* Implementing Splunk (Packt Publishing, 2015)
