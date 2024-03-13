
### 
    journalctl --since yesterday

###     
    journalctl --since yesterday --until "2 hours ago"

### 
    journalctl -u apache2.service
###
    journalctl -k

###
    journalctl -p <lvl>

Since there are so many log entries, it can be helpful to only see those of a certain priority. The highest priority is level 0, and the lowest is level 7. The log levels are as follows:

0. emergency
1. alert
2. critical
3. error
4. warning
5. notice
6. info
7. debug
