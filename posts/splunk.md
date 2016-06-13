Basics
------

Splunk stores data it indexed and its indexes within *flat files* in a structured directory (`$SPLUNK_HOME/var/lib/splunk`), meaning it doesn't require any database software running in the background. Splunk breaks data into events based on the timestamps it identifies.

* index - the repository for data that resides in flat files. It's made of
  buckets.
* bucket - a file system directory containing a portion of index and raw data.
  An index tipycally consists of many buckets, organized by age: hot, warm,
cold, frozen, thawed (hot bucket is being written to, and has not necessarily
been optimized).
* event data - all IT data that has been added to software indexes. The
  individual pieces of data are called envents.
* rawdata file - compressed file in an index bucket that contains event data
  plus journal information that the indexer can use to reconstitute the index's
index files.

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

Forwarders

* Universal Forwarder - Splunk minus indexing and searching
* Full installation of Splunk can be configuread as:
 * light forwarder (deprecated) - no parsing, just sending of raw data to indexer
 * heave Forwarder - parse events and send them to the indexers
* important config files: inputs.conf, outputs.conf, props.conf,
  default-mode.conf, limits.conf

Indexers

* parsing and indexing of events; sometimes searching
* needs direct access to fast disks (local, SAN); NFS is not recommended
* important config files: inputs.conf, indexes.conf

Search

* configuration mostly managed via web interface: Manager => Distributed
  Search

Searching
---------

As events are stored by time, times is *always* the most efficient filter. After time, the most powerful keywords are `host`, `source`, `sourcetype`. The more you tell Splunk, the better the chance for good results.

Resources

* Implementing Splunk (Packt Publishing, 2015)
* https://docs.splunk.com/Splexicon
