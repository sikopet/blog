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
  individual pieces of data are called events.
* rawdata file - compressed file in an index bucket that contains event data
  plus journal information that the indexer can use to reconstitute the index's
index files.

Splunk is designed as a platform extensible via Apps and Add-ons. Both are
packaged sets of configuration.

* Apps - generally offer user interface
* Add-ons - generally enable digesting of particular type of data

"Search" is the default App.

Instance types (components)
---------------------------

Splunk data pipeline:

1. INPUT - receipt of raw data from log files, ports or scripts
2. PARSING (analyzing) - raw data split into events, time parsing, running
   transforms, setting base metadata, ...
3. INDEXING - data storage and optimization of indexes
4. SEARCH - running of queries and results presentation

These four stages of processing are generally split across two to four layers.

Forwarders (INPUT/PARSING)

* consume data on the machines where the data originates and then forward it to an indexer
* Universal Forwarder - Splunk minus indexing and searching
* full installation of Splunk can be configured as:
 * light forwarder (deprecated in 6.0) - no parsing, just sending of raw data to indexer
 * Heavy Forwarder - parse events and send them to the indexers
* important config files: inputs.conf, outputs.conf, props.conf,
  default-mode.conf, limits.conf

Indexers (PARSING/INDEXING)

* do the heavy lifting; parse and index the data and run searches
* needs direct access to fast disks (local, SAN); NFS is not recommended
* each indexer just indexes data and performs searches *across its own indexes*
* important config files: inputs.conf, indexes.conf

Search heads (SEARCH)

* search management, i.e. coordinate searches across the set of indexers, consolidating the results and presenting them to the user
* configuration mostly managed via web interface: Manager => Distributed
  Search

Deployment server

* tool for distributing configurations, apps, and content *updates* to groups of components (classes) - forwarders, non-clustered indexers, and search heads
* can't be used for initial or upgrade installation

.conf files
-----------

inputs.conf

* after leaving this stage data has some basic metadata associated with it:
  host, source, sourcetype, index

        # --- Cisco PIX ---
        [monitor:///logs/cisco_pix/*/*.log]
        
        # which parsing rules in props.conf to apply to these events
        # NOTE: important to set, otherwise explosion of sourcetypes will happen
        sourcetype = cisco:pix
        
        index = firewall_emea
        
        # set host from 3rd directory path segment
        host_segment = 3

props.conf

* which events to match based on host, source, and sourcetype

Searching
---------

* field - searchable name/value pair in event data

As events are stored by time, time is *always* the most efficient filter. After time, the most powerful keywords are `host`, `source`, `sourcetype`. The more you tell Splunk, the better the chance for good results.

Resources

* Implementing Splunk (Packt Publishing, 2015)
* http://docs.splunk.com/Splexicon
* http://docs.splunk.com/Documentation
