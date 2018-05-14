Use `rate` function for counters as they're always increasing.

How many samples Prometheus is ingesting per-second averaged over one minute:
```
rate(prometheus_tsdb_head_samples_appended_total[1m])
```

Source:
* Prometheus: Up & Running (2018)
