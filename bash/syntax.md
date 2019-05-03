
# BASH Scripting Syntax

Bash script headline
    #!/bin/bash

## Switch/Case
~~~bash
case "$1" in
  start | up)
    vagrant up
    ;;

  *)
    echo "Usage: $0 {start|stop|ssh}"
    ;;
esac
~~~

## Iteration
~~~bash
for i in "${arrayName[@]}"; do
  echo $i
done
~~~


##
~~~bash

~~~

##
~~~bash

~~~

##
~~~bash

~~~





